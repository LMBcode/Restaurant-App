import 'package:chatapp/pages/menu/menu_page.dart';
import 'package:flutter/material.dart';
import 'foods_list.dart';

class HomePage extends StatefulWidget {
  final Function(BuildContext context, String foodType) onFoodTypeSelected;
  final Function(BuildContext context, MenuItem food) onFoodSelected;
  final Function(BuildContext context, String food) onFoodClick;
  const HomePage(
      {Key? key,
      required this.onFoodTypeSelected,
      required this.onFoodSelected,
      required this.onFoodClick})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  bool _isSearching = false;
  List<MenuItem> _searchResults = [];

  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<MenuItem> recommendedMenuItems =
      menuItems.where((item) => item.isRecommended).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.menu,
          color: Colors.amber,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Colors.amber,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: header(),
      ),
    );
  }

    Widget _buildSearchResults() {
    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (BuildContext context, int index) {
         return category(_searchResults[index]);     
      },
    );
  }

  Widget category(MenuItem menuItem) {
    return GestureDetector(
      onTap: () => widget.onFoodSelected(context,menuItem),
      child: Column(
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
      ),
    );
  }


  Widget header() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's eat",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              "Food.",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: _searchController,
              onChanged: (value) {
                if (value.trim().isEmpty) {
                  setState(() {
                    _isSearching = false;
                  });
                } else {
                  setState(() {
                    _isSearching = true;
                    _searchResults = menuItems
                        .where((item) => item.name
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                }
              },
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.amber,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none),
                  hintText: "Search Food",
                  prefixIcon: const Icon(Icons.search),
                  prefixIconColor: Colors.white),
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
        ConstrainedBox(constraints : BoxConstraints(maxHeight: MediaQuery.of(context).size.height),child: Flexible(child: _isSearching ? _buildSearchResults() : body()))

      ],
    ));
  }

  Widget body(){
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foods.length,
                    itemBuilder: (BuildContext context, int index) {
                      return food(foods[index]);
                    },
                  ),
                ),
            ),
              section("Recommended Products"),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendedMenuItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return recommendedProduct(recommendedMenuItems[index]);
                      },
                    ),
                  )),
              section("Most Popular"),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: foodType.length,
                        itemBuilder: (BuildContext context, int index) {
                          return mostPopularProduct(foodType[index]);
                        })),
              ),
          ],
        ),
      );
  }

  Widget food(Food item) {
    return GestureDetector(
      onTap: () => widget.onFoodClick(context, item.type),
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.amber,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: [
                Flexible(
                    child: Image.asset(
                  item.image,
                  width: 50,
                  height: 50,
                )),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(item.type),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget section(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            "See all",
            style: TextStyle(color: Colors.amber),
          )
        ],
      ),
    );
  }

  Widget recommendedProduct(MenuItem menuItem) {
    return GestureDetector(
      onTap: () => widget.onFoodSelected(context, menuItem),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, right: 25),
        child: Card(
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
            width: 200,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(menuItem.image, width: 100, height: 100),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        menuItem.name,
                        style: const TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '\$${menuItem.price}',
                        style: const TextStyle(color: Colors.amber),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget mostPopularProduct(Food food) {
    return GestureDetector(
        onTap: () => onFoodTypeSelected(context, food.type),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Card(
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
                        child: Image.asset(food.image, width: 50, height: 50)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(food.type),
            )
          ],
        ));
  }

  void onFoodTypeSelected(BuildContext context, String foodType) {
    widget.onFoodTypeSelected(context, foodType);
  }
}
