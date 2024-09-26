import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyButton extends StatelessWidget {
  Color? backgroundColor;
  BorderRadiusGeometry borderRadius;
  String text;
  TextStyle? textStyle;
  Function()? onPressed;
  MyButton({
    super.key,
    this.backgroundColor,
    this.borderRadius = BorderRadius.zero,
    required this.text,
    this.textStyle,
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
        child: Text(text, style: textStyle),
      ),
    );
  }
}
