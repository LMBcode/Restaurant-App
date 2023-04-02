import 'package:flutter/material.dart';
import 'foods_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: header(),
      ),
    );
  }

  Widget header() {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Icon(Icons.list), Icon(Icons.person)],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Let's eat",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Healthy foods.",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Container(
            height: 50,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: "Search",
                      contentPadding: EdgeInsets.only(top: 50),
                      hintStyle: TextStyle(color: Colors.white),
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.start,
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {
                    },
                  ),
                ),
                const Icon(Icons.search),
              ],
            ),
          ),
        ),
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
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: section(),
        )
      ],
    ));
  }

  Widget food(Food item) {
    return Padding(
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
    );
  }

  Widget section() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              "Recommended Products",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "See all",
              style: TextStyle(color: Colors.amber),
            )
          ],
        ),

        
      ],
    );
  }
}
