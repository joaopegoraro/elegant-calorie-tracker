import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/data/models/nutritional_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/presentation/widgets/food_nutrients.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class TotalNutritionalInformation extends StatelessWidget {
  final NutritionalModel nutritionalModel;

  const TotalNutritionalInformation({
    Key? key,
    required this.nutritionalModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FittedBox(
      child: AlertDialog(
        backgroundColor: theme.dialogBackgroundColor,
        title: CustomTextWidget(
          '${nutritionalModel.name} ',
          align: TextAlign.center,
          color: theme.focusColor,
        ),
        content: SingleChildScrollView(
          child: FittedBox(
            child: FoodNutrients(
              model: Right(nutritionalModel),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Close'),
            child: CustomTextWidget(
              'Close',
              color: theme.focusColor,
            ),
          ),
        ],
      ),
    );
  }
}
