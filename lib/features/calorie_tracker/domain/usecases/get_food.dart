import 'package:dartz/dartz.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:elegant_calorie_tracker/core/usecases/usecase.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/entities/food.dart';
import 'package:elegant_calorie_tracker/features/calorie_tracker/domain/repositories/food_repository.dart';
import 'package:equatable/equatable.dart';

class GetFood extends UseCase<Food, Params> {
  final FoodRepository repository;

  GetFood(this.repository);

  @override
  Future<Either<Failure, Food>> call(Params params) async {
    return repository.getFood(params.query);
  }
}

class Params extends Equatable {
  final String query;

  const Params({required this.query});

  @override
  // TODO: implement props
  List<Object?> get props => [query];
}
