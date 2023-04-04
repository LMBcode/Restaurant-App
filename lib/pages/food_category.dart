

import 'package:flutter/material.dart';

import '../foods_list.dart';

class CategoryFood extends StatefulWidget {
  const CategoryFood({super.key});

  @override
  State<CategoryFood> createState() => _CategoryFoodState();
}

class _CategoryFoodState extends State<CategoryFood> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }



  Widget itemFood(MenuItem menuItem){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
           SizedBox(
              width: 100,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                    child: Image.asset(menuItem.image, width: 50, height: 50)),
              ),
              Padding(
                padding: EdgeInsets.all(18),
                child: Text(menuItem.name),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    Icon(Icons.add),
                    Padding(padding: EdgeInsets.only(top: 8))
                  ],
                ),
              )

      ],);
  }
}