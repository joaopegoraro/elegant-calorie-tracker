import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';
import 'package:elegant_calorie_tracker/core/capitalizer.dart';

class FoodModel extends Food {
  const FoodModel({
    required String name,
    required double servingSize,
    required double calories,
    required double sugar,
    required double fiber,
    required double totalCarbs,
    required double saturatedFat,
    required double totalFat,
    required double protein,
    required double sodium,
    required double potassium,
    required double cholesterol,
  }) : super(
          name: name,
          servingSize: servingSize,
          calories: calories,
          sugar: sugar,
          fiber: fiber,
          totalCarbs: totalCarbs,
          saturatedFat: saturatedFat,
          totalFat: totalFat,
          protein: protein,
          sodium: sodium,
          potassium: potassium,
          cholesterol: cholesterol,
        );

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> items = json["items"] as List<dynamic>;
    final Map foodMap = items[0] as Map;
    return FoodModel(
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
    );
  }
}
/*
*/
