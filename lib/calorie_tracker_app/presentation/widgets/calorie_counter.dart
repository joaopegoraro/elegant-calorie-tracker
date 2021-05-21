import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';
import '../../../core/widgets/custom_text_widget.dart';

/// Returns a Column containing the sum of the FoodColumn calories
class CalorieCounter extends StatelessWidget {
  const CalorieCounter({Key? key, required this.calories}) : super(key: key);
  final double calories;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          'Calories',
          color: theme.primaryColor,
          fontSize: Screen.heightUnit(context) * 7,
          shadowColor: Colors.black,
        ),
        SizedBox(
          height: Screen.heightUnit(context) * .65,
        ),
        CustomTextWidget(
          calories.toStringAsFixed(1),
          color: theme.cardColor,
          fontSize: Screen.heightUnit(context) * 8,
        ),
        CustomTextWidget(
          'kcal',
          color: theme.secondaryHeaderColor,
          fontSize: Screen.heightUnit(context) * 3.5,
        ),
        SizedBox(
          height: Screen.heightUnit(context) * 2,
        ),
      ],
    );
  }
}
