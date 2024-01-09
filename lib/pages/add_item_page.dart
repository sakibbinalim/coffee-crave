import 'package:coffee_crave/providers/quantity_provider.dart';
import 'package:coffee_crave/utils/pallette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItemPage extends StatefulWidget {
  final String coffeeName;
  final String coffeeImagePath;

  const AddItemPage(
      {super.key, required this.coffeeImagePath, required this.coffeeName});

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

  @override
  Widget build(BuildContext context) {
    return Consumer<QuantityProvider>(builder: (context, value, child) {
      int totalQuantity = value.getQuantityForCoffee(widget.coffeeName);
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // coffee image
            Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Image.asset(
                widget.coffeeImagePath,
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
                  onPressed: () => decreaseQuantity(widget.coffeeName),
                  icon: const Icon(Icons.remove),
                ),
                // Quantity number
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                  onPressed: () => increaseQuantity(widget.coffeeName),
                  icon: const Icon(Icons.add),
                ),
              ],
            )

            // size text

            // S M L button

            // add to cart button
          ],
        ),
      );
    });
  }
}
