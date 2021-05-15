import 'dart:convert';

import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/core/production_api.dart';
import 'package:http/http.dart' as http;
import 'package:elegant_calorie_tracker/features/calorie_tracker/data/models/food_model.dart';

abstract class FoodRemoteDataSource {
  /// Calls the https://api.calorieninjas.com/v1/nutrition?query='{query}
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<FoodModel>> getFood(String query);
}

class CalorieNinjasFoodRemoteDataSource implements FoodRemoteDataSource {
  final http.Client client;

  CalorieNinjasFoodRemoteDataSource({required this.client});

  @override
  Future<List<FoodModel>> getFood(String query) async {
    final response = await client.get(
      Uri.parse('https://api.calorieninjas.com/v1/nutrition?query=$query'),
      headers: {
        'X-Api-Key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final List<FoodModel>? listOfModels = FoodModel.fromJson(
          json.decode(response.body) as Map<String, dynamic>);

      if (listOfModels == null) {
        throw ServerException();
      }
      return listOfModels;
    } else {
      throw ServerException();
    }
  }
}
