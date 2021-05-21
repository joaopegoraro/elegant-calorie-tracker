import 'package:elegant_calorie_tracker/calorie_tracker_app/data/models/nutritional_model.dart';
import 'package:flutter/material.dart';

import 'calorie_counter.dart';
import 'nutrients_row_widget.dart';

class NutritionalCounter extends StatelessWidget {
  const NutritionalCounter(
      {Key? key, required this.totalNutrition, required this.onTap})
      : super(key: key);
  final NutritionalModel totalNutrition;
  final Function(BuildContext, NutritionalModel) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context, totalNutrition),
      child: Column(
        children: [
          CalorieCounter(
            calories: totalNutrition.calories,
          ),
          NutrientsRow(
            carbs: totalNutrition.totalCarbs,
            fat: totalNutrition.totalFat,
            protein: totalNutrition.protein,
          ),
        ],
      ),
    );
  }
}
