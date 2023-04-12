import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../foods_list.dart';

class ItemRow extends StatefulWidget {
  MenuItem menuItem;
  List<String> itemList;
  final SharedPreferences pref;final VoidCallback onQuantityChanged;final int index;
  final VoidCallback onDeleteItem;
  ItemRow({required this.menuItem, required this.pref, required this.onQuantityChanged,required this.itemList,required this.index,required this.onDeleteItem});


  @override
  State<ItemRow> createState() => _ItemRowState();
}

class _ItemRowState extends State<ItemRow> {
  int item_quantity = 1;
  int itemPrice = 0;

  @override
  void initState() {
    super.initState();
      item_quantity = widget.pref.getInt("quantity_${widget.menuItem.name}") ?? 1;
    itemPrice = widget.pref.getInt("itemTotalPrice_${widget.menuItem.name}") ?? widget.menuItem.price;
  }

    void updateQuantity(int newQuantity) {
      int oldQuantity = item_quantity;
      int oldItemTotalPrice = itemPrice * oldQuantity;
      int newItemTotalPrice = widget.menuItem.price * newQuantity;

      setState(() {
        item_quantity = newQuantity;
        widget.pref.setInt("quantity_${widget.menuItem.name}", newQuantity);
        widget.pref.setInt("itemTotalPrice_${widget.menuItem.name}", newItemTotalPrice);
      });

        widget.onQuantityChanged(); 

    }

    


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
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
                        child:
                            Image.asset(widget.menuItem.image, width: 50, height: 50),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.menuItem.name,
                          style: const TextStyle(
                              fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
                        ),
                        Text(
                         "\$ ${widget.pref.getInt("itemTotalPrice_${widget.menuItem.name}") ?? itemPrice}",
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
                      IconButton(
                          onPressed: () {
                            if (item_quantity > 1) {
                              updateQuantity(--item_quantity);
                            }
                          },
                          icon: const Icon(Icons.remove)),
                      Center(
                        child: Text(item_quantity.toString()),
                      ),
                      IconButton(
                          onPressed: () {
                            updateQuantity(++item_quantity);
                          },
                          icon: const Icon(Icons.add)),
                    ],
                  )
                ],
              ),
            ),
          ),
          IconButton(onPressed: (){
              setState(() {
                widget.itemList.removeAt(widget.index);
                widget.pref.setStringList("itemListKey", widget.itemList);
                
              }
              );
              widget.onDeleteItem();
          },
           icon: const Icon(Icons.delete))
        ],
      ),
    );
  }
}
