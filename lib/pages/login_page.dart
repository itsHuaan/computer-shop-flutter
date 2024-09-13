import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_example/components/my_button.dart';
import 'package:login_example/components/my_icon_button.dart';
import 'package:login_example/components/my_link_text.dart';
import 'package:login_example/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isEmailEmpty = false;
  bool _isPasswordEmpty = false;

  void signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    setState(() {
      _isEmailEmpty = emailController.text.isEmpty;
      _isPasswordEmpty = passwordController.text.isEmpty;
    });
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 60.0,
                  bottom: 50.0,
                ),
                child: Image.asset(
                  'assets/images/my_logo.png',
                  height: 200,
                ),
              ),
              const Text(
                'Login',
                style: TextStyle(fontSize: 50),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: MyTextField(
                  errorText: _isEmailEmpty ? 'Email is required' : null,
                  controller: emailController,
                  labelText: 'Email*',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: MyTextField(
                  errorText: _isPasswordEmpty ? 'Password is required' : null,
                  controller: passwordController,
                  labelText: 'Password*',
                  obscureText: _obscureText,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(_obscureText ? Icons.visibility_rounded : Icons.visibility_off_rounded),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: MyButton(
                  text: 'Sign In',
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  textColor: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(10.0),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  onPressed: signIn,
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
                        color: Theme.of(context).colorScheme.inversePrimary,
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
                        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
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
                        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
