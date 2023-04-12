
import 'package:chatapp/presentation/StripePaymentRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePaymentVM extends ChangeNotifier{
  final StripePaymentRepo _paymentRepository;
  Map<String, dynamic>? paymentIntent;

    StripePaymentVM({required StripePaymentRepo paymentRepository})
      : _paymentRepository = paymentRepository;



        Future<void> makePayment(double amount) async {
    try {
      //STEP 1: Create Payment Intent
      paymentIntent =
          await _paymentRepository.createPaymentIntent(amount.toInt().toString(), 'USD');

      // Ensure paymentIntent is not null before initializing the PaymentSheet
      if (paymentIntent != null) {
        //STEP 2: Initialize Payment Sheet
        try {
          await Stripe.instance.initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret:
                  paymentIntent!['client_secret'], // Gotten from payment intent
              style: ThemeMode.light,
              merchantDisplayName: 'Lamine',
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