import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_repository.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/food_widget.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:flutter/cupertino.dart';

const noConnectionMessage = 'Could not connected to the server';
const foodNotFoundMessage = 'Could not find a food that matches your query';

enum NutrientType { calories, carbs, fat, protein }

class CalorieTrackerManager extends ChangeNotifier {
  final FoodRepository repository;
  CalorieTrackerManager({required this.repository}) {
    _setFoodModelListToSavedList();
  }

  //! Mutable Variables
  List<FoodModel> _foodModelList = [];
  String? errorMessage;

  //! Getters
  double get calories => _nutricionalInformation(NutrientType.calories);
  double get carbs => _nutricionalInformation(NutrientType.carbs);
  double get fat => _nutricionalInformation(NutrientType.fat);
  double get protein => _nutricionalInformation(NutrientType.protein);

  //! Public functions
  List<FoodWidget> getFoodWidgetList(BuildContext context) {
    final List<FoodWidget> _foodWidgetList = [];
    for (final FoodModel foodModel in _foodModelList) {
      _foodWidgetList.add(
        FoodWidget(context, foodModel: foodModel),
      );
    }
    return _foodWidgetList;
  }

  Future<void> getFood(String query) async {
    final eitherFailureOrList = await repository.getFood(query);
    _setFoodModelListToSavedList();
    eitherFailureOrList.fold(
      (failure) =>
          failure is ServerFailure ? noConnectionMessage : foodNotFoundMessage,
      (list) => errorMessage = null,
    );
    notifyListeners();
  }

  Future<void> emptyFoodList() async {
    repository.emptySavedFoodList();
    _setFoodModelListToSavedList();
  }

  //! Private functions
  Future<void> _setFoodModelListToSavedList() async {
    final failureOrList = await repository.getSavedFoods();
    failureOrList.fold(
      (failure) => _foodModelList = [],
      (list) => _foodModelList = list,
    );
    notifyListeners();
  }

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
