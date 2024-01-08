import 'package:coffee_crave/components/coffee_tile.dart';
import 'package:coffee_crave/models/coffee.dart';
import 'package:coffee_crave/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeItemFromCart(Coffee cartCoffee) {
    Provider.of<CoffeeShop>(context, listen: false)
        .removeItemFromCart(cartCoffee);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text(
                'Your Cart',
                style: TextStyle(fontSize: 28),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (BuildContext context, int index) {
                    Coffee eachCartCoffee = value.userCart[index];
                    return CoffeeTile(
                      coffee: eachCartCoffee,
                      onPressed: () => removeItemFromCart(eachCartCoffee),
                      icon: const Icon(Icons.delete),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
