import 'package:flutter/material.dart';
import 'package:login_example/components/my_drawer_item.dart';

class MyDrawer extends StatelessWidget {
  List<Widget> children;
  MyDrawer({
    super.key,
    this.children = const <Widget>[],
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}
