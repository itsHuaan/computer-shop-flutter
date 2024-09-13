import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 237, 237, 237),
    primary: Color.fromARGB(255, 225, 225, 225),
    secondary: Color.fromARGB(255, 220, 220, 220),
    tertiary: Color.fromARGB(255, 218, 218, 218),
    inverseSurface: Color.fromARGB(255, 18, 18, 18),
    inversePrimary: Color.fromARGB(255, 30, 30, 30),
  ),
);

ThemeData darkMode = ThemeData(
  useMaterial3: true,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 18, 18, 18),
    primary: Color.fromARGB(255, 30, 30, 30),
    secondary: Color.fromARGB(255, 35, 35, 35),
    tertiary: Color.fromARGB(255, 37, 37, 37),
    inverseSurface: Color.fromARGB(255, 237, 237, 237),
    inversePrimary: Color.fromARGB(255, 225, 225, 225),
  ),
);
