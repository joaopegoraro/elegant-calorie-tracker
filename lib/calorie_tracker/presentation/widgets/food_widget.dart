import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/food_nutrients.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';
import '../../../core/utils/themes.dart';
import '../../../core/widgets/custom_card/custom_card.dart';
import '../../../core/widgets/custom_text_widget.dart';
import '../../data/food_model.dart';

/// Takes a Food object as a parameter and returns a card with its name and calories
class FoodWidget extends StatefulWidget {
  final double? foodWidth;
  final FoodModel foodModel;
  const FoodWidget({
    this.foodWidth,
    required this.foodModel,
  });

  @override
  _FoodWidgetState createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  bool _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        setState(() {
          if (_isExpanded) {
            _isExpanded = false;
          } else {
            _isExpanded = true;
          }
        });
      },
      child: _isExpanded ? _buildExpandedChild(context) : _buildChild(context),
    );
  }

  Widget _buildChild(BuildContext context) {
    return CustomCard(
      height: Screen.heightUnit(context) * 8,
      width: widget.foodWidth ?? Screen.widthUnit(context) * 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextWidget(
            widget.foodModel.name,
            color: Themes.cardHeader(context),
          ),
          Row(
            children: [
              CustomTextWidget(
                widget.foodModel.calories.toString(),
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

  Widget _buildExpandedChild(BuildContext context) {
    return CustomCard(
      height: Screen.heightUnit(context) * 21,
      width: widget.foodWidth ?? Screen.widthUnit(context) * 95,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWidget(
                widget.foodModel.name,
                color: Themes.cardHeader(context),
              ),
              Row(
                children: [
                  CustomTextWidget(
                    widget.foodModel.calories.toStringAsFixed(1),
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
          SizedBox(
            height: Screen.heightUnit(context) * 1,
          ),
          FittedBox(
            child: FoodNutrients(
              foodModel: widget.foodModel,
            ),
          ),
        ],
      ),
    );
  }
}
