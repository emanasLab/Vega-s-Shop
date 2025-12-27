//flutters
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//providers
import 'Features/Cart/CartData/cart_provider.dart';
import 'Features/Stock/StockData/stock_provider.dart';
//routes
import 'Pages/intro.dart';
import 'Pages/shop.dart';
import 'Pages/cart.dart';

void main() {
  runApp(
    MultiProvider(
      //coz i used 2 providers (even tho if i didnt divide them it wouldve been better for product quantity management)
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => StockProvider()),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroPage(),
      routes: {
        '/intro': (context) => const IntroPage(),
        '/shop': (context) =>
            const ShopPage(), //this means we created a local path for ShopPage() class and called it /shop, clean and simple
        '/cart': (context) => const Cart(),
      },
    );
  }
}
