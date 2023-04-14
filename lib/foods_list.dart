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

class MenuItem {
  final String name;
  final String image;
  final int price;
  final String type;
  final String category;
  final List<String> ingredients;
  final int preparationTime;
  final int kcal;
  bool isRecommended;

  MenuItem({
    required this.name,
    required this.image,
    required this.price,
    required this.type,
    required this.category,
    required this.ingredients,
    required this.preparationTime,
    required this.kcal,
    this.isRecommended = false,
  });
}

List<MenuItem> menuItems = [
  MenuItem(
    name: 'Caesar Salad',
    image: 'images/caesar_salad.png',
    price: 8,
    type: "Salad",
    category: 'Veggies',
    isRecommended: true,
    ingredients: [
      'Romaine lettuce',
      'Croutons',
      'Parmesan cheese',
      'Caesar dressing'
    ],
    preparationTime: 20,
    kcal: 350,
  ),
  MenuItem(
    name: 'Grilled Salmon',
    image: 'images/grilled_salmon.png',
    price: 8,
    type: "Salmon",
    category: 'Foods',
    ingredients: ['Salmon fillet', 'Olive oil', 'Salt', 'Pepper', 'Lemon'],
    preparationTime: 30,
    kcal: 520,
  ),
  MenuItem(
    name: 'Tacos',
    image: 'images/tacos.png',
    price: 8,
    type: "Tacos",
    category: 'Foods',
    isRecommended: true,
    ingredients: [
      'Tortillas',
      'Ground beef',
      'Onion',
      'Tomato',
      'Cheese',
      'Lettuce',
      'Salsa'
    ],
    preparationTime: 25,
    kcal: 450,
  ),
  MenuItem(
    name: 'Sushi',
    image: 'images/black_sushi.png',
    price: 8,
    category: 'Foods',
    type: "Sushi",
    ingredients: [
      'Sushi rice',
      'Nori',
      'Tuna',
      'Avocado',
      'Cucumber',
      'Soy sauce',
      'Wasabi'
    ],
    preparationTime: 60,
    kcal: 300,
  ),
  MenuItem(
    name: 'Sushi',
    image: 'images/sushisa.png',
    price: 22,
    type: "Sushi",
    category: 'Foods',
    isRecommended: true,
    ingredients: [
      'Sushi rice',
      'Nori',
      'Salmon',
      'Avocado',
      'Cucumber',
      'Soy sauce',
      'Wasabi'
    ],
    preparationTime: 60,
    kcal: 310,
  ),
  MenuItem(
    name: 'Sushi Platter',
    image: 'images/sushi_platter.png',
    price: 25,
    category: 'Foods',
    type: "Sushi",
    ingredients: [
      'Assorted sushi',
      'Sashimi',
      'Nigiri',
      'Maki rolls',
      'Soy sauce',
      'Wasabi'
    ],
    preparationTime: 60,
    kcal: 350,
  ),
  MenuItem(
    name: 'Sushi',
    image: 'images/othersushi.png',
    price: 25,
    type: "Sushi",
    category: 'Foods',
    isRecommended: true,
    ingredients: [
      'Sushi rice',
      'Nori',
      'Shrimp',
      'Avocado',
      'Cucumber',
      'Soy sauce',
      'Wasabi'
    ],
    preparationTime: 60,
    kcal: 290,
  ),
  MenuItem(
    name: 'Pizza Margherita',
    image: 'images/piazza_margherita.png',
    price: 12,
    category: 'Foods',
    type: "Pizza",
    ingredients: ['Pizza dough', 'Tomato sauce', 'Mozzarella cheese', 'Basil'],
    preparationTime: 20,
    kcal: 250,
  ),
  MenuItem(
    name: 'Pizza Chicken',
    image: 'images/pizza_chicken.png',
    price: 10,
    type: "Pizza",
    category: 'Foods',
    isRecommended: true,
    ingredients: [
      'Pizza dough',
      'Tomato sauce',
      'Mozzarella cheese',
      'Chicken',
      'Bell peppers',
      'Onions'
    ],
    preparationTime: 25,
    kcal: 280,
  ),
  MenuItem(
    name: 'Tomato Pizza',
    image: 'images/pizza_tomato.png',
    price: 13,
    category: 'Foods',
    type: "Pizza",
    ingredients: [
      'Pizza dough',
      'Tomato sauce',
      'Mozzarella cheese',
      'Tomatoes',
      'Basil'
    ],
    preparationTime: 20,
    kcal: 270,
  ),
  MenuItem(
    name: 'Pasta Carbonara',
    image: 'images/pasta_carbonara.png',
    price: 7,
    type: "Pasta",
    category: 'Foods',
    isRecommended: true,
    ingredients: ['Spaghetti', 'Bacon', 'Eggs', 'Parmesan cheese', 'Pepper'],
    preparationTime: 30,
    kcal: 550,
  ),
  MenuItem(
    name: 'Pasta Bolognese',
    image: 'images/bolognese.png',
    price: 17,
    category: 'Foods',
    type: "Pasta",
    ingredients: [
      'Spaghetti',
      'Ground beef',
      'Onion',
      'Garlic',
      'Tomato sauce',
      'Parmesan cheese'
    ],
    preparationTime: 40,
    kcal: 600,
  ),
  MenuItem(
    name: 'Hambburger',
    image: 'images/hambur.png',
    price: 5,
    type: "Burger",
    category: 'Foods',
    isRecommended: true,
    ingredients: [
      'Bun',
      'Beef patty',
      'Lettuce',
      'Tomato',
      'Onion',
      'Pickles',
      'Ketchup',
      'Mayonnaise'
    ],
    preparationTime: 15,
    kcal: 500,
  ),
  MenuItem(
    name: 'Cheeseburger',
    image: 'images/cheeseburger.png',
    price: 6,
    category: 'Foods',
    type: "Burger",
    ingredients: [
      'Bun',
      'Beef patty',
      'Cheese',
      'Lettuce',
      'Tomato',
      'Onion',
      'Pickles',
      'Ketchup',
      'Mayonnaise'
    ],
    preparationTime: 15,
    kcal: 550,
  ),
  MenuItem(
    name: 'Steak',
    image: 'images/steak.png',
    price: 30,
    type: "Meats",
    category: 'Foods',
    ingredients: [
      'Ribeye steak',
      'Salt',
      'Pepper',
      'Garlic',
      'Butter',
      'Rosemary'
    ],
    preparationTime: 20,
    kcal: 680,
  ),
  MenuItem(
    name: 'Strawberry',
    image: 'images/strawberry.png',
    price: 2,
    category: 'Fruit',
    type: 'Fruit',
    ingredients: ['Strawberries'],
    preparationTime: 5,
    kcal: 50,
  ),
  MenuItem(
    name: 'Strawberry Juice',
    image: 'images/strawberryjuice.png',
    price: 3,
    type: 'Juice',
    category: 'Juice',
    ingredients: ['Strawberries', 'Water', 'Sugar'],
    preparationTime: 10,
    kcal: 110,
  ),
  MenuItem(
    name: 'Orange',
    image: 'images/orange.png',
    price: 1,
    type: 'Fruit',
    category: 'Fruit',
    ingredients: ['Oranges'],
    preparationTime: 5,
    kcal: 60,
  ),
  MenuItem(
    name: 'Orange Juice',
    image: 'images/orangejuice.png',
    price: 2,
    type: 'Juice',
    category: 'Juice',
    ingredients: ['Oranges'],
    preparationTime: 10,
    kcal: 120,
  ),
  MenuItem(
    name: 'Lemon',
    image: 'images/lemon.png',
    price: 1,
    type: 'Fruit',
    category: 'Fruit',
    ingredients: ['Lemons'],
    preparationTime: 5,
    kcal: 30,
  ),
  MenuItem(
    name: 'Lemon Juice',
    image: 'images/lemonjuice.png',
    price: 3,
    type: 'Juice',
    category: 'Juice',
    ingredients: ['Lemons', 'Water', 'Sugar'],
    preparationTime: 10,
    kcal: 110,
  ),
  MenuItem(
    name: 'Apple',
    image: 'images/apple.png',
    price: 5,
    type: 'Fruit',
    category: 'Fruit',
    ingredients: ['Apples'],
    preparationTime: 5,
    kcal: 95,
  ),
];
