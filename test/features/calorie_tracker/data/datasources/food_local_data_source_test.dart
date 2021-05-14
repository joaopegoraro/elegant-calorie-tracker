import 'dart:convert';

import 'package:elegant_calorie_tracker/core/error/exception.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/data/datasources/food_local_data_source.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/data/models/food_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';
import 'food_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late SharedPrefFoodLocalDataSource dataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = SharedPrefFoodLocalDataSource(
      sharedPreferences: mockSharedPreferences,
    );
  });
  final jsonString = fixture('food.json');

  const tFoodModel = FoodModel(
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
  group('saveFood', () {
    test('should call SharedPreferences to cache the newly createad data', () {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      // act
      dataSource.saveFood(tFoodModel);
      // assert
      final List<Map> itemsList = [];
      final convertedModel = tFoodModel.toJson();
      itemsList.add(convertedModel);
      final finalMap = {"items": itemsList};
      verify(mockSharedPreferences.setString(
          cachedFoodList, json.encode(finalMap)));
    });
    test('should call SharedPreferences to cache the appended data', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(jsonString);
      when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => true);
      // act
      dataSource.saveFood(tFoodModel);
      // assert
      final convertedJson = json.decode(jsonString) as Map<String, dynamic>;
      final convertedModel = tFoodModel.toJson();
      final itemsList = convertedJson["items"] ?? [];
      itemsList.add(convertedModel);
      final finalMap = {"items": itemsList};
      verify(mockSharedPreferences.setString(
          cachedFoodList, json.encode(finalMap)));
      expect(finalMap, json.decode(fixture('multiple_foods.json')));
    });
  });

  group('getSavedFoods', () {
    const List<FoodModel> tFoodList = [tFoodModel, tFoodModel];
    test('should return a valid list from the cache if it is not empty',
        () async {
      // arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('multiple_foods.json'));
      // act
      final result = await dataSource.getSavedFoods();
      // assert
      verify(mockSharedPreferences.getString(cachedFoodList));
      expect(result, tFoodList);
    });

    test('should return Cache Exception if the cache is empy', () async {
      // arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      // act
      final call = dataSource.getSavedFoods;
      // assert
      expect(call, throwsA(isA<CacheException>()));
    });
  });
}
