import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  Map<String, dynamic>? paymentIntent;
  late SharedPreferences pref;
  double amount = 0;

  @override
  void initState() {
    super.initState();
     _initSharedPreferences(); // Initialize _prefsFuture here
  }

  Future<SharedPreferences> _initSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    pref = prefs;
    setState(() {
      amount = pref.getDouble("finaltotalPrice") ?? 0;
    });
    return prefs;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stripe Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Make Payment : $amount'),
              onPressed: () async {
            
                  await makePayment();
              
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent =
          await createPaymentIntent(amount.toInt().toString(), 'USD');

      // Ensure paymentIntent is not null before initializing the PaymentSheet
      if (paymentIntent != null) {
        //STEP 2: Initialize Payment Sheet
        try {
          await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], // Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Ikay',
            ),
          );
            print('PaymentSheet initialized');

        } catch (e) {
          print('Error initializing PaymentSheet: $e');
          return;
        }

        //STEP 3: Display Payment sheet
        displayPaymentSheet();
      } else {
        print('Payment intent creation failed');
      }
    } catch (err) {
      throw Exception(err);
    }
  }



  Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      //Request body
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      //Make post request to Stripe
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      print('Payment Intent response: ${response.body}');
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  String calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        //Clear paymentIntent variable after successful payment
        paymentIntent = null;
          print('Payment successful');

      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
    } catch (e) {
      print('$e');
    }
  }
}
