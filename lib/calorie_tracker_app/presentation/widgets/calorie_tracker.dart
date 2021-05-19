import 'package:elegant_calorie_tracker/calorie_tracker_app/data/food_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/screen.dart';
import '../../../injection_container.dart';
import '../../calorie_tracker_manager.dart';
import 'food_information.dart';
import 'food_search.dart';
import 'food_widget.dart';
import 'nutritional_counter.dart';

class CalorieTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bool _isLoading =
        Provider.of<CalorieTrackerManager>(context).isLoading;
    final manager = Provider.of<CalorieTrackerManager>(context);
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Screen.heightUnit(context) * 3,
          ),
          NutritionalCounter(
              calories: manager.calories,
              carbs: manager.carbs,
              fat: manager.fat,
              protein: manager.protein),
          SizedBox(
            height: Screen.isLandscape(context)
                ? Screen.heightUnit(context) * 2.5
                : Screen.heightUnit(context) * 1,
          ),
          Divider(
            thickness: Screen.isLandscape(context)
                ? Screen.heightUnit(context) * 1
                : Screen.heightUnit(context) * .5,
            indent: Screen.widthUnit(context) * 7.5,
            endIndent: Screen.widthUnit(context) * 7.5,
          ),
          SizedBox(
            height: Screen.isLandscape(context)
                ? Screen.heightUnit(context) * 2.5
                : Screen.heightUnit(context) * 1,
          ),
          FoodSearch(
            onPressed: _clearColumn,
            onSubmitted: _searchFood,
          ),
          SizedBox(
            height: Screen.heightUnit(context) * 2,
          ),
          _buildColumn(
            _isLoading,
            _getFoodWidgetList(context),
          ),
          SizedBox(
            height: Screen.heightUnit(context) * 2,
          ),
        ],
      ),
    );
  }

  Widget _buildColumn(bool isLoading, List<FoodWidget> foodWidgetList) {
    if (isLoading) {
      return const CircularProgressIndicator();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: foodWidgetList,
    );
  }

  List<FoodWidget> _getFoodWidgetList(BuildContext context) {
    final List<FoodWidget> _foodWidgetList = [];
    final List<FoodModel> _foodModelList =
        Provider.of<CalorieTrackerManager>(context).foodModelList;
    for (final FoodModel foodModel in _foodModelList) {
      _foodWidgetList.add(
        FoodWidget(
          foodModel: foodModel,
          onTap: _openFoodInformation,
        ),
      );
    }
    return _foodWidgetList;
  }

  dynamic _openFoodInformation(BuildContext context, FoodModel foodModel) {
    return showDialog(
        context: context,
        builder: (_) {
          return FoodInformation(
            foodModel: foodModel,
          );
        });
  }

  void _searchFood(BuildContext context, String inputString) =>
      Provider.of<CalorieTrackerManager>(context, listen: false)
          .getFood(inputString);

  void _clearColumn(BuildContext context) =>
      Provider.of<CalorieTrackerManager>(context, listen: false)
          .emptyFoodList();
}
