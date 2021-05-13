import 'package:elegant_calorie_tracker/models/food.dart';
import 'package:elegant_calorie_tracker/core/themes.dart';
import 'package:elegant_calorie_tracker/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/custom_card.dart';
import 'package:elegant_calorie_tracker/core/custom_text_widget.dart';
import 'package:flutter/material.dart';

/// Takes a Food object as a parameter and returns a card with its name and calories
class FoodWidget extends CustomCard {
  FoodWidget(
    BuildContext context, {
    this.foodWidth,
    required this.food,
  }) : super(
          height: Screen.heightUnit(context) * 8,
          width: foodWidth ?? Screen.widthUnit(context) * 83,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                food.name,
                color: Themes.cardHeader(context),
              ),
              Row(
                children: [
                  CustomTextWidget(
                    food.calories.toString(),
                    color: Themes.cardContent(context),
                  ),
                  CustomTextWidget(
                    ' kcal',
                    color: Themes.cardConstantUnit(context),
                  ),
                ],
              ),
            ],
          ),
        );
  final double? foodWidth;
  final Food food;
}
