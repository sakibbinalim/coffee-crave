import 'package:coffee_crave/models/coffee_shop.dart';
import 'package:coffee_crave/pages/home_page.dart';
import 'package:coffee_crave/providers/quantity_provider.dart';
import 'package:coffee_crave/utils/pallette.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CoffeeShop()),
        ChangeNotifierProvider(create: (context) => QuantityProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coffee Crave',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: coffeeColor),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
