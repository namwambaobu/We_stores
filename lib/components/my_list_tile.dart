import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;
  void Function()? onTap;
  MyListTile(
      {super.key, required this.text, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.brown,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
