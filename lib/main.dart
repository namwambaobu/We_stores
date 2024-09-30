import 'package:flutter/material.dart';
import 'package:we_stores/pages/cart_page.dart';
import 'package:we_stores/pages/intro_page.dart';
import 'package:we_stores/pages/shop_page.dart';
import 'package:we_stores/themes/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const IntroPage(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => const IntroPage(),
        '/shop_page': (context) => const ShopPage(),
        '/cart_page': (context) => const CartPage(),
      },
    );
  }
}
