import 'package:flutter/material.dart';

class ScreenSize {
  static double widthPercent(BuildContext context, double percent) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * percent / 100;
  }

  static double heightPercent(BuildContext context, double percent) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * percent / 100;
  }
}
