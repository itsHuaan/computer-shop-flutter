import 'package:flutter/material.dart';
import 'package:login_example/components/my_app_bar.dart';
import 'package:login_example/components/my_button.dart';
import 'package:login_example/components/my_drawer.dart';
import 'package:login_example/components/my_drawer_item.dart';
import 'package:login_example/providers/login_provider.dart';
import 'package:login_example/theme/screen_size.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: MyAppBar(
        title: 'Dashboard',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: ScreenSize.widthPercent(context, 25),
              child: MyButton(
                borderRadius: BorderRadius.circular(15.0),
                textStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                backgroundColor: const Color.fromARGB(128, 0, 128, 255),
                text: 'Test',
                onPressed: () {},
              ),
            )
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
            icon: Icons.category_rounded,
            text: 'Category management',
            onTap: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              Navigator.pushNamed(
                context,
                '/category_management',
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
