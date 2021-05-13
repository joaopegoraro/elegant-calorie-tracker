import 'dart:convert';

import 'package:elegant_calorie_tracker/features/calorie_tracker/data/models/food_model.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

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
      expect(testFoodModel, isA<Food>());
    },
  );

  group('fromJson', () {
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        // arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('food.json')) as Map<String, dynamic>;
        // act
        final result = FoodModel.fromJson(jsonMap);
        print(result);
        // assert
        expect(result, testFoodModel);
      },
    );
  });
}
