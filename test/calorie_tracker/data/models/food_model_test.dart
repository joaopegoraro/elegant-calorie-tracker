import 'dart:convert';

import 'package:elegant_calorie_tracker/calorie_tracker/data/models/food_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  const testFoodModel = FoodModel(
    name: "Pizza",
    servingSize: 100,
    calories: 262.9,
    sugar: 3.6,
    fiber: 2.3,
    totalCarbs: 32.9,
    saturatedFat: 4.5,
    totalFat: 9.8,
    protein: 11.4,
    sodium: 587,
    potassium: 217,
    cholesterol: 16,
  );

  test(
    'should be a subclass of Food entity',
    () async {
      // assert
      expect(testFoodModel, isA<FoodModel>());
    },
  );

  group('fromJson', () {
    test(
      'should return a List with a valid model',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('food.json')) as Map<String, dynamic>;
        // act
        final List<FoodModel> result = FoodModel.fromJson(jsonMap);
        // assert
        expect(result, [testFoodModel]);
      },
    );
    test('should return null', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('no_food.json')) as Map<String, dynamic>;
      // act
      final List<FoodModel> result = FoodModel.fromJson(jsonMap);
      // assert
      expect(result, []);
    });

    test('should return a list of models', () async {
      // arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('multiple_foods.json')) as Map<String, dynamic>;
      // act
      final result = FoodModel.fromJson(jsonMap);

      // assert
      expect(result, [testFoodModel, testFoodModel]);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing the proper data', () async {
      // act
      final Map<String, dynamic> result = testFoodModel.toJson();
      // assert
      final Map<String, dynamic> expectedJsonMap = {
        "sugar_g": 3.6,
        "fiber_g": 2.3,
        "serving_size_g": 100,
        "sodium_mg": 587,
        "name": "pizza",
        "potassium_mg": 217,
        "fat_saturated_g": 4.5,
        "fat_total_g": 9.8,
        "calories": 262.9,
        "cholesterol_mg": 16,
        "protein_g": 11.4,
        "carbohydrates_total_g": 32.9
      };
      expect(result, expectedJsonMap);
    });
  });
}
