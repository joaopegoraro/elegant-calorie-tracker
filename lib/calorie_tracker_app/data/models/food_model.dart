import 'package:equatable/equatable.dart';

import '../../../core/utils/capitalizer.dart';

/// Food model which stores food properties
class FoodModel extends Equatable {
  final String name;
  final double servingSize;
  final double calories;
  final double sugar;
  final double fiber;
  final double totalCarbs;
  final double saturatedFat;
  final double totalFat;
  final double protein;
  final double sodium;
  final double potassium;
  final double cholesterol;
  final int index;

  const FoodModel(
    this.index, {
    required this.name,
    required this.servingSize,
    required this.calories,
    required this.sugar,
    required this.fiber,
    required this.totalCarbs,
    required this.saturatedFat,
    required this.totalFat,
    required this.protein,
    required this.sodium,
    required this.potassium,
    required this.cholesterol,
  });

  @override
  List<Object?> get props => [
        name,
        servingSize,
        calories,
        sugar,
        fiber,
        totalCarbs,
        saturatedFat,
        totalFat,
        protein,
        sodium,
        potassium,
        cholesterol
      ];

  static List<FoodModel> fromJson(Map<String, dynamic> json) {
    // Get the 'items' list that contains the food maps
    final List<dynamic> items = json["items"] as List<dynamic>;
    // If the list is empty return an empty list
    if (items.isEmpty) {
      return [];
    }
    // Otherwise return a list with FoodModels made from the 'items' maps
    final List<FoodModel> finalList = [];
    for (int _index = 0; _index < items.length; _index++) {
      final foodMap = items[_index];
      finalList.add(FoodModel(
        _index,
        name: capitalize(foodMap["name"].toString()),
        servingSize: foodMap["serving_size_g"].toDouble() as double,
        calories: foodMap["calories"].toDouble() as double,
        sugar: foodMap["sugar_g"].toDouble() as double,
        fiber: foodMap['fiber_g'].toDouble() as double,
        totalCarbs: foodMap['carbohydrates_total_g'].toDouble() as double,
        saturatedFat: foodMap['fat_saturated_g'].toDouble() as double,
        totalFat: foodMap['fat_total_g'].toDouble() as double,
        protein: foodMap['protein_g'].toDouble() as double,
        sodium: foodMap['sodium_mg'].toDouble() as double,
        potassium: foodMap['potassium_mg'].toDouble() as double,
        cholesterol: foodMap['cholesterol_mg'].toDouble() as double,
      ));
    }
    return finalList;
  }

  Map<String, dynamic> toJson() {
    return {
      "sugar_g": sugar,
      "fiber_g": fiber,
      "serving_size_g": servingSize,
      "sodium_mg": sodium,
      "name": name.toLowerCase(),
      "potassium_mg": potassium,
      "fat_saturated_g": saturatedFat,
      "fat_total_g": totalFat,
      "calories": calories,
      "cholesterol_mg": cholesterol,
      "protein_g": protein,
      "carbohydrates_total_g": totalCarbs,
    };
  }
}
