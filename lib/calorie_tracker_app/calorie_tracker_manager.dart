import 'package:flutter/material.dart';

import '../core/error/failures.dart';
import 'data/food_repository.dart';
import 'data/models/food_model.dart';
import 'data/models/nutritional_model.dart';

const noConnectionMessage = 'Could not connect to the server';
const foodNotFoundMessage = 'Could not find a food that matches your query';

enum NutrientType {
  calories,
  sugar,
  fiber,
  totalCarbs,
  saturatedFat,
  totalFat,
  protein,
  sodium,
  potassium,
  cholesterol,
}

class CalorieTrackerManager extends ChangeNotifier {
  final FoodRepository repository;
  CalorieTrackerManager({required this.repository}) {
    _setFoodModelListToSavedList();
  }

  //! Mutable Variables
  List<FoodModel> _foodModelList = [];
  String _errorMessage = '';
  bool _isLoading = false;

  //! Getters
  NutritionalModel get nutritionalModel =>
      _createNutritionalModel(_foodModelList);
  String get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  List<FoodModel> get foodModelList => _foodModelList;

  //! Public functions

  Future<void> getFood(String query) async {
    _setLoading(true);
    final eitherFailureOrList = await repository.getFood(query);
    _setFoodModelListToSavedList();
    _errorMessage = eitherFailureOrList.fold(
      (failure) =>
          failure is ServerFailure ? noConnectionMessage : foodNotFoundMessage,
      (list) => '',
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

  NutritionalModel _createNutritionalModel(List<FoodModel> foodModelList) {
    return NutritionalModel(
      calories: _nutricionalInformation(NutrientType.calories),
      sugar: _nutricionalInformation(NutrientType.sugar),
      fiber: _nutricionalInformation(NutrientType.fiber),
      totalCarbs: _nutricionalInformation(NutrientType.totalCarbs),
      saturatedFat: _nutricionalInformation(NutrientType.saturatedFat),
      totalFat: _nutricionalInformation(NutrientType.totalFat),
      protein: _nutricionalInformation(NutrientType.protein),
      sodium: _nutricionalInformation(NutrientType.sodium),
      potassium: _nutricionalInformation(NutrientType.potassium),
      cholesterol: _nutricionalInformation(NutrientType.cholesterol),
    );
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
        case NutrientType.totalCarbs:
          {
            for (final FoodModel foodModel in _foodModelList) {
              nutrient += foodModel.totalCarbs;
            }
            return nutrient;
          }
        case NutrientType.totalFat:
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
        case NutrientType.sugar:
          for (final FoodModel foodModel in _foodModelList) {
            nutrient += foodModel.sugar;
          }
          return nutrient;
        case NutrientType.fiber:
          for (final FoodModel foodModel in _foodModelList) {
            nutrient += foodModel.fiber;
          }
          return nutrient;
        case NutrientType.saturatedFat:
          for (final FoodModel foodModel in _foodModelList) {
            nutrient += foodModel.saturatedFat;
          }
          return nutrient;
        case NutrientType.sodium:
          for (final FoodModel foodModel in _foodModelList) {
            nutrient += foodModel.sodium;
          }
          return nutrient;
        case NutrientType.potassium:
          for (final FoodModel foodModel in _foodModelList) {
            nutrient += foodModel.potassium;
          }
          return nutrient;
        case NutrientType.cholesterol:
          for (final FoodModel foodModel in _foodModelList) {
            nutrient += foodModel.cholesterol;
          }
          return nutrient;
      }
    }
    return nutrient;
  }
}
