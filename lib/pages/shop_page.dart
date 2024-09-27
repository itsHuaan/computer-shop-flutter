import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_example/components/my_circle_icon_button.dart';
import 'package:login_example/components/my_link_text.dart';
import 'package:login_example/components/my_text_field.dart';
import 'package:login_example/models/brands.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'Mouse',
      'Keyboard',
      'Monitor',
      'Laptop',
      'Desktop',
    ];
    return Column(
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
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                icon: Icons.shopping_cart_outlined,
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () {},
              ),
              MyCircleIconButton(
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
                icon: Icons.notifications_outlined,
                backgroundColor: Theme.of(context).colorScheme.primary,
                onPressed: () {},
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Brands',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              MyLinkText(
                text: 'See all',
                style: const TextStyle(
                  color: Colors.blue,
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(right: 10.0),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Brand(
                      Brands.logic_pro_x,
                      size: 50.0,
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          brand['name'],
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                        Text('${brand['productCount']} products'),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15.0),
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Container(
                margin: const EdgeInsets.only(right: 10.0),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyCircleIconButton(
                      icon: Icons.gamepad_outlined,
                      size: 40.0,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      category,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: const Center(
                child: Text('Display your products here'),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyCircleIconButton(
              icon: Icons.arrow_left_outlined,
              onPressed: () {},
            ),
            const Text('1'),
            const Text('2'),
            const Text('3'),
            const Text('...'),
            const Text('15'),
            MyCircleIconButton(
              icon: Icons.arrow_right_outlined,
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
