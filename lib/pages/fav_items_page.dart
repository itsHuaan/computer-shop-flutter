import 'package:flutter/material.dart';

class FavItemsPage extends StatelessWidget {
  const FavItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your favorite items')
        ],
      ),
    );
  }
}
