import 'package:flutter/material.dart';
import 'package:we_stores/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 80,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //shop tile
              MyListTile(
                text: " S H O P",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              //cart tile
              MyListTile(
                text: " C A R T",
                icon: Icons.shopping_bag_rounded,
                onTap: () {
                  //pop drawer
                  Navigator.pop(context);
                  //navidate to cart page
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),
          //exit shop tile
          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: " E X I T",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamed(context, '/intro_page'),
            ),
          )
        ],
      ),
    );
  }
}
