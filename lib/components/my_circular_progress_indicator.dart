import 'package:flutter/material.dart';

class MyCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  const MyCircularProgressIndicator({
    super.key,
    required this.strokeWidth,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeCap: StrokeCap.round,
      strokeWidth: strokeWidth,
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}
