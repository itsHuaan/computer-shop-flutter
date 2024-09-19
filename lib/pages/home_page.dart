import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_example/components/my_app_bar.dart';
import 'package:login_example/components/my_drawer.dart';
import 'package:login_example/components/my_drawer_item.dart';
import 'package:login_example/providers/login_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Home Page',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Do your thing as ${user.email}'),
          ],
        ),
      ),
      drawer: MyDrawer(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 50.0,
            ),
            child: const Icon(
              Icons.shopping_bag_rounded,
              size: 150,
            ),
          ),
          const Spacer(),
          MyDrawerItem(
            icon: Icons.logout_outlined,
            text: 'Logout',
            onTap: () {
              loginProvider.logOut(context);
            },
          ),
        ],
      ),
    );
  }
}
