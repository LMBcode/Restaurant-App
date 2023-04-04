



import 'package:chatapp/home_page.dart';
import 'package:chatapp/pages/menu_page.dart';
import 'package:chatapp/pages/order_page.dart';
import 'package:flutter/material.dart';

import 'components/bottom_nav.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [
    const OrderPage(),
    HomePage(
    onFoodTypeSelected: (BuildContext context, String foodType) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuPage(foodType: foodType),
        ),
    );
  },
  ),
    const OrderPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNav(onTabChange:(index) => navigateBottomBar(index)),
      body: _pages[_selectedIndex]
      /* Padding(
        padding: const EdgeInsets.all(8.0),
        child: header(),
      ), */
    );
  }
}