import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String title;
  final Color? color;
  final VoidCallback onPress;
  const MyButton({
    super.key,
    required this.title,
    this.color,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color ?? greyColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
