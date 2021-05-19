import 'package:flutter/material.dart';

import '../../../core/utils/themes.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../data/food_model.dart';

enum FoodNutrientType { carbs, fatAndProtein, microNutrient }

class FoodNutrients extends StatelessWidget {
  const FoodNutrients({Key? key, required this.foodModel}) : super(key: key);
  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _nutrientNameColumn(context),
        _nutrientValueColumn(context, foodModel: foodModel),
      ],
    );
  }

  Widget _nutrientName(BuildContext context, {required String name}) {
    return CustomTextWidget(
      "$name: ",
      color: Themes.cardHeader(context),
    );
  }

  Widget _nutrientValue(BuildContext context,
      {required double value, required String unit}) {
    return Row(
      children: [
        CustomTextWidget(
          value.toStringAsFixed(1),
          color: Themes.cardContent(context),
        ),
        CustomTextWidget(
          unit,
          color: Themes.cardConstantUnit(context),
        ),
      ],
    );
  }

  Widget _nutrientNameColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _nutrientName(context, name: "Calories"),
        _nutrientName(context, name: "Sugar"),
        _nutrientName(context, name: "Fiber"),
        _nutrientName(context, name: "Total Carbs"),
        _nutrientName(context, name: "Saturated Fat"),
        _nutrientName(context, name: "Total Fat"),
        _nutrientName(context, name: "Protein"),
        _nutrientName(context, name: "Sodium"),
        _nutrientName(context, name: "Potassium"),
        _nutrientName(context, name: "Cholesterol"),
      ],
    );
  }

  Widget _nutrientValueColumn(BuildContext context,
      {required FoodModel foodModel}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _nutrientValue(context, value: foodModel.calories, unit: 'kcal'),
        _nutrientValue(context, value: foodModel.sugar, unit: 'g'),
        _nutrientValue(context, value: foodModel.fiber, unit: 'g'),
        _nutrientValue(context, value: foodModel.totalCarbs, unit: 'g'),
        _nutrientValue(context, value: foodModel.saturatedFat, unit: 'g'),
        _nutrientValue(context, value: foodModel.totalFat, unit: 'g'),
        _nutrientValue(context, value: foodModel.protein, unit: 'g'),
        _nutrientValue(context, value: foodModel.sodium, unit: 'mg'),
        _nutrientValue(context, value: foodModel.potassium, unit: 'mg'),
        _nutrientValue(context, value: foodModel.cholesterol, unit: 'mg'),
      ],
    );
  }
}
