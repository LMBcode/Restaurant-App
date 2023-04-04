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

List<Food> foodType = [
  Food(type: 'Burger', image: 'images/hamburger.png'),
  Food(type: 'Pizza', image: 'images/pizza.png'),
  Food(type: 'Cakes', image: 'images/cake-slice.png'),
  Food(type: 'Meats', image: 'images/meat.png'),
  Food(type: 'Sushi', image: 'images/sushi.png'),
  Food(type: 'Salad', image: 'images/salad.png'),

];

class MenuItem{
  final String name;
  final String image;
  final String price;
  final String type;
  bool isRecommended;

  MenuItem({required this.name ,required this.image , required this.price,required this.type,this.isRecommended = false});

}



List<MenuItem> menuItems = [
  MenuItem(name: 'Caesar Salad', image: 'images/caesar_salad.png', price: '\$8',type:"Salad",isRecommended : true),
  MenuItem(name: 'Grilled Salmon', image: 'images/grilled_salmon.png', price: '\$18',type:"Salmon"),

  MenuItem(name: 'Tacos', image: 'images/tacos.png', price: '\$6',type:"Tacos",isRecommended : true),
  MenuItem(name: 'Tacos', image: 'images/tacos.png', price: '\$6',type:"Tacos"),

  MenuItem(name: 'Sushi Platter', image: 'images/sushi_platter.png', price: '\$22',type:"Sushi"),
  MenuItem(name: 'Sushi Platter', image: 'images/sushi_platter.png', price: '\$22',type:"Sushi",isRecommended : true),
  MenuItem(name: 'Sushi Platter', image: 'images/sushi_platter.png', price: '\$22',type:"Sushi"),

  MenuItem(name: 'Pizza Margherita', image: 'images/piazza_margherita.png', price: '\$12',type:"Pizza"),
  MenuItem(name: 'Pizza', image: 'images/fried_chicken.png', price: '\$10',type:"Pizza",isRecommended : true),
  MenuItem(name: 'Pizza', image: 'images/fried_chicken.png', price: '\$10',type:"Pizza"),
  MenuItem(name: 'Pizza', image: 'images/fried_chicken.png', price: '\$10',type:"Pizza"),
  MenuItem(name: 'Pizza', image: 'images/fried_chicken.png', price: '\$10',type:"Pizza"),

  MenuItem(name: 'Pasta Carbonara', image: 'images/pasta_carbonara.png', price: '\$14',type:"Pasta",isRecommended : true),
  MenuItem(name: 'Pasta Carbonara', image: 'images/pasta_carbonara.png', price: '\$14',type:"Pasta"),
  MenuItem(name: 'Pasta Carbonara', image: 'images/pasta_carbonara.png', price: '\$14',type:"Pasta"),

  MenuItem(name: 'Cheeseburger', image: 'images/cheeseburger.png', price: '\$10',type:"Burger",isRecommended : true),
  MenuItem(name: 'Cheeseburger', image: 'images/cheeseburger.png', price: '\$10',type:"Burger"),
  MenuItem(name: 'Cheeseburger', image: 'images/cheeseburger.png', price: '\$10',type:"Burger"),

  MenuItem(name: 'Steak', image: 'images/steak.png', price: '\$20',type:"Meats",isRecommended : true),
  MenuItem(name: 'Steak', image: 'images/steak.png', price: '\$20',type:"Meats"),
  MenuItem(name: 'Steak', image: 'images/steak.png', price: '\$20',type:"Meats"),

  MenuItem(name: 'Veggie Stir-Fry', image: 'images/veggie_stir_fry.png', price: '\$12',type:"Veggie",isRecommended : true),
];

