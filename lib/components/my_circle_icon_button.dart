import 'package:flutter/material.dart';

class MyCircleIconButton extends StatelessWidget {
  IconData icon;
  void Function()? onPressed;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  Color? backgroundColor;
  double? size;
  MyCircleIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.margin,
    this.padding,
    this.backgroundColor,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Theme.of(context).colorScheme.onPrimary,
          size: size,
        ),
      ),
    );
  }
}
