part of 'calorie_tracker_bloc.dart';

abstract class CalorieTrackerState extends Equatable {
  const CalorieTrackerState();
  
  @override
  List<Object> get props => [];
}

class CalorieTrackerInitial extends CalorieTrackerState {}
