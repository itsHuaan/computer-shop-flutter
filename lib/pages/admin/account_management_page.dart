import 'package:flutter/material.dart';
import 'package:login_example/components/my_app_bar.dart';

class AccountManagementPage extends StatelessWidget {
  const AccountManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Account Management'),
    );
  }
}
