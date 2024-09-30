import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_stores/models/product.dart';
import 'package:we_stores/models/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

//add to cart button pressed
  void addToCart(BuildContext context) {
    //show a dialog box to ask for confirmation of adding product to cart
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Add this to Cart?"),
              actions: [
                //yes button
                MaterialButton(
                  onPressed: () {
                    //pop the box
                    Navigator.pop(context);
                    //add product to cart
                    context.read<Shop>().addToCart(product);
                  },
                  child: Text("Yes"),
                ),
                //cancel button
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.all(25),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //product image
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    child: Icon(Icons.favorite)),
              ),
              const SizedBox(
                height: 20,
              ),
              //product name
              Text(
                product.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              //product description
              Text(
                product.description,
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          //product price + add to cart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //price
              Text('\$' + product.price.toStringAsFixed(2)),
              //button
              Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: IconButton(
                    onPressed: () => addToCart(context),
                    icon: Icon(Icons.add),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
