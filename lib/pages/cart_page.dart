import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_stores/components/my_button.dart';
import 'package:we_stores/models/product.dart';
import 'package:we_stores/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialogue for confirmation to remove items
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text("Remove Item?"),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<Shop>().removeFromCart(product);
                  },
                  child: Text("Yes"),
                ),
                MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                )
              ],
            ));
  }

  //user pressed the pay button
  void payButtonOnPressed(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content:
                  Text("User wants to pay, connect this app to pay backend"),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Cart Page",
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          //cart list
          Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("Your cart is Empty..."))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        //get individual item in cart
                        final item = cart[index];
                        //return as a cart tile
                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                              icon: Icon(Icons.remove)),
                        );
                      })),
          //pay button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyButton(
                onTap: () => payButtonOnPressed(context),
                child: const Text("Pay Now")),
          )
        ],
      ),
    );
  }
}
