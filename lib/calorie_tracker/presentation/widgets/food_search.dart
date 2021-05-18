import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_button.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_card/custom_card.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';

class FoodSearch extends StatefulWidget {
  const FoodSearch({
    Key? key,
    required this.onSubmitted,
    required this.onPressed,
  }) : super(key: key);
  final Function(BuildContext context, String string) onSubmitted;
  final Function(BuildContext context) onPressed;

  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  final TextEditingController controller = TextEditingController();
  late String inputString;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Screen.widthUnit(context) * 90,
      height: Screen.heightUnit(context) * 8.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomCard(
            width: Screen.widthUnit(context) * 60,
            child: _buildTextField(context),
          ),
          CustomButton(
            onPressed: () => widget.onPressed(context),
            child: CustomTextWidget(
              'Clear',
              fontSize: Screen.heightUnit(context) * 2.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: 'Add Food',
          border: InputBorder.none,
          isCollapsed: true,
          hintStyle: TextStyle(
            color: Themes.cardContent(context),
          ),
        ),
        style: TextStyle(
          color: Themes.cardHeader(context),
          decoration: TextDecoration.none,
          fontWeight: FontWeight.bold,
          fontSize: Screen.heightUnit(context) * 3.5,
        ),
        keyboardType: TextInputType.visiblePassword,
        controller: controller,
        onChanged: (value) {
          inputString = value;
        },
        onSubmitted: (_) {
          _dispatchQuery(inputString, context);
          controller.clear();
        });
  }

  void _dispatchQuery(String inputString, BuildContext context) {
    widget.onSubmitted(context, inputString);
  }
}
