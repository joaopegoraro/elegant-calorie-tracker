import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'calorie_tracker_event.dart';
part 'calorie_tracker_state.dart';

class CalorieTrackerBloc extends Bloc<CalorieTrackerEvent, CalorieTrackerState> {
  CalorieTrackerBloc() : super(CalorieTrackerInitial());

  @override
  Stream<CalorieTrackerState> mapEventToState(
    CalorieTrackerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
