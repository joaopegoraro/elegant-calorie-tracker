import 'package:flutter/material.dart';

import '../../core/utils/screen.dart';
import '../../core/utils/themes.dart';
import '../../injection_container.dart';
import 'widgets/appbar.dart';
import 'widgets/calorie_tracker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.appTitle}) : super(key: key);
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    debugPrint(Screen.size(context).toString());
    final double barSize = Screen.isLandscape(context)
        ? Screen.heightUnit(context) * 6.5
        : Screen.heightUnit(context) * 7.5;
    return FutureBuilder(
        future: serviceLocator.allReady(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(barSize),
                child: CalorieTrackerAppBar(
                  appTitle: appTitle,
                )),
            body: Container(
              // Adds the background pattern
              height: double.maxFinite,
              width: double.maxFinite,
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
              child: snapshot.hasData
                  ? CalorieTracker()
                  : const Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }
}
