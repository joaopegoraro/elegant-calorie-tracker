import 'package:equatable/equatable.dart';

class NutritionalModel extends Equatable {
  static const String _name = 'Total nutritional information';
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

  const NutritionalModel({
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

  String get name => _name;

  @override
  List<Object?> get props => [
        name,
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
