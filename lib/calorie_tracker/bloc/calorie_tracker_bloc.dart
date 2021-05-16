import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_model.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/data/food_repository.dart';
import 'package:elegant_calorie_tracker/core/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';

part 'calorie_tracker_event.dart';
part 'calorie_tracker_state.dart';

const String notFoundFailureMessage =
    'Could not find nutritional information for this query';
const String cacheFailureMessage = 'Food list is empty';
const String serverFailureMessage = 'Could not connect to the server';

class CalorieTrackerBloc
    extends Bloc<CalorieTrackerEvent, CalorieTrackerState> {
  final FoodRepository repository;

  CalorieTrackerBloc({required this.repository}) : super(NoSavedFood());

  @override
  Stream<CalorieTrackerState> mapEventToState(
    CalorieTrackerEvent event,
  ) async* {
    if (event is GetFood) {
      yield SavingFood();
      final eitherFoodModelListOrFailure =
          await repository.getFood(event.query);
      yield* _eitherErrorOrFoodSavedState(eitherFoodModelListOrFailure);
    } else if (event is GetSavedFood) {
      yield SavingFood();
      final eitherFoodModelListOrFailure = await repository.getSavedFoods();
      yield* _eitherErrorOrFoodSavedState(eitherFoodModelListOrFailure);
    }
  }

  Stream<CalorieTrackerState> _eitherErrorOrFoodSavedState(
      Either<Failure, List<FoodModel>> eitherFoodModelListOrFailure) async* {
    yield* eitherFoodModelListOrFailure.fold(
      (failure) async* {
        yield Error(
            errorMessage: _returnCorrectErrorMessageFromFailure(failure));
      },
      (foodModelList) async* {
        yield FoodSaved(savedFoods: foodModelList);
      },
    );
  }

  String _returnCorrectErrorMessageFromFailure(Failure failure) {
    switch (failure.runtimeType) {
      case NotFoundFailure:
        return notFoundFailureMessage;
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }
}
