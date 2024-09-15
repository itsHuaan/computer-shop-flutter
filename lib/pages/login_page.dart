import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_example/components/my_button.dart';
import 'package:login_example/components/my_text_field.dart';
import 'package:login_example/components/my_link_text.dart';
import 'package:login_example/components/my_icon_button.dart';
import 'package:login_example/providers/login_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Center(
            child: Consumer<LoginProvider>(
              builder: (context, loginProvider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 60.0,
                        bottom: 50.0,
                      ),
                      child: const Placeholder(
                        fallbackHeight: 200,
                      ),
                    ),
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 50),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: MyTextField(
                        errorText: loginProvider.isEmailEmpty ? loginProvider.emailErrorMessage : null,
                        controller: loginProvider.emailController,
                        labelText: 'Email*',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: MyTextField(
                        errorText: loginProvider.isPasswordEmpty ? loginProvider.passwordErrorMessage : null,
                        controller: loginProvider.passwordController,
                        labelText: 'Password*',
                        obscureText: loginProvider.obscureText,
                        suffixIcon: IconButton(
                          onPressed: () {
                            loginProvider.toggleObscureText();
                          },
                          icon: Icon(loginProvider.obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                      child: MyButton(
                        text: 'Sign In',
                        backgroundColor: Theme.of(context).colorScheme.onPrimary,
                        textColor: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10.0),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        onPressed: () => loginProvider.signIn(context),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: MyLinkText(
                            text: 'Forgot password?',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text('or sign in with'),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 30.0,
                        bottom: 70,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: MyIconButton(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              padding: 10.0,
                              borderRadius: 15.0,
                              child: Brand(
                                Brands.google,
                                size: 60,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: MyIconButton(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              padding: 10.0,
                              borderRadius: 15.0,
                              child: Brand(
                                Brands.facebook_circled,
                                size: 60,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('You don\'t have an account? '),
                        MyLinkText(
                          text: 'Register now',
                          style: const TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
