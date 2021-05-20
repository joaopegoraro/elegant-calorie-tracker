import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_card/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/themes.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../calorie_tracker_manager.dart';
import '../../data/food_model.dart';

enum FoodNutrientType { carbs, fatAndProtein, microNutrient }

class FoodNutrients extends StatelessWidget {
  const FoodNutrients({Key? key, required this.foodModel}) : super(key: key);
  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
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
        _nutrientName(context, name: "Serving Size"),
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
        _buildServingSize(context),
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

  Widget _buildServingSize(BuildContext context) {
    TextEditingController _controller = TextEditingController();
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
