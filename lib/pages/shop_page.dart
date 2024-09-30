import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_stores/components/my_drawer.dart';
import 'package:we_stores/components/my_product_tile.dart';
import 'package:we_stores/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("SHOP",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const MyDrawer(),
      body: ListView(
        children: [
          Center(
            child: Text(
              "Welcome to our Store",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          //page sub titile
          Center(
              child: Text("Premium products, just for you",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 16))),
          //
          SizedBox(
            height: 600,
            child: ListView.builder(
                itemCount: products.length,
                padding: EdgeInsets.all(25),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  //get each indiividual product from the shop
                  final product = products[index];

                  //return as a product tile UI
                  return MyProductTile(product: product);
                }),
          ),
        ],
      ),
    );
  }
}
