import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/food_widget.dart';
import 'package:flutter/material.dart';

class FoodColumn extends StatelessWidget {
  const FoodColumn({Key? key, required this.foodModelList}) : super(key: key);
  final List<FoodModel> foodModelList;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _buildFoodColumn(context, foodModelList: foodModelList),
    );
  }

  List<FoodWidget> _buildFoodColumn(BuildContext context,
      {required List<FoodModel> foodModelList}) {
    final List<FoodWidget> foodWidgetList = [];
    for (final FoodModel foodModel in foodModelList) {
      foodWidgetList.add(
        FoodWidget(context, foodModel: foodModel),
      );
    }
    return foodWidgetList;
  }
}
