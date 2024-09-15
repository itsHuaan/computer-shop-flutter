import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();

  bool _obscureText = true;
  bool _isEmailEmpty = false;
  bool _isPasswordEmpty = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;

  bool get obscureText => _obscureText;
  bool get isEmailEmpty => _isEmailEmpty;
  bool get isPasswordEmpty => _isPasswordEmpty;
  String? get emailErrorMessage => _emailErrorMessage;
  String? get passwordErrorMessage => _passwordErrorMessage;

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void validateInput() {
    _isEmailEmpty = emailController.text.isEmpty;
    _isPasswordEmpty = passwordController.text.isEmpty;
    _emailErrorMessage = _isEmailEmpty ? 'Email is required' : null;
    _passwordErrorMessage = _isPasswordEmpty ? 'Password is required' : null;
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
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _emailErrorMessage = 'No user found for this email';
      } else if (e.code == 'wrong-password') {
        _passwordErrorMessage = 'Password is invalid';
      }
      notifyListeners();
    } finally {
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
    }
  }
}
