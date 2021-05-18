import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

enum FoodNutrientType { carbs, fatAndProtein, microNutrient }

class FoodNutrients extends StatelessWidget {
  const FoodNutrients({Key? key, required this.foodModel}) : super(key: key);
  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          _nutrientColumn(
            context,
            foodModel: foodModel,
            type: FoodNutrientType.carbs,
          ),
          SizedBox(
            width: Screen.widthUnit(context) * 4,
          ),
          _nutrientColumn(
            context,
            foodModel: foodModel,
            type: FoodNutrientType.fatAndProtein,
          ),
          SizedBox(
            width: Screen.widthUnit(context) * 4,
          ),
          _nutrientColumn(
            context,
            foodModel: foodModel,
            type: FoodNutrientType.microNutrient,
          ),
        ],
      ),
    );
  }

  Widget _nutrientColumn(
    BuildContext context, {
    required FoodNutrientType type,
    required FoodModel foodModel,
  }) {
    late final Map<String, double> nutrientMap;
    late final String unit;
    switch (type) {
      case FoodNutrientType.carbs:
        {
          nutrientMap = {
            "Sugar": foodModel.sugar,
            "Fiber": foodModel.fiber,
            "Total Carbs": foodModel.totalCarbs,
          };
          unit = "g";
        }
        break;
      case FoodNutrientType.fatAndProtein:
        {
          nutrientMap = {
            "Saturated Fat": foodModel.saturatedFat,
            "Total Fat": foodModel.totalFat,
            "Protein": foodModel.protein,
          };
          unit = "g";
        }
        break;
      case FoodNutrientType.microNutrient:
        {
          nutrientMap = {
            "Sodium": foodModel.sodium,
            "Potassium": foodModel.potassium,
            "Cholesterol": foodModel.cholesterol,
          };
          unit = "mg";
        }
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomTextWidget(
              "${nutrientMap.keys.first}: ",
              color: Themes.cardHeader(context),
            ),
            CustomTextWidget(
              nutrientMap.values.first.toStringAsFixed(1),
              color: Themes.cardContent(context),
            ),
            CustomTextWidget(
              unit,
              color: Themes.cardConstantUnit(context),
            ),
          ],
        ),
        Row(
          children: [
            CustomTextWidget(
              "${nutrientMap.keys.toList()[1]}: ",
              color: Themes.cardHeader(context),
            ),
            CustomTextWidget(
              nutrientMap.values.toList()[1].toStringAsFixed(1),
              color: Themes.cardContent(context),
            ),
            CustomTextWidget(
              unit,
              color: Themes.cardConstantUnit(context),
            ),
          ],
        ),
        Row(
          children: [
            CustomTextWidget(
              "${nutrientMap.keys.last}: ",
              color: Themes.cardHeader(context),
            ),
            CustomTextWidget(
              nutrientMap.values.last.toStringAsFixed(1),
              color: Themes.cardContent(context),
            ),
            CustomTextWidget(
              unit,
              color: Themes.cardConstantUnit(context),
            ),
          ],
        ),
      ],
    );
  }
}
