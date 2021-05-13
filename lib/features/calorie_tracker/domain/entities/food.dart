import 'package:equatable/equatable.dart';

/* 
  How the json objects look like
      "sugar_g"
      "fiber_g"
      "serving_size_g"
      "sodium_mg"
      "name"
      "potassium_mg"
      "fat_saturated_g"
      "fat_total_g"
      "calories"
      "cholesterol_mg"
      "protein_g"
      "carbohydrates_total_g"
 */

/// Food model which stores food properties
class Food extends Equatable {
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

  const Food({
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
}
