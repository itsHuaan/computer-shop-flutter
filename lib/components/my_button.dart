import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  final Color backgroundColor;
  BorderRadiusGeometry borderRadius;
  String text;
  Color textColor;
  TextStyle? style;
  Function()? onPressed;
  MyButton({
    super.key,
    required this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    required this.text,
    required this.textColor,
    this.style,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius,
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(text, style: style),
      ),
    );
  }
}
