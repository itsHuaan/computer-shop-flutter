import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyLinkText extends StatelessWidget {
  String text;
  Function()? onTap;
  TextStyle? style;
  MyLinkText({
    super.key,
    required this.text,
    this.style,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: style,
      ),
    );
  }
}
