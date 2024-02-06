import 'package:coffee_crave/models/coffee.dart';
import 'package:flutter/material.dart';

class CoffeeShop extends ChangeNotifier {
  // coffee list for sale
  final List<Coffee> _shop = [
    Coffee(
      name: 'Americano',
      price: '3.25',
      imagePath: 'assets/images/americano.png',
    ),
    Coffee(
      name: 'Latte',
      price: '6.95',
      imagePath: 'assets/images/latte.png',
    ),
    Coffee(
      name: 'Espresso',
      price: '2.70',
      imagePath: 'assets/images/espresso.png',
    ),
    Coffee(
      name: 'Iced Coffee',
      price: '5.95',
      imagePath: 'assets/images/iced-coffee.png',
    ),
  ];

  // user cart
  final List<Coffee> _userCart = [];

  // get coffee list
  List<Coffee> get coffeeShop => _shop;

  // get user cart
  List<Coffee> get userCart => _userCart;

  // add item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }
}
