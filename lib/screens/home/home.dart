import 'file:///home/joaophp/Desenvolvimento/Projetos/Personal/elegant_calorie_tracker/test/testfodder.dart';
import 'package:elegant_calorie_tracker/screens/food_search/food_search.dart';
import 'package:elegant_calorie_tracker/theme_data/Themes.dart';
import 'package:elegant_calorie_tracker/utils/screen.dart';
import 'package:elegant_calorie_tracker/screens/home/local_widgets/calorie_counter.dart';
import 'package:elegant_calorie_tracker/common_widgets/custom_text_widget.dart';
import 'package:elegant_calorie_tracker/common_widgets/food_column_widget.dart';
import 'package:elegant_calorie_tracker/screens/home/local_widgets/nutrients_row_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key, @required this.appTitle}) : super(key: key);
  final String appTitle;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print(Screen.size(context));
    double barSize = Screen.isLandscape(context)
        ? Screen.heightUnit(context) * 5
        : Screen.heightUnit(context) * 6;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(barSize),
        child: AppBar(
          title: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  'G',
                  color: Themes.header(context),
                  fontWeight: FontWeight.normal,
                  fontSize: Screen.heightUnit(context) * 8.5,
                  fontFamily: 'Doodle',
                ),
                SizedBox(
                  width: Screen.widthUnit(context) * 3,
                ),
                CustomTextWidget(
                  widget.appTitle,
                  color: Themes.header(context),
                  fontSize: Screen.heightUnit(context) * 3.5,
                  fontFamily: 'Aladin',
                ),
              ],
            ),
          ),
          backgroundColor: Themes.mainBackground(context),
          centerTitle: true,
          elevation: 4.0,
          actions: [
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {},
              color: Themes.header(context),
              iconSize: Screen.heightUnit(context) * 3.5,
            ),
          ],
        ),
      ),
      body: Container(
        // Adds the background pattern
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.5, 0.5],
            colors: [
              Themes.mainBackground(context),
              Themes.secondaryBackground(context),
            ],
          ),
        ),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    TestList testList = TestList(context);
    testList.testFunction();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Screen.heightUnit(context) * 3,
          ),
          Screen.isLandscape(context)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalorieCounter(),
                    SizedBox(
                      width: Screen.widthUnit(context) * 10,
                    ),
                    NutrientsRow(),
                  ],
                )
              : Column(
                  children: [
                    CalorieCounter(),
                    NutrientsRow(),
                  ],
                ),
          SizedBox(
            height: Screen.isLandscape(context)
                ? Screen.heightUnit(context) * 5
                : Screen.heightUnit(context) * 2,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Divider(
                thickness: Screen.isLandscape(context)
                    ? Screen.heightUnit(context) * 1
                    : Screen.heightUnit(context) * .5,
                indent: Screen.widthUnit(context) * 7.5,
                endIndent: Screen.widthUnit(context) * 7.5,
              ),
              FoodSearch(),
            ],
          ),
          SizedBox(
            height: Screen.heightUnit(context) * 2,
          ),
          FoodColumn(
            children: testList.foodWidgetList,
          ),
        ],
      ),
    );
  }
}
