import 'package:flutter/material.dart';

class QuantityProvider extends ChangeNotifier {
  Map<String, int> _coffeeQuantities = {};

  int getQuantityForCoffee(String coffeeName) {
    return _coffeeQuantities[coffeeName] ?? 0;
  }

  void increaseQuantity(String coffeeName) {
    if (!_coffeeQuantities.containsKey(coffeeName)) {
      _coffeeQuantities[coffeeName] = 1;
    } else {
      _coffeeQuantities[coffeeName] = (_coffeeQuantities[coffeeName] ?? 0) + 1;
    }
    notifyListeners();
  }

  void decreaseQuantity(String coffeeName) {
    if (_coffeeQuantities.containsKey(coffeeName)) {
      _coffeeQuantities[coffeeName] = (_coffeeQuantities[coffeeName] ?? 0) - 1;

      if (_coffeeQuantities[coffeeName]! <= 0) {
        _coffeeQuantities.remove(coffeeName);
      }

      notifyListeners();
    }
  }

  // int _totalQuantity = 0;

  // int get totalQuantity => _totalQuantity;

  // void increaseQuantity(int updatedQuantity) {
  //   _totalQuantity = updatedQuantity + 1;
  //   notifyListeners();
  // }

  // void decreaseQuantity(int updatedQuantity) {
  //   _totalQuantity = updatedQuantity - 1;
  //   notifyListeners();
  // }
}
