import 'package:chatapp/home_page.dart';
import 'package:chatapp/splash.dart';
import 'package:flutter/material.dart';

import 'data/PricesPreference.dart';

Future<void> main() async {

  
  runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange,fontFamily: 'Montserrat'),
      home: const SplashPage()
    );
  }
}

