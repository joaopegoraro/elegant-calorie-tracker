import 'package:elegant_calorie_tracker/core/screen.dart';
import 'package:flutter/material.dart';

import 'nutrient_widget.dart';

class NutrientsRow extends StatefulWidget {
  @override
  _NutrientsRowState createState() => _NutrientsRowState();
}

class _NutrientsRowState extends State<NutrientsRow> {
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
                text: '250g',
                nutrientWidth: Screen.widthUnit(context) * 17,
              ),
              NutrientWidget(
                context,
                nutrient: 'Fat',
                text: '60g',
                nutrientWidth: Screen.widthUnit(context) * 17,
              ),
              NutrientWidget(
                context,
                nutrient: 'Protein',
                text: '100g',
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
                text: '250g',
                nutrientWidth: Screen.widthUnit(context) * 27,
              ),
              NutrientWidget(
                context,
                nutrient: 'Fat',
                text: '60g',
                nutrientWidth: Screen.widthUnit(context) * 27,
              ),
              NutrientWidget(
                context,
                nutrient: 'Protein',
                text: '100g',
                nutrientWidth: Screen.widthUnit(context) * 27,
              ),
            ],
          );
  }
}
