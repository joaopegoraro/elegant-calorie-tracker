import 'dart:convert';

import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/data/models/food_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FoodLocalDataSource {
  /// Gets the saved foods
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<List<FoodModel>> getSavedFoods();

  Future<void> saveFood(FoodModel foodToCache);
}

const String cachedFoodList = 'CACHED_FOOD_LIST';

class SharedPrefFoodLocalDataSource implements FoodLocalDataSource {
  final SharedPreferences sharedPreferences;

  SharedPrefFoodLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> saveFood(FoodModel foodToCache) {
    final String? initialString = sharedPreferences.getString(cachedFoodList);
    // if the cached food list is null, create a new json file containing the
    // converted food model
    if (initialString == null) {
      final List<Map> itemsList = [];
      final convertedModel = foodToCache.toJson();
      itemsList.add(convertedModel);
      final finalMap = {"items": itemsList};
      return sharedPreferences.setString(
        cachedFoodList,
        json.encode(finalMap),
      );
      // Otherwise append the new converted food model to the already existing
      // json file
    } else {
      final convertedJson = json.decode(initialString) as Map<String, dynamic>;
      final convertedModel = foodToCache.toJson();
      final itemsList = convertedJson["items"] ?? [];
      itemsList.add(convertedModel);
      final finalMap = {"items": itemsList};
      return sharedPreferences.setString(
        cachedFoodList,
        json.encode(finalMap),
      );
    }
  }

  @override
  Future<List<FoodModel>> getSavedFoods() {
    final String? cachedList = sharedPreferences.getString(cachedFoodList);
    if (cachedList == null) {
      throw CacheException();
    } else {
      final convertedJson = json.decode(cachedList) as Map<String, dynamic>;
      return Future.value(FoodModel.fromJson(convertedJson));
    }
  }
}
