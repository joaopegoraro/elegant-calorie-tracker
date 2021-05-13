import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';

abstract class FoodRepository {
  Future<Either<Failure, Food>> getFood(String query);
}
