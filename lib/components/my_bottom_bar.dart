import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomBar extends StatelessWidget {
  List<GButton> tabs;
  Function(int)? onTabChange;
  Color? color;
  Color? activeColor;
  Color tabBackgroundColor;
  Color backgroundColor;
  MyBottomBar({
    super.key,
    this.color,
    this.activeColor,
    required this.tabBackgroundColor,
    this.backgroundColor = Colors.transparent,
    required this.tabs,
    this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: backgroundColor,
      ),
      child: GNav(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        tabs: tabs,
        padding: const EdgeInsets.all(15.0),
        gap: 10,
        color: color,
        activeColor: activeColor,
        tabBackgroundColor: tabBackgroundColor,
        tabBorderRadius: 30,
        onTabChange: onTabChange,
      ),
    );
  }
}
