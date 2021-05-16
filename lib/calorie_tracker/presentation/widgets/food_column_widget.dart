import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/food_widget.dart';
import 'package:flutter/material.dart';

class FoodColumn extends StatelessWidget {
  const FoodColumn({Key? key, required this.children}) : super(key: key);
  final List<FoodWidget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    );
  }
}
