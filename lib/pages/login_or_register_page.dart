import 'package:flutter/material.dart';
import 'package:login_example/pages/login_page.dart';
import 'package:login_example/pages/register_page.dart';
import 'package:login_example/providers/login_provider.dart';
import 'package:provider/provider.dart';

class LoginOrRegisterPage extends StatelessWidget {
  const LoginOrRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Consumer<LoginProvider>(
        builder: (context, loginProvider, child) {
          return loginProvider.isLoginPage ? const LoginPage() : const RegisterPage();
        },
      ),
    );
  }
}
