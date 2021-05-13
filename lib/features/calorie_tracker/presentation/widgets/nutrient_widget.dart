import 'package:elegant_calorie_tracker/core/themes.dart';
import 'package:elegant_calorie_tracker/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/custom_card.dart';
import 'package:flutter/material.dart';

import '../../../../core/custom_text_widget.dart';

/// Card wrapped in a FittedBox that returns the sum of the nutrients of the FoodColumn foods
class NutrientWidget extends CustomCard {
  NutrientWidget(
    BuildContext context, {
    this.nutrientWidth,
    required this.nutrient,
    required this.text,
  }) : super(
          width: nutrientWidth ?? Screen.widthUnit(context) * 20,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Column(
              children: [
                CustomTextWidget(
                  nutrient,
                  color: Themes.cardHeader(context),
                ),
                CustomTextWidget(
                  text,
                  color: Themes.cardContent(context),
                ),
              ],
            ),
          ),
        );
  final String nutrient;
  final String text;
  final double? nutrientWidth;
}
