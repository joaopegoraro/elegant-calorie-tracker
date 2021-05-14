import 'package:equatable/equatable.dart';

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
