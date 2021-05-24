import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/exception.dart';
import '../models/food_model.dart';

abstract class FoodLocalDataSource {
  /// Gets the saved foods
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<FoodModel>> getSavedFoods();
  Future<void> saveFoods(List<FoodModel> foodToCache);
  Future<void> emptySavedFoodList();
  Future<void> removeSavedFood(int index);
  Future<void> editSavedFood(int index, double newServingSize);
}

const String cachedFoodList = 'CACHED_FOOD_LIST';
const String savedDate = 'SAVED_DATE';

class SharedPrefFoodLocalDataSource implements FoodLocalDataSource {
  final SharedPreferences sharedPreferences;

  const SharedPrefFoodLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> saveFoods(List<FoodModel> foodsToCache) {
    final String? initialJsonString =
        sharedPreferences.getString(cachedFoodList);
    sharedPreferences.setInt(savedDate, DateTime.now().day);
    // if the cached food list is null, create a new json string containing the
    // converted food model
    if (initialJsonString == null) {
      final List<Map> listOfJsonMaps = [];
      final String finalJsonString =
          _mergeFoodModelListAndJsonMapIntoString(foodsToCache, listOfJsonMaps);
      return sharedPreferences.setString(
        cachedFoodList,
        finalJsonString,
      );
      // Otherwise append the food model to the already existing json string
    } else {
      final convertedJsonStringToJsonMap =
          json.decode(initialJsonString) as Map<String, dynamic>;
      final listOfJsonMaps =
          convertedJsonStringToJsonMap["items"] as List<dynamic>;
      final String finalJsonString =
          _mergeFoodModelListAndJsonMapIntoString(foodsToCache, listOfJsonMaps);
      return sharedPreferences.setString(
        cachedFoodList,
        finalJsonString,
      );
    }
  }

  @override
  Future<List<FoodModel>> getSavedFoods() {
    final int today = DateTime.now().day;
    final int? savedDay = sharedPreferences.getInt(savedDate);
    if (today != savedDay) {
      emptySavedFoodList();
      throw CacheException();
    }
    final String? savedFoodList = sharedPreferences.getString(cachedFoodList);
    if (savedFoodList == null) {
      throw CacheException();
    } else {
      final convertedSavedFoodListToJsonMap =
          json.decode(savedFoodList) as Map<String, dynamic>;
      final convertedJsonMapToFoodModelList =
          FoodModel.fromJson(convertedSavedFoodListToJsonMap);
      return Future.value(convertedJsonMapToFoodModelList);
    }
  }

  @override
  Future<void> emptySavedFoodList() => sharedPreferences.remove(cachedFoodList);

  @override
  Future<void> removeSavedFood(int index) async {
    final List<FoodModel> foodModelList = await getSavedFoods();
    foodModelList.removeAt(index);
    emptySavedFoodList();
    saveFoods(foodModelList);
  }

  @override
  Future<void> editSavedFood(int index, double newServingSize) async {
    final List<FoodModel> foodModelList = await getSavedFoods();
    final FoodModel oldFoodModel = foodModelList[index];
    if (oldFoodModel.servingSize == newServingSize) {
      return;
    }
    emptySavedFoodList();
    final double ratio = newServingSize / oldFoodModel.servingSize;
    final FoodModel editedFoodModel = FoodModel(
      index,
      name: oldFoodModel.name,
      servingSize: oldFoodModel.servingSize * ratio,
      calories: oldFoodModel.calories * ratio,
      sugar: oldFoodModel.sugar * ratio,
      fiber: oldFoodModel.fiber * ratio,
      totalCarbs: oldFoodModel.totalCarbs * ratio,
      saturatedFat: oldFoodModel.saturatedFat * ratio,
      totalFat: oldFoodModel.totalFat * ratio,
      protein: oldFoodModel.protein * ratio,
      sodium: oldFoodModel.sodium * ratio,
      potassium: oldFoodModel.potassium * ratio,
      cholesterol: oldFoodModel.cholesterol * ratio,
    );
    foodModelList[index] = editedFoodModel;
    saveFoods(foodModelList);
  }

  String _mergeFoodModelListAndJsonMapIntoString(
    List<FoodModel> foodModelList,
    List<dynamic> jsonMapList,
  ) {
    for (final FoodModel foodModel in foodModelList) {
      final convertedFoodModelToJsonMap = foodModel.toJson();
      jsonMapList.add(convertedFoodModelToJsonMap);
    }
    final finalJsonMap = {"items": jsonMapList};
    return json.encode(finalJsonMap);
  }
}
