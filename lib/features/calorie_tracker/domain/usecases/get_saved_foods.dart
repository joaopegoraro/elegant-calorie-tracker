import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/core/usecases/usecase.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/repositories/food_repository.dart';

class GetSavedFoods extends UseCase<List<Food>, NoParams> {
  final FoodRepository repository;

  GetSavedFoods(this.repository);

  @override
  Future<Either<Failure, List<Food>>> call(NoParams params) {
    return repository.getSavedFoods();
  }
}

class NoParams {}
