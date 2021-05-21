import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/data/models/nutritional_model.dart';
import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/themes.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../calorie_tracker_manager.dart';
import '../../data/models/food_model.dart';

enum FoodNutrientType { carbs, fatAndProtein, microNutrient }

class FoodNutrients extends StatelessWidget {
  const FoodNutrients({Key? key, required this.model}) : super(key: key);
  final Either<FoodModel, NutritionalModel> model;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _nutrientNameColumn(context),
        model.fold(
          (foodModel) =>
              _nutrientValueColumn(context, eitherModel: Left(foodModel)),
          (nutritionalModel) => _nutrientValueColumn(context,
              eitherModel: Right(nutritionalModel)),
        )
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
        model.fold(
          (foodModel) => _nutrientName(context, name: "Serving Size"),
          (nutritionalModel) => Container(),
        ),
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
      {required Either<FoodModel, NutritionalModel> eitherModel}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: eitherModel.fold((foodModel) {
        return [
          _buildServingSize(context, foodModel),
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
        ];
      }, (nutritionalModel) {
        return [
          _nutrientValue(context,
              value: nutritionalModel.calories, unit: 'kcal'),
          _nutrientValue(context, value: nutritionalModel.sugar, unit: 'g'),
          _nutrientValue(context, value: nutritionalModel.fiber, unit: 'g'),
          _nutrientValue(context,
              value: nutritionalModel.totalCarbs, unit: 'g'),
          _nutrientValue(context,
              value: nutritionalModel.saturatedFat, unit: 'g'),
          _nutrientValue(context, value: nutritionalModel.totalFat, unit: 'g'),
          _nutrientValue(context, value: nutritionalModel.protein, unit: 'g'),
          _nutrientValue(context, value: nutritionalModel.sodium, unit: 'mg'),
          _nutrientValue(context,
              value: nutritionalModel.potassium, unit: 'mg'),
          _nutrientValue(context,
              value: nutritionalModel.cholesterol, unit: 'mg'),
        ];
      }),
    );
  }

  Widget _buildServingSize(BuildContext context, FoodModel foodModel) {
    final TextEditingController _controller = TextEditingController();
    _controller.text = foodModel.servingSize.toStringAsFixed(0);
    return Row(
      children: [
        CustomCard(
          paddingSides: Screen.widthUnit(context) * 0.5,
          width: Screen.widthUnit(context) * 15,
          height: Screen.heightUnit(context) * 3.5,
          child: TextFormField(
            controller: _controller,
            onEditingComplete: () {
              Provider.of<CalorieTrackerManager>(context, listen: false)
                  .editFood(
                foodModel.index,
                double.parse(_controller.text),
              );
              Navigator.pop(context, 'Remove');
            },
            maxLength: 4,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              counterText: '',
              border: InputBorder.none,
              isCollapsed: true,
            ),
            style: TextStyle(
              color: Themes.cardContent(context),
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: Screen.heightUnit(context) * 2.5,
            ),
          ),
        ),
        CustomTextWidget(
          'g ',
          color: Themes.cardHeader(context),
        ),
      ],
    );
  }
}
