import 'package:chatapp/home_page.dart';
import 'package:chatapp/pages/food_detail.dart';
import 'package:chatapp/pages/menu/food_list_page.dart';
import 'package:chatapp/pages/menu/menu_page.dart';
import 'package:chatapp/pages/order_page/order_page.dart';
import 'package:chatapp/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'components/bottom_nav.dart';
import 'foods_list.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: "assets/.env");

  //Assign publishable key to flutter_stripe
  Stripe.publishableKey =
      "pk_test_51Mu1QlC8YchvtD8dCBSsDWzVgALzkiNAdlhXJTK4yFx3Aikm5ZgXnfY8Rx1gH8tegogC6TIFSc0ecmT3AtD0Q8yY00sOsoJEPC";

      await Stripe.instance.applySettings();


  //Load our .env file that contains our Stripe Secret key
  
  runApp(const Main());
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange,fontFamily: 'Montserrat'),
      home: 
      const MainPage()
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _selectedIndex = 0;

  void navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List<Widget> _pages = [
    HomePage(
    onFoodTypeSelected: (BuildContext context, String foodType) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MenuPage(foodType: foodType),
        ),
    );
  },
  onFoodClick: (context, String food) => {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FoodsListPage(food: food)))
  },
  onFoodSelected: (BuildContext context , MenuItem menuItem){
          Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetails(menuItem: menuItem),
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      /* Padding(
        padding: const EdgeInsets.all(8.0),
        child: header(),
      ), */
    );
  }
}

