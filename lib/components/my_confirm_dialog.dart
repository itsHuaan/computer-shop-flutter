import 'package:flutter/material.dart';

class MyConfirmDialog extends StatelessWidget {
  final String title;
  final String content;
  final void Function()? onPressed;
  const MyConfirmDialog({
    super.key,
    required this.title,
    required this.content,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
      ),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Confirm',
            style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
      ],
    );
  }
}
