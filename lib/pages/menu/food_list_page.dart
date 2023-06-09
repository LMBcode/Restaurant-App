

import 'package:flutter/material.dart';

import '../../foods_list.dart';

class FoodsListPage extends StatefulWidget {
  final String food;
  const FoodsListPage({super.key,required this.food});

  @override
  State<FoodsListPage> createState() => _FoodsListPageState();
}

class _FoodsListPageState extends State<FoodsListPage> {

  late List<MenuItem> filteredMenuItems;

    @override
  void initState() {
    super.initState();
    filteredMenuItems = menuItems.where((it) => it.category.toLowerCase().contains(widget.food.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.amber,
          ),
        ),
        
      ),
            body: filteredMenuItems.isNotEmpty
          ? ListView.builder(
              itemCount: filteredMenuItems.length,
              itemBuilder: (BuildContext context, int index) {
                return category(filteredMenuItems[index]);  
              },
            )
          : const Center(
              child: Text("No food"),
            ),
    );
  }


  Widget category(MenuItem menuItem) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Image.asset(menuItem.image, width: 50, height: 50)),
                  ),
                ),
              ),
              Text(
                menuItem.name,
                style: const TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  const Icon(Icons.shopping_cart),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text("\$" + menuItem.price.toString()),
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }

}