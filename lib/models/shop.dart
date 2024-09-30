import 'package:flutter/material.dart';
import 'package:we_stores/models/product.dart';

class Shop extends ChangeNotifier {
  //products for sale
  final List<Product> _shop = [
    Product(name: "Prod 1", price: 99.99, description: "some details"),
    Product(name: "Prod 2", price: 99.99, description: "some details"),
    Product(name: "Prod 3", price: 99.99, description: "some details"),
    Product(name: "Prod 4", price: 99.99, description: "some details")
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
