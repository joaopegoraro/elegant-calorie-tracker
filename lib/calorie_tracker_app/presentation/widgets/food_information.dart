import 'package:elegant_calorie_tracker/calorie_tracker_app/calorie_tracker_manager.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/data/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/presentation/widgets/food_nutrients.dart';
import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodInformation extends StatefulWidget {
  final FoodModel foodModel;

  const FoodInformation({
    Key? key,
    required this.foodModel,
  }) : super(key: key);
  @override
  _FoodInformationState createState() => _FoodInformationState();
}

class _FoodInformationState extends State<FoodInformation> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: AlertDialog(
        backgroundColor: Themes.mainBackground(context),
        title: CustomTextWidget(
          '${widget.foodModel.name} ',
          color: Themes.cardHeader(context),
        ),
        content: SingleChildScrollView(
          child: FittedBox(
            child: FoodNutrients(
              foodModel: widget.foodModel,
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Provider.of<CalorieTrackerManager>(context, listen: false)
                  .removeFood(widget.foodModel.index);
              Navigator.pop(context, 'Remove');
            },
            child: CustomTextWidget(
              'Remove',
              color: Themes.cardHeader(context),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: CustomTextWidget(
              'OK',
              color: Themes.cardHeader(context),
            ),
          ),
        ],
      ),
    );
  }
}
