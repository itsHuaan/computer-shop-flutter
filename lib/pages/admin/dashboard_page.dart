import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_example/components/my_app_bar.dart';
import 'package:login_example/components/my_drawer.dart';
import 'package:login_example/components/my_drawer_item.dart';
import 'package:login_example/providers/login_provider.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: const MyAppBar(
        title: 'Dashboard',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Admin: ${user.email}'),
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
          MyDrawerItem(
            icon: Icons.account_tree_rounded,
            text: 'Account management',
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushNamed(
                context,
                '/account_management',
              );
            },
          ),
          MyDrawerItem(
            icon: Icons.account_tree_rounded,
            text: 'Account management',
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushNamed(
                context,
                '/account_management',
              );
            },
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
