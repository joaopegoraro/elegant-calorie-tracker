import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';
import '../../../core/utils/themes.dart';
import '../../../core/widgets/custom_card/custom_card.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../data/food_model.dart';
import 'food_information.dart';

/// Takes a Food object as a parameter and returns a card with its name and calories
class FoodWidget extends StatelessWidget {
  final double? foodWidth;
  final FoodModel foodModel;
  const FoodWidget({
    this.foodWidth,
    required this.foodModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _openFoodInformation(context);
      },
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    return CustomCard(
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
  }

  dynamic _openFoodInformation(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => FoodInformation(
        foodModel: foodModel,
      ),
    );
  }
}
