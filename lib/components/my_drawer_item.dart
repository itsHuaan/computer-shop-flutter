import 'package:flutter/material.dart';

class MyDrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  const MyDrawerItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inverseSurface,
        ),
        title: Text(
          text,
        ),
        onTap: onTap,
      ),
    );
  }
}
