import 'package:flutter/material.dart';
import 'package:login_example/components/my_circle_icon_button.dart';
import 'package:login_example/components/my_text_field.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: MyTextField(
                    enabledBorderColor: Theme.of(context).colorScheme.primary,
                    focusedBorderColor: Theme.of(context).colorScheme.primary,
                    hintText: 'Search product',
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ),
                MyCircleIconButton(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  icon: Icons.shopping_cart_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                ),
                MyCircleIconButton(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                  ),
                  icon: Icons.notifications_outlined,
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
