import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';
import 'calorie_counter.dart';
import 'nutrients_row_widget.dart';

class NutritionalCounter extends StatelessWidget {
  const NutritionalCounter(
      {Key? key,
      required this.calories,
      required this.carbs,
      required this.fat,
      required this.protein})
      : super(key: key);
  final double calories;
  final double carbs;
  final double fat;
  final double protein;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, Orientation orientation) {
      switch (orientation) {
        case Orientation.portrait:
          return Column(
            children: [
              CalorieCounter(
                calories: calories,
              ),
              NutrientsRow(
                carbs: carbs,
                fat: fat,
                protein: protein,
              ),
            ],
          );
        case Orientation.landscape:
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalorieCounter(
                calories: calories,
              ),
              SizedBox(
                width: Screen.widthUnit(context) * 10,
              ),
              NutrientsRow(
                carbs: carbs,
                fat: fat,
                protein: protein,
              ),
            ],
          );
      }
    });
  }
}
