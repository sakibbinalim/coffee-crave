import 'package:coffee_crave/models/coffee.dart';
import 'package:coffee_crave/models/coffee_shop.dart';
import 'package:coffee_crave/providers/quantity_provider.dart';
import 'package:coffee_crave/utils/pallette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItemPage extends StatefulWidget {
  final Coffee eachCoffee;
  // final String coffeeName;
  // final String coffeeImagePath;

  const AddItemPage({super.key, required this.eachCoffee});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  void increaseQuantity(String coffeeType) {
    Provider.of<QuantityProvider>(context, listen: false)
        .increaseQuantity(coffeeType);
  }

  void decreaseQuantity(String coffeeType) {
    Provider.of<QuantityProvider>(context, listen: false)
        .decreaseQuantity(coffeeType);
  }

  void addItemToCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuantityProvider>(builder: (context, value, child) {
      int totalQuantity = value.getQuantityForCoffee(widget.eachCoffee.name);
      return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: const Text('Add to cart'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // coffee image
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  widget.eachCoffee.imagePath,
                  height: 130,
                ),
              ),

              // quantity text
              const Text(
                'QUANTITY',
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),

              const SizedBox(height: 10),

              // row [- 3 +]

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // minus icon
                  IconButton(
                    onPressed: () => decreaseQuantity(widget.eachCoffee.name),
                    icon: const Icon(Icons.remove),
                  ),
                  // Quantity number
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      totalQuantity.toString(),
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  // add icon
                  IconButton(
                    onPressed: () => increaseQuantity(widget.eachCoffee.name),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
              const Spacer(),
              // size text

              // S M L button

              // add to cart button
              Container(
                margin: const EdgeInsets.only(bottom: 100),
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 100,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    backgroundColor: coffeeColor,
                  ),
                  onPressed: () => addItemToCart(widget.eachCoffee),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
