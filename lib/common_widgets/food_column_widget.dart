import 'package:flutter/material.dart';

class FoodColumn extends StatelessWidget {
  const FoodColumn({Key key, this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
