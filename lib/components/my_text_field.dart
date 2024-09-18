import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  TextEditingController controller;
  bool obscureText;
  final String labelText;
  double borderRadius;
  Widget? suffixIcon;
  String? errorText;
  MyTextField({
    super.key,
    this.obscureText = false,
    required this.labelText,
    this.borderRadius = 10.0,
    this.suffixIcon,
    required this.controller,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      cursorRadius: const Radius.circular(50),
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        // floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onSurface,
          fontSize: 20,
        ),
        labelText: labelText,
        labelStyle: TextStyle(
          color: Theme.of(context).colorScheme.onTertiary,
        ),
        errorText: errorText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        suffixIcon: suffixIcon,
        fillColor: Theme.of(context).colorScheme.primary,
        filled: true,
      ),
    );
  }
}
