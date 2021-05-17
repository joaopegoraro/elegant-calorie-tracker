import 'package:elegant_calorie_tracker/calorie_tracker/calorie_tracker_manager.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_button.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  final TextEditingController controller = TextEditingController();
  late String inputString;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          child: TextField(
            controller: controller,
            onChanged: (value) {
              inputString = value;
            },
            onSubmitted: (_) {
              dispatchQuery();
            },
          ),
        ),
        CustomButton(
          onPressed: () => clearColumn(),
          child: const CustomTextWidget('Empty list'),
        ),
      ],
    );
  }

  void dispatchQuery() {
    Provider.of<CalorieTrackerManager>(context, listen: false)
        .getFood(inputString);
  }

  void clearColumn() =>
      Provider.of<CalorieTrackerManager>(context, listen: false)
          .emptyFoodList();
}
