import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_example/components/my_button.dart';
import 'package:login_example/components/my_circular_progress_indicator.dart';
import 'package:login_example/components/my_icon_button.dart';
import 'package:login_example/components/my_link_text.dart';
import 'package:login_example/components/my_text_field.dart';
import 'package:login_example/services/auth_service.dart';

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
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  void signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: MyCircularProgressIndicator(
          strokeWidth: 5.0,
        ),
      ),
    );
    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        setState(() {
          _isEmailEmpty = emailController.text.isEmpty;
          _isPasswordEmpty = passwordController.text.isEmpty;
          _emailErrorMessage = _isEmailEmpty ? 'Email is required' : null;
          _passwordErrorMessage = _isPasswordEmpty ? 'Password is required' : null;
        });
      }
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          _emailErrorMessage = 'No user found for this email';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          _passwordErrorMessage = 'Password is invalid';
        });
      }
    }
    Navigator.pop(context);
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
                  errorText: _isEmailEmpty ? _emailErrorMessage : null,
                  controller: emailController,
                  labelText: 'Email*',
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                child: MyTextField(
                  errorText: _isPasswordEmpty ? _passwordErrorMessage : null,
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
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
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
                        onPressed: () => AuthService().signInWithGoogle(),
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
