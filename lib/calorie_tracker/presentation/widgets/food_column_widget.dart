import 'package:flutter/material.dart';

import 'food_widget.dart';

class FoodColumn extends StatelessWidget {
  const FoodColumn({Key? key, required this.foodWidgetList}) : super(key: key);
  final List<FoodWidget> foodWidgetList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: foodWidgetList,
    );
  }
}
