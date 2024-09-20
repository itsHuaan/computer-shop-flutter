import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:login_example/components/my_bottom_bar.dart';
import 'package:login_example/pages/fav_items_page.dart';
import 'package:login_example/pages/message_page.dart';
import 'package:login_example/pages/profile_page.dart';
import 'package:login_example/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const FavItemsPage(),
    const MessagePage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: MyBottomBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        tabBackgroundColor: const Color.fromARGB(128, 0, 128, 255),
        tabs: const [
          GButton(
            icon: Icons.shopping_bag_outlined,
            text: 'Shop',
          ),
          GButton(
            icon: Icons.favorite_outline_outlined,
            text: 'Favorite',
          ),
          GButton(
            icon: Icons.message_outlined,
            text: 'Messages',
          ),
          GButton(
            icon: Icons.person_outlined,
            text: 'Favorite',
          ),
        ],
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}
