import 'package:elegant_calorie_tracker/core/widgets/custom_button.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_card.dart';
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
  final TextEditingController _controller = TextEditingController();
  late String inputString;

  @override
  void dispose() {
    _controller.dispose();
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
    final theme = Theme.of(context);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'Add Food',
            border: InputBorder.none,
            isCollapsed: true,
            hintStyle: TextStyle(
              color: theme.buttonColor,
            ),
          ),
          style: TextStyle(
            color: theme.secondaryHeaderColor,
            decoration: TextDecoration.none,
            fontWeight: FontWeight.bold,
            fontSize: Screen.heightUnit(context) * 3.5,
          ),
          keyboardType: TextInputType.visiblePassword,
          controller: _controller,
          onChanged: (value) {
            inputString = value;
          },
          onSubmitted: (_) {
            _dispatchQuery(inputString, context);
            _controller.clear();
          }),
    );
  }

  void _dispatchQuery(String inputString, BuildContext context) {
    widget.onSubmitted(context, inputString);
  }
}
