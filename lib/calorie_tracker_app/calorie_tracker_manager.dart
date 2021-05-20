import 'package:flutter/material.dart';

import '../core/error/failures.dart';
import 'data/food_model.dart';
import 'data/food_repository.dart';
import 'presentation/widgets/food_widget.dart';

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
  String? _errorMessage;
  bool _isLoading = false;

  //! Getters
  double get calories => _nutricionalInformation(NutrientType.calories);
  double get carbs => _nutricionalInformation(NutrientType.carbs);
  double get fat => _nutricionalInformation(NutrientType.fat);
  double get protein => _nutricionalInformation(NutrientType.protein);
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  List<FoodModel> get foodModelList => _foodModelList;

  //! Public functions

  Future<void> getFood(String query) async {
    _setLoading(true);
    final eitherFailureOrList = await repository.getFood(query);
    _setFoodModelListToSavedList();
    eitherFailureOrList.fold(
      (failure) =>
          failure is ServerFailure ? noConnectionMessage : foodNotFoundMessage,
      (list) => _errorMessage = null,
    );
    _setLoading(false);
  }

  Future<void> emptyFoodList() async {
    repository.emptySavedFoodList();
    _setFoodModelListToSavedList();
  }

  Future<void> removeFood(int index) async {
    await repository.removeSavedFood(index);
    _setFoodModelListToSavedList();
  }

  Future<void> editFood(int index, double servingSize) async {
    await repository.editFood(index, servingSize);
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

  void _setLoading(bool boolean) {
    _isLoading = boolean;
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
