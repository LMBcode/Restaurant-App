import 'package:chatapp/home_page.dart';
import 'package:chatapp/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';


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
      const SplashPage()
    );
  }
}

