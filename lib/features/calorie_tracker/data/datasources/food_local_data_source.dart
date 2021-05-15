import 'dart:convert';

import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/data/models/food_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FoodLocalDataSource {
  /// Gets the saved foods
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<List<FoodModel>> getSavedFoods();

  Future<void> saveFoods(List<FoodModel> foodToCache);
}

const String cachedFoodList = 'CACHED_FOOD_LIST';

class SharedPrefFoodLocalDataSource implements FoodLocalDataSource {
  final SharedPreferences sharedPreferences;

  SharedPrefFoodLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> saveFoods(List<FoodModel> foodsToCache) {
    final String? initialJsonString =
        sharedPreferences.getString(cachedFoodList);

    // if the cached food list is null, create a new json string containing the
    // converted food model
    if (initialJsonString == null) {
      final List<Map> listOfJsonMaps = [];
      final String finalJsonString =
          mergeFoodModelListAndJsonMapIntoString(foodsToCache, listOfJsonMaps);
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
          mergeFoodModelListAndJsonMapIntoString(foodsToCache, listOfJsonMaps);
      return sharedPreferences.setString(
        cachedFoodList,
        finalJsonString,
      );
    }
  }

  @override
  Future<List<FoodModel>> getSavedFoods() {
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

  String mergeFoodModelListAndJsonMapIntoString(
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
