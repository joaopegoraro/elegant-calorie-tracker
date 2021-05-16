import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/food_search.dart';
import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/calorie_counter.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/presentation/widgets/nutrients_row_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.appTitle}) : super(key: key);
  final String appTitle;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint(Screen.size(context).toString());
    final double barSize = Screen.isLandscape(context)
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
                ),
              ],
            ),
          ),
          backgroundColor: Themes.mainBackground(context),
          centerTitle: true,
          elevation: 4.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
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
            stops: const [0.5, 0.5],
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
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Screen.heightUnit(context) * 3,
          ),
          OrientationBuilder(builder: (context, Orientation orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return Column(
                  children: [
                    CalorieCounter(),
                    NutrientsRow(),
                  ],
                );
              case Orientation.landscape:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CalorieCounter(),
                    SizedBox(
                      width: Screen.widthUnit(context) * 10,
                    ),
                    NutrientsRow(),
                  ],
                );
            }
          }),
          SizedBox(
            height: Screen.isLandscape(context)
                ? Screen.heightUnit(context) * 2.5
                : Screen.heightUnit(context) * 1,
          ),
          Divider(
            thickness: Screen.isLandscape(context)
                ? Screen.heightUnit(context) * 1
                : Screen.heightUnit(context) * .5,
            indent: Screen.widthUnit(context) * 7.5,
            endIndent: Screen.widthUnit(context) * 7.5,
          ),
          SizedBox(
            height: Screen.isLandscape(context)
                ? Screen.heightUnit(context) * 2.5
                : Screen.heightUnit(context) * 1,
          ),
          FoodSearch(),
          SizedBox(
            height: Screen.heightUnit(context) * 2,
          ),
          //FoodColumn(),
          SizedBox(
            height: Screen.heightUnit(context) * 2,
          ),
        ],
      ),
    );
  }
}
