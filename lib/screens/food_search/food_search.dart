import 'file:///home/joaophp/Desenvolvimento/Projetos/Personal/elegant_calorie_tracker/test/testfodder.dart';
import 'package:elegant_calorie_tracker/theme_data/Themes.dart';
import 'package:elegant_calorie_tracker/utils/screen.dart';
import 'package:flutter/material.dart';
import 'package:search_choices/search_choices.dart';

class FoodSearch extends StatefulWidget {
  @override
  _FoodSearchState createState() => _FoodSearchState();
}

class _FoodSearchState extends State<FoodSearch> {
  @override
  Widget build(BuildContext context) {
    TestList list = TestList(context);
    list.testFunction();
    return Container(
      margin: EdgeInsets.only(left: Screen.width(context) * 2),
      decoration: BoxDecoration(
        color: Themes.cardBackground(context),
      ),
      child: SearchChoices.single(
        items: list.foodDropDownList,
        style: TextStyle(
          fontFamily: 'Arial',
        ),
        value: 2,
        menuBackgroundColor: Themes.mainBackground(context),
        hint: 'Add a food',
        autofocus: false,
        isExpanded: true,
        onChanged: (value) {},
      ),
    );
  }
}
