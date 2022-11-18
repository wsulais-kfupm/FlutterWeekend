import 'package:flutter/material.dart';
import 'package:flutter_weekend/widgets/cons.dart';


class CustomBubble extends StatelessWidget {
  const CustomBubble(
      {super.key,
      required this.containerContent,
      required this.onPress,
      this.color = kButtonColor});
  final Widget? containerContent;
  final VoidCallback? onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 100.0,
        height: 50.0,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
        ),
        child: containerContent,
      ),
    );
  }
}