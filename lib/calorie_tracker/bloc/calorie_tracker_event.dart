part of 'calorie_tracker_bloc.dart';

abstract class CalorieTrackerEvent extends Equatable {
  const CalorieTrackerEvent();

  @override
  List<Object> get props => [];
}

class GetFood extends CalorieTrackerEvent {
  final String query;

  const GetFood(this.query);

  @override
  List<Object> get props => [query];
}

class GetSavedFood extends CalorieTrackerEvent {}
