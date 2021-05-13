import 'file:///home/joaophp/Desenvolvimento/Projetos/Personal/elegant_calorie_tracker/test/testfodder.dart';
import 'package:flutter/material.dart';

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  @override
  Widget build(BuildContext context) {
    final TestList list = TestList(context);
    list.testFunction();
    return Container();
  }
}
