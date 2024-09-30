import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  void Function()? onTap;
  final Widget? child;
  MyButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(18)),
        padding: const EdgeInsets.all(25),
        child: child,
      ),
    );
  }
}
