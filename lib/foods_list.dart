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
  final String category;
  bool isRecommended;

  MenuItem({required this.name ,required this.image , required this.price,required this.type,required this.category,this.isRecommended = false});

}



List<MenuItem> menuItems = [
  MenuItem(name: 'Caesar Salad', image: 'images/caesar_salad.png', price: '\$8',type:"Salad",category:'Veggies',isRecommended : true),
  MenuItem(name: 'Grilled Salmon', image: 'images/grilled_salmon.png', price: '\$18',type:"Salmon",category:'Food',),

  MenuItem(name: 'Tacos', image: 'images/tacos.png', price: '\$6',type:"Tacos",category:'other',isRecommended : true),

  MenuItem(name: 'Sushi', image: 'images/black_sushi.png', price: '\$22',category:'Sushi',type:"Sushi"),
  MenuItem(name: 'Sushi', image: 'images/sushisa.png', price: '\$22',type:"Sushi",category:'Sushi',isRecommended : true),
  MenuItem(name: 'Sushi Platter', image: 'images/sushi_platter.png', price: '\$22',category:'Sushi',type:"Sushi"),
  MenuItem(name: 'Sushi', image: 'images/othersushi.png', price: '\$22',type:"Sushi",category:'Sushi',isRecommended : true),

  MenuItem(name: 'Pizza Margherita', image: 'images/piazza_margherita.png', price: '\$12',category:'Food',type:"Pizza"),
  MenuItem(name: 'Pizza Chicken', image: 'images/pizza_chicken.png', price: '\$10',type:"Pizza",category:'Food',isRecommended : true),
  MenuItem(name: 'Tomato Pizza', image: 'images/pizza_tomato.png', price: '\$10',category:'Food',type:"Pizza"),

  MenuItem(name: 'Pasta Carbonara', image: 'images/pasta_carbonara.png', price: '\$14',type:"Pasta",category:'Food',isRecommended : true),
  MenuItem(name: 'Pasta Bolognese', image: 'images/bolognese.png', price: '\$14',category:'Food',type:"Pasta"),
  MenuItem(name: 'Pasta Carbonara', image: 'images/pasta_carbonara.png', price: '\$14',category:'Food',type:"Pasta"),

  MenuItem(name: 'Hambburger', image: 'images/hambur.png', price: '\$10',type:"Burger",category:'Food',isRecommended : true),
  MenuItem(name: 'Cheeseburger', image: 'images/cheeseburger.png', price: '\$10',category:'Food',type:"Burger"),
  MenuItem(name: 'Cheeseburger', image: 'images/cheeseburger.png', price: '\$10',category:'Food',type:"Burger"),

  MenuItem(name: 'Steak', image: 'images/steak.png', price: '\$20',type:"Meats",category:'Food',isRecommended : true),
  MenuItem(name: 'Steak', image: 'images/steak.png', price: '\$20',type:"Meats",category:'Food',),

  MenuItem(name: 'Veggie Stir-Fry', image: 'images/veggie_stir_fry.png', price: '\$12',type:"Veggie",category:'Food',isRecommended : true),

  MenuItem(name: 'Strawberry', image: 'images/strawberry.png', price: '\$5',category:'Fruit', type: 'Fruit'),

  MenuItem(name: 'Strawberry Juice ', image: 'images/strawberryjuice.png', price: '\$5', type: 'Juice',category:'Fruit',),
  
  MenuItem(name: 'Orange', image: 'images/orange.png', price: '\$5', type: 'Fruit',category:'Fruit',),

  MenuItem(name: 'Orange Juice', image: 'images/orangejuice.png', price: '\$5', type: 'Juice',category:'Juice',),

  MenuItem(name: 'Lemon', image: 'images/lemon.png', price: '\$5', type: 'Fruit',category:'Fruit'),

  MenuItem(name: 'Lemon Juice', image: 'images/lemonjuice.png', price: '\$5', type: 'Juice',category:'Juice'),

  MenuItem(name: 'Apple', image: 'images/apple.png', price: '\$5', type: 'Fruit',category:'Fruit',)





];

