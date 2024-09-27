import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyTextField extends StatelessWidget {
  TextEditingController? controller;
  bool obscureText;
  final String? labelText;
  final String? hintText;
  double borderRadius;
  Widget? suffixIcon;
  String? errorText;
  Widget? prefixIcon;
  Color enabledBorderColor;
  Color focusedBorderColor;
  int? maxLines;
  MyTextField({
    super.key,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.borderRadius = 10.0,
    this.suffixIcon,
    this.controller,
    this.errorText,
    this.prefixIcon,
    this.maxLines,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      controller: controller,
      obscureText: obscureText,
      cursorRadius: const Radius.circular(50),
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Theme.of(context).hintColor),
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
            color: enabledBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        fillColor: Theme.of(context).colorScheme.primary,
        filled: true,
      ),
    );
  }
}
