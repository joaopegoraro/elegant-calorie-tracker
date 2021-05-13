import 'package:elegant_calorie_tracker/core/themes.dart';
import 'package:elegant_calorie_tracker/utils/screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/custom_text_widget.dart';

/// Returns a Column containing the sum of the FoodColumn calories
class CalorieCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextWidget(
          'Calories',
          color: Themes.header(context),
          fontSize: Screen.heightUnit(context) * 7,
          shadowColor: Colors.black,
        ),
        SizedBox(
          height: Screen.heightUnit(context) * .65,
        ),
        CustomTextWidget(
          '2400',
          color: Themes.cardBackground(context),
          fontSize: Screen.heightUnit(context) * 8,
        ),
        CustomTextWidget(
          'kcal',
          color: Themes.constantUnit(context),
          fontSize: Screen.heightUnit(context) * 3.5,
        ),
        SizedBox(
          height: Screen.heightUnit(context) * 2,
        ),
      ],
    );
  }
}
