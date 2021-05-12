import 'package:elegant_calorie_tracker/models/food.dart';
import 'package:elegant_calorie_tracker/common_widgets/food_widget.dart';
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
    Food pasta = new Food();
    pasta.name = "Pasta";
    pasta.calories = 361;
    Food beef = new Food();
    beef.name = "Beef";
    beef.calories = 215;
    Food omellet = new Food();
    omellet.name = "Omellet";
    omellet.calories = 142;
    createFood(pasta);
    createFood(beef);
    createFood(omellet);
  }

  void createFood(Food foodL) {
    _addFoodToFoodList(foodL);
    _addFoodToWidgetList(foodL);
  }

  void _addFoodToFoodList(Food food) {
    this.foodList.add(food);
  }

  void _addFoodToWidgetList(Food food) {
    FoodWidget foodWidget = FoodWidget(context, food: food);
    this.foodWidgetList.add(foodWidget);
    _addWidgetToDropList(foodWidget);
  }

  void _addWidgetToDropList(FoodWidget foodWidget) =>
      this.foodDropDownList.add(DropdownMenuItem(child: foodWidget));
}
