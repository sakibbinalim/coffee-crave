import 'package:coffee_crave/models/coffee.dart';
import 'package:coffee_crave/utils/pallette.dart';
import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  final Widget icon;
  void Function()? onPressed;

  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
          title: Text(
            coffee.name,
            style: TextStyle(color: coffeeColor),
          ),
          subtitle: Text(coffee.price),
          leading: Image.asset(coffee.imagePath),
          trailing: IconButton(
            icon: icon,
            onPressed: onPressed,
          )),
    );
  }
}
