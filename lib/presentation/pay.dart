import 'dart:convert';
import 'package:chatapp/presentation/StripePaymentRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'StripePaymentVM.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StripePaymentVM(paymentRepository: StripePaymentRepo()),
      child: const PayPage(),
    );
  }
}


class PayPage extends StatefulWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  State<PayPage> createState() => _PayPageState();
}

class _PayPageState extends State<PayPage> {
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
                  final paymentViewModel = Provider.of<StripePaymentVM>(context,listen: false);
                  await paymentViewModel.makePayment(amount);
              
              },
            ),
          ],
        ),
      ),
    );
  }
}