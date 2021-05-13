import 'package:elegant_calorie_tracker/models/food.dart';
import 'package:elegant_calorie_tracker/core/food_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//83

class TestList {
  TestList(this.context);
  final BuildContext context;

  List<Food> foodList = [];
  List<FoodWidget> foodWidgetList = [];
  List<DropdownMenuItem> foodDropDownList = [];
  Food pasta = Food();

  void testFunction() {
    final Food pasta = Food();
    pasta.name = "Pasta";
    pasta.calories = 361;
    final Food beef = Food();
    beef.name = "Beef";
    beef.calories = 215;
    final Food omellet = Food();
    omellet.name = "Omellet";
    omellet.calories = 142;
    createFood(pasta);
    createFood(beef);
    createFood(omellet);
    createFood(pasta);
  }

  void createFood(Food foodL) {
    _addFoodToFoodList(foodL);
    _addFoodToWidgetList(foodL);
  }

  void _addFoodToFoodList(Food food) {
    foodList.add(food);
  }

  void _addFoodToWidgetList(Food food) {
    final FoodWidget foodWidget = FoodWidget(context, food: food);
    foodWidgetList.add(foodWidget);
    _addWidgetToDropList(foodWidget);
  }

  void _addWidgetToDropList(FoodWidget foodWidget) =>
      foodDropDownList.add(DropdownMenuItem(child: foodWidget));
}
