import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_repository.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/food_widget.dart';
import 'package:flutter/cupertino.dart';

enum NutrientType { calories, carbs, fat, protein }

class CalorieTrackerManager extends ChangeNotifier {
  CalorieTrackerManager({required this.repository});

  final FoodRepository repository;
  List<FoodModel> _foodModelList = [];

  List<FoodWidget> foodWidgetList(BuildContext context) {
    final List<FoodWidget> _foodWidgetList = [];
    for (final FoodModel foodModel in _foodModelList) {
      _foodWidgetList.add(
        FoodWidget(context, foodModel: foodModel),
      );
    }
    return _foodWidgetList;
  }

  double get calories => _nutricionalInformation(NutrientType.calories);
  double get carbs => _nutricionalInformation(NutrientType.carbs);
  double get fat => _nutricionalInformation(NutrientType.fat);
  double get protein => _nutricionalInformation(NutrientType.protein);

  double _nutricionalInformation(NutrientType type) {
    double nutrient = 0;
    if (_foodModelList.isNotEmpty) {
      switch (type) {
        case NutrientType.calories:
          {
            for (final FoodModel foodModel in _foodModelList) {
              nutrient += foodModel.calories;
            }
            return nutrient;
          }
        case NutrientType.carbs:
          {
            for (final FoodModel foodModel in _foodModelList) {
              nutrient += foodModel.totalCarbs;
            }
            return nutrient;
          }
        case NutrientType.fat:
          {
            for (final FoodModel foodModel in _foodModelList) {
              nutrient += foodModel.totalFat;
            }
            return nutrient;
          }
        case NutrientType.protein:
          {
            for (final FoodModel foodModel in _foodModelList) {
              nutrient += foodModel.protein;
            }
            return nutrient;
          }
      }
    }
    return nutrient;
  }
}
