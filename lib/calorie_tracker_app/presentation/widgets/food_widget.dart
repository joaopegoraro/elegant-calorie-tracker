import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';
import '../../../core/widgets/custom_card/custom_card.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../data/models/food_model.dart';

/// Takes a Food object as a parameter and returns a clickable card with its
/// serving size, name and calories
class FoodWidget extends StatelessWidget {
  final double? foodWidth;
  final FoodModel foodModel;
  final Function(BuildContext, FoodModel) onTap;
  const FoodWidget({
    this.foodWidth,
    required this.foodModel,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(context, foodModel);
      },
      child: _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    final theme = Theme.of(context);
    return CustomCard(
      height: Screen.heightUnit(context) * 8,
      width: foodWidth ?? Screen.widthUnit(context) * 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
              children: [
                Row(
                  children: [
                    CustomTextWidget(
                      foodModel.servingSize.toStringAsFixed(0),
                      color: theme.hintColor,
                    ),
                    CustomTextWidget(
                      'g',
                      color: theme.secondaryHeaderColor,
                    ),
                    CustomTextWidget(
                      ' of ',
                      color: theme.hintColor,
                    ),
                  ],
                ),
                Expanded(
                  child: CustomTextWidget(
                    foodModel.name,
                    overflow: TextOverflow.ellipsis,
                    color: theme.secondaryHeaderColor,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              CustomTextWidget(
                foodModel.calories.toStringAsFixed(1),
                color: theme.hintColor,
              ),
              CustomTextWidget(
                ' kcal',
                color: theme.secondaryHeaderColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
