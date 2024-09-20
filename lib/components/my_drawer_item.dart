import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyDrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  Widget? subtitle;
  MyDrawerItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        subtitle: subtitle,
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
