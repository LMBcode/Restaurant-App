class Food {
  final String type;
  final String image;

  Food({required this.type, required this.image});
}


List<Food> foods = [
  Food(type: 'Foods', image: 'images/foods.png'),
  Food(type: 'Fruit', image: 'images/fruits.png'),
  Food(type: 'Vegetable', image: 'images/vegetables.png'),
  Food(type: 'Juice', image: 'images/juices.png'),
];

class MenuItem{
  final String name;
  final String image;
  final String price;

  MenuItem({required this.name ,required this.image , required this.price});

}

List<MenuItem> menuItems = [
  MenuItem(name: 'Pizza Margherita', image: 'images/pizza_margherita.png', price: '\$12'),
  MenuItem(name: 'Cheeseburger', image: 'images/cheeseburger.png', price: '\$10'),
  MenuItem(name: 'Caesar Salad', image: 'images/caesar_salad.png', price: '\$8'),
  MenuItem(name: 'Pasta Carbonara', image: 'images/pasta_carbonara.png', price: '\$14'),
  MenuItem(name: 'Grilled Salmon', image: 'images/grilled_salmon.png', price: '\$18'),
  MenuItem(name: 'Tacos', image: 'images/tacos.png', price: '\$6'),
  MenuItem(name: 'Sushi Platter', image: 'images/sushi_platter.png', price: '\$22'),
  MenuItem(name: 'Fried Chicken', image: 'images/fried_chicken.png', price: '\$10'),
  MenuItem(name: 'Steak', image: 'images/steak.png', price: '\$20'),
  MenuItem(name: 'Veggie Stir-Fry', image: 'images/veggie_stir_fry.png', price: '\$12'),
];
