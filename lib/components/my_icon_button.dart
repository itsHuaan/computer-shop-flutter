import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyIconButton extends StatelessWidget {
  Widget child;
  double padding;
  Function()? onPressed;
  OutlinedBorder? shape;
  Color? backgroundColor;
  MyIconButton({
    super.key,
    required this.child,
    this.padding = 5.0,
    this.backgroundColor,
    this.onPressed,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(padding),
        backgroundColor: backgroundColor,
        shape: shape,
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
