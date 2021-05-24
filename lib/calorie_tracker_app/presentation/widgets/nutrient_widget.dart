import 'package:flutter/material.dart';

import '../../../core/widgets/custom_card/custom_card.dart';
import '../../../core/widgets/custom_text_widget.dart';

/// Card wrapped in a FittedBox that returns the sum of the nutrients of the FoodColumn foods
class NutrientWidget extends CustomCard {
  NutrientWidget(
    BuildContext context, {
    this.nutrientWidth,
    required this.nutrient,
    required this.text,
  }) : super(
          child: FittedBox(
            fit: BoxFit.fill,
            child: SizedBox(
              child: Column(
                children: [
                  CustomTextWidget(
                    nutrient,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  CustomTextWidget(
                    text,
                    color: Theme.of(context).hintColor,
                  ),
                ],
              ),
            ),
          ),
        );
  final String nutrient;
  final String text;
  final double? nutrientWidth;
}
