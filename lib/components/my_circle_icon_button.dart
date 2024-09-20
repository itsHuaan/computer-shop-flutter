import 'package:flutter/material.dart';

class MyCircleIconButton extends StatelessWidget {
  IconData icon;
  void Function()? onPressed;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  Color? color;
  MyCircleIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.margin,
    this.padding,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
