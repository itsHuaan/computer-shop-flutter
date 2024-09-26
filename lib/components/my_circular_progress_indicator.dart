import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double? value;
  const MyCircularProgressIndicator({
    super.key,
    required this.strokeWidth,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeCap: StrokeCap.round,
      strokeWidth: strokeWidth,
      color: Theme.of(context).colorScheme.onSurface,
      value: value,
    );
  }
}
