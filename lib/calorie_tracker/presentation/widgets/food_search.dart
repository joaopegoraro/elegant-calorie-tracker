import 'package:elegant_calorie_tracker/calorie_tracker/bloc/calorie_tracker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  final TextEditingController controller = TextEditingController();
  late String inputString;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {
        inputString = value;
      },
      onSubmitted: (_) {
        dispatchQuery();
      },
    );
  }

  void dispatchQuery() {
    controller.clear();
    BlocProvider.of<CalorieTrackerBloc>(context).add(GetFood(inputString));
  }
}
