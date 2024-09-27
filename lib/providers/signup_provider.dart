import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_example/components/my_circular_progress_indicator.dart';
import 'package:login_example/models/user.dart';
import 'package:login_example/services/firestore_service.dart';

class SignupProvider extends ChangeNotifier {
  FirestoreService firestoreService = FirestoreService();

  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordConfirmController = TextEditingController();

  bool _obscureText = true;
  bool _isEmailEmpty = false;
  bool _isPasswordEmpty = false;
  bool _isPasswordConfirmEmpty = false;
  String? _emailErrorMessage;
  String? _passwordErrorMessage;
  String? _passwordConfirmErrorMessage;

  bool get obscureText => _obscureText;
  bool get isEmailEmpty => _isEmailEmpty;
  bool get isPasswordEmpty => _isPasswordEmpty;
  bool get isPasswordConfirmEmpty => _isPasswordConfirmEmpty;
  String? get emailErrorMessage => _emailErrorMessage;
  String? get passwordErrorMessage => _passwordErrorMessage;
  String? get passwordConfirmErrorMessage => _passwordConfirmErrorMessage;

  void toggleObscureText() {
    _obscureText = !_obscureText;
    notifyListeners();
  }

  void validateInput() {
    _isEmailEmpty = emailController.text.isEmpty;
    _isPasswordEmpty = passwordController.text.isEmpty;
    _isPasswordConfirmEmpty = passwordConfirmController.text.isEmpty;

    _emailErrorMessage = _isEmailEmpty ? 'Email is required' : null;
    _passwordErrorMessage = _isPasswordEmpty
        ? 'Password is required'
        : passwordController.text.length < 6
            ? 'Password must be at least 6 characters long'
            : null;
    _passwordConfirmErrorMessage = _isPasswordConfirmEmpty
        ? 'Please re-enter your password'
        : passwordController.text != passwordConfirmController.text
            ? 'Passwords do not match'
            : null;

    notifyListeners();
  }

  void clearFieldsAndErrors() {
    emailController.clear();
    passwordController.clear();
    passwordConfirmController.clear();
    _emailErrorMessage = null;
    _passwordErrorMessage = null;
    _passwordConfirmErrorMessage = null;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context) async {
    if (!context.mounted) return;

    showDialog(
      context: context,
      builder: (context) => const Center(
        child: MyCircularProgressIndicator(strokeWidth: 5.0),
      ),
    );

    try {
      validateInput();

      if (!_isEmailEmpty && !_isPasswordEmpty && !_isPasswordConfirmEmpty && passwordController.text == passwordConfirmController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        UserModel user = UserModel(
          email: emailController.text,
        );
        await firestoreService.addUser(user);
        clearFieldsAndErrors();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        _emailErrorMessage = 'This email has been used';
        notifyListeners();
      }
    } finally {
      if (context.mounted) {
        Navigator.pop(context);
      }
    }
  }
}
