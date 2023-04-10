import 'package:chatapp/presentation/PricesPreferencesVM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:view_model_x/view_model_x.dart';

import '../food_viewmodel.dart';
import '../foods_list.dart';

class FoodDetails extends StatelessWidget {
  final MenuItem menuItem;

  const FoodDetails({super.key, required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: FoodDetailsWrapper(menuItem: menuItem),
    );
  }
}

class FoodDetailsWrapper extends StatefulWidget {
  final MenuItem menuItem;
  

  const FoodDetailsWrapper({super.key, required this.menuItem});

  @override
  _FoodDetailsWrapperState createState() => _FoodDetailsWrapperState();
}

class _FoodDetailsWrapperState extends State<FoodDetailsWrapper> {

  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) => setState(() {
      pref = value;
    }));
  }


  @override
  Widget build(BuildContext context) {
    final counterViewModel = Provider.of<CounterViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: part(widget.menuItem, context, counterViewModel),
    );
  }

  Widget part(MenuItem menuItem, BuildContext context,CounterViewModel counterViewModel) {
    Size size = MediaQuery.of(context).size;
      counterViewModel.getCurrentPrice(menuItem.price);
    return Column(
      children: [
        Image.asset(
          menuItem.image,
          height: size.height * 0.25,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Text(menuItem.name,
                    style: const TextStyle(
                        fontSize: 30,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal)),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.timer,
                            size: 18,
                          ),
                          Text(
                            "${menuItem.preparationTime} min",
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.local_fire_department,
                              size: 18,
                            ),
                            Text(
                              "${menuItem.kcal} kcal",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 40), // Add extra padding to the right
                      child: Stack(clipBehavior: Clip.none, children: [
                        Container(
                          width: 172,
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Text(
                            "\$${counterViewModel.currentPrice}",
                            style: const TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Positioned(
                          left: 60,
                          child: Container(
                            width: 120,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: counterViewModel.decrementQuantity,
                                    child: const Icon(Icons.remove)
                                    
                                    ),
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    child: Center(child: Text(counterViewModel.amountCounterState.toString())),
                                  ),
                                    InkWell(
                                        onTap: counterViewModel.incrementQuantity,
                                        child: const Icon(
                                          Icons.add,
                                        ),
                                      ),
                                ]),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                    Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text("Ingredients : ${menuItem.ingredients}" , style: const TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
              ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: ElevatedButton(
                        onPressed: () {pref.setInt("totalPrice",counterViewModel.currentPrice);},
                        style: ElevatedButton.styleFrom(primary: Colors.blue),
                        child: const Text("Save Price"),
                      ),
                    ),

                    Text(pref.get("totalPrice").toString()),
                    
             
              ],
              
            ),
          ),
          
        ),
  
      ],
    );
  }
} 
