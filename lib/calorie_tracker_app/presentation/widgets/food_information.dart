import 'package:elegant_calorie_tracker/calorie_tracker_app/data/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker_app/presentation/widgets/food_nutrients.dart';
import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_card/custom_card.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class FoodInformation extends StatefulWidget {
  final FoodModel foodModel;

  const FoodInformation({Key? key, required this.foodModel}) : super(key: key);
  @override
  _FoodInformationState createState() => _FoodInformationState();
}

class _FoodInformationState extends State<FoodInformation> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Themes.mainBackground(context),
      title: _buildTitle(context),
      content: SingleChildScrollView(
        child: FoodNutrients(
          foodModel: widget.foodModel,
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Remove'),
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
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            CustomCard(
              width: Screen.widthUnit(context) * 16,
              height: Screen.heightUnit(context) * 6,
              child: TextFormField(
                textAlign: TextAlign.center,
                initialValue: widget.foodModel.servingSize.toStringAsFixed(0),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
                style: TextStyle(
                  color: Themes.cardContent(context),
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                CustomTextWidget(
                  'g ',
                  color: Themes.cardHeader(context),
                ),
                CustomTextWidget(
                  'of ',
                  color: Themes.cardContent(context),
                ),
              ],
            ),
          ],
        ),
        CustomTextWidget(
          '${widget.foodModel.name} ',
          color: Themes.cardHeader(context),
        ),
      ],
    );
  }
}
