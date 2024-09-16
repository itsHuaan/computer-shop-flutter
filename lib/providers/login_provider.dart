import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordConfirmController = TextEditingController();

  bool _isLoginPage = true;
  bool _obscureText = true;
  bool _hasEmailError = false;
  bool _hasPasswordError = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;

  bool get isLoginPage => _isLoginPage;
  bool get obscureText => _obscureText;
  bool get hasEmailError => _hasEmailError;
  bool get hasPasswordError => _hasPasswordError;
  String? get emailErrorMessage => _emailErrorMessage;
  String? get passwordErrorMessage => _passwordErrorMessage;

  void switchPage() {
    _isLoginPage = !_isLoginPage;
    notifyListeners();
  }

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void validateInput() {
    _hasEmailError = emailController.text.isEmpty;
    _hasPasswordError = passwordController.text.isEmpty;
    if (_hasEmailError && _hasPasswordError) {
      _emailErrorMessage = 'Email is required';
      _passwordErrorMessage = 'Password is required';
    } else if (_hasEmailError) {
      _emailErrorMessage = 'Email is required';
      _passwordErrorMessage = null;
    } else if (_hasPasswordError) {
      _passwordErrorMessage = 'Password is required';
      _emailErrorMessage = null;
    } else {
      _emailErrorMessage = null;
      _passwordErrorMessage = null;
    }

    notifyListeners();
  }

  Future<void> signIn(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } else {
        validateInput();
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        _hasEmailError = _hasPasswordError = true;
        _emailErrorMessage = _passwordErrorMessage = "Please check your credentials";
      }

      notifyListeners();
    } finally {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }
}