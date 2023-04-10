import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../food_viewmodel.dart';
import '../foods_list.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: const OrderPageWrapper(),
    );
  }
}

class OrderPageWrapper extends StatefulWidget {
  const OrderPageWrapper({super.key});

  @override
  State<OrderPageWrapper> createState() => _OrderPageStateWrapper();
}

class _OrderPageStateWrapper extends State<OrderPageWrapper> {
  List<String> itemList = [];
  late SharedPreferences pref;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      pref = value;
      setState(() {
        itemList = pref.getStringList("itemListKey") ?? [];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final counterViewModel = Provider.of<CounterViewModel>(context);
    int taxRate = 10;
    int subtotal = pref.getInt("totalPriceKey") ?? 0;
    double taxes = double.parse((subtotal * (taxRate / 100)).toStringAsFixed(2));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                "My Order",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12.0),
                child: Text(
                  "Take out",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    MenuItem menuItem = getMenuByName(itemList[index]);
                    return itemRow(menuItem);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(" \$ $subtotal")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Taxes",
                    style: TextStyle(fontSize: 8),
                  ),
                  Text(" \$ ${taxes}")
                ],
              ),
              Text("------------------------------------------------------------------------"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(fontSize: 8),
                  ),
                    Text(" \$ ${double.parse((subtotal + taxes).toStringAsFixed(2))}")
                ],
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      setState(() {
                        itemList.clear();
                        pref.setStringList("itemListKey", itemList);
                      });
                    },
                    child: Text("Button")),
              )
            ],
          ),
        ),
      ),
    );
  }

  MenuItem getMenuByName(String name) {
    return menuItems.firstWhere((menuItem) => menuItem.name == name);
  }

  Widget itemRow(MenuItem menuItem) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(menuItem.image, width: 50, height: 50),
                ),
              ),
              Column(
                children: [
                  Text(
                    menuItem.name,
                    style: const TextStyle(
                        fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$ ${menuItem.price}",
                    style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.normal,
                        color: Colors.red),
                  ),
                ],
              )
            ]),
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                const Center(
                  child: Text("1"),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
