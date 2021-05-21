import 'package:elegant_calorie_tracker/calorie_tracker_app/presentation/widgets/settings_drawer.dart';
import 'package:flutter/material.dart';

import '../../core/utils/screen.dart';
import '../../injection_container.dart';
import 'widgets/appbar.dart';
import 'widgets/calorie_tracker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.appTitle}) : super(key: key);
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    debugPrint(Screen.size(context).toString());
    final theme = Theme.of(context);
    return FutureBuilder(
        future: serviceLocator.allReady(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            endDrawer: SettingsDrawer(),
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
                    theme.dialogBackgroundColor,
                    theme.backgroundColor,
                  ],
                ),
              ),
              child: snapshot.hasData
                  ? _buildChild(context, appTitle)
                  : const Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }
}

Widget _buildChild(BuildContext context, String appTitle) {
  return SingleChildScrollView(
    child: Column(
      children: [
        CalorieTrackerAppBar(appTitle: appTitle),
        CalorieTracker(),
      ],
    ),
  );
}
