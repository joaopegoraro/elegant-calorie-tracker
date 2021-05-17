import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:flutter/material.dart';

import 'nutrient_widget.dart';

class NutrientsRow extends StatelessWidget {
  const NutrientsRow(
      {Key? key, required this.carbs, required this.fat, required this.protein})
      : super(key: key);
  final double carbs;
  final double fat;
  final double protein;

  @override
  Widget build(BuildContext context) {
    return Screen.isLandscape(context)
        ? Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              NutrientWidget(
                context,
                nutrient: 'Carbs',
                text: '${carbs.toStringAsFixed(1)}g',
                nutrientWidth: Screen.widthUnit(context) * 17,
              ),
              NutrientWidget(
                context,
                nutrient: 'Fat',
                text: '${fat.toStringAsFixed(1)}g',
                nutrientWidth: Screen.widthUnit(context) * 17,
              ),
              NutrientWidget(
                context,
                nutrient: 'Protein',
                text: '${protein.toStringAsFixed(1)}g',
                nutrientWidth: Screen.widthUnit(context) * 17,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              NutrientWidget(
                context,
                nutrient: 'Carbs',
                text: '${carbs.toStringAsFixed(1)}g',
                nutrientWidth: Screen.widthUnit(context) * 27,
              ),
              NutrientWidget(
                context,
                nutrient: 'Fat',
                text: '${fat.toStringAsFixed(1)} g',
                nutrientWidth: Screen.widthUnit(context) * 27,
              ),
              NutrientWidget(
                context,
                nutrient: 'Protein',
                text: '${protein.toStringAsFixed(1)}g',
                nutrientWidth: Screen.widthUnit(context) * 27,
              ),
            ],
          );
  }
}
