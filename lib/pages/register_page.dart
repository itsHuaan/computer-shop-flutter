import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:login_example/components/my_button.dart';
import 'package:login_example/components/my_icon_button.dart';
import 'package:login_example/components/my_link_text.dart';
import 'package:login_example/components/my_text_field.dart';
import 'package:login_example/providers/login_provider.dart';
import 'package:login_example/providers/signup_provider.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Consumer<SignupProvider>(
            builder: (context, signUpProvider, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 40.0,
                      bottom: 30.0,
                    ),
                    child: const Placeholder(
                      fallbackHeight: 200,
                    ),
                  ),
                  const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: MyTextField(
                      maxLines: 1,
                      enabledBorderColor: Theme.of(context).colorScheme.tertiary,
                      focusedBorderColor: Theme.of(context).colorScheme.primary,
                      errorText: signUpProvider.isEmailEmpty ? signUpProvider.emailErrorMessage : null,
                      controller: signUpProvider.emailController,
                      labelText: 'Email*',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: MyTextField(
                      maxLines: 1,
                      enabledBorderColor: Theme.of(context).colorScheme.tertiary,
                      focusedBorderColor: Theme.of(context).colorScheme.primary,
                      errorText: signUpProvider.isPasswordEmpty ? signUpProvider.passwordErrorMessage : null,
                      controller: signUpProvider.passwordController,
                      labelText: 'Password*',
                      obscureText: signUpProvider.obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          signUpProvider.toggleObscureText();
                        },
                        icon: Icon(signUpProvider.obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: MyTextField(
                      maxLines: 1,
                      enabledBorderColor: Theme.of(context).colorScheme.tertiary,
                      focusedBorderColor: Theme.of(context).colorScheme.primary,
                      errorText: signUpProvider.isPasswordConfirmEmpty ? signUpProvider.passwordConfirmErrorMessage : null,
                      controller: signUpProvider.passwordConfirmController,
                      labelText: 'Re-enter password*',
                      obscureText: signUpProvider.obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          signUpProvider.toggleObscureText();
                        },
                        icon: Icon(signUpProvider.obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                    child: MyButton(
                      text: 'Sign up',
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      borderRadius: BorderRadius.circular(10.0),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      onPressed: () => signUpProvider.signUp(context),
                    ),
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
                          child: Text('or continue with'),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
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
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
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
                      const Text('Already have have an account? '),
                      MyLinkText(
                        text: 'Login now',
                        style: const TextStyle(
                          color: Colors.blue,
                        ),
                        onTap: () {
                          loginProvider.switchPage();
                        },
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
