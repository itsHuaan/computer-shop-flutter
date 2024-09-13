import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyIconButton extends StatelessWidget {
  Widget child;
  double padding;
  double borderRadius;
  Function()? onPressed;
  Color? backgroundColor;
  MyIconButton({
    super.key,
    required this.child,
    this.padding = 5.0,
    this.borderRadius = 5.0,
    this.backgroundColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(padding),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
