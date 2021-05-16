import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_card.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

/// Takes a Food object as a parameter and returns a card with its name and calories
class FoodWidget extends CustomCard {
  FoodWidget(
    BuildContext context, {
    this.foodWidth,
    required this.foodModel,
  }) : super(
          height: Screen.heightUnit(context) * 8,
          width: foodWidth ?? Screen.widthUnit(context) * 83,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                foodModel.name,
                color: Themes.cardHeader(context),
              ),
              Row(
                children: [
                  CustomTextWidget(
                    foodModel.calories.toString(),
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
  final FoodModel foodModel;
}
