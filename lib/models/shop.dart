import 'package:flutter/material.dart';
import 'package:we_stores/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(
        name: "Sunglasses",
        price: 29.99,
        description: "Sun cover for your eyes",
        imagePath: 'assets/images/shades.png'),
    Product(
        name: "hoodies",
        price: 49.99,
        description: "in all colors and sizes, take your pick",
        imagePath: 'assets/images/hoodie.png'),
    Product(
        name: "Pallazios",
        price: 14.99,
        description: "just hot, hot, hot",
        imagePath: 'assets/images/pants.png'),
    Product(
        name: "Vans Boots",
        price: 39.99,
        description: "All purpose boots, with safty plates for toe cover",
        imagePath: 'assets/images/boots.png'),
    Product(
        name: "Air Force",
        price: 79.99,
        description: "Hot and in Trend Snickers",
        imagePath: 'assets/images/snicker.png'),
    Product(
        name: "Travel Pack",
        price: 29.99,
        description: "pretty Handy for short trips",
        imagePath: 'assets/images/pack.png')
  ];
  //user cart
  List<Product> _cart = [];
  //get product list
  List<Product> get shop => _shop;
  //get user cart
  List<Product> get cart => _cart;
  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
