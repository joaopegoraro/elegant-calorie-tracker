part of 'calorie_tracker_bloc.dart';

abstract class CalorieTrackerState extends Equatable {
  const CalorieTrackerState();

  @override
  List<Object> get props => [];
}

class NoSavedFood extends CalorieTrackerState {}

class SavingFood extends CalorieTrackerState {}

class FoodSaved extends CalorieTrackerState {
  final List<FoodModel> savedFoods;

  const FoodSaved({required this.savedFoods});

  @override
  List<Object> get props => [savedFoods];
}

class Error extends CalorieTrackerState {
  final String errorMessage;

  const Error({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
