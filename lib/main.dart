import 'package:device_preview/device_preview.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/calorie_tracker_manager.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/presentation/home.dart';
import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:elegant_calorie_tracker/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    // ignore: avoid_redundant_argument_values
    DevicePreview(enabled: true, builder: (context) => MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String appTitle = "Elegant Calorie Tracker";
    return ChangeNotifierProvider(
      create: (context) => di.serviceLocator<CalorieTrackerManager>(),
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: appTitle,
        theme: ThemeData(
          fontFamily: 'Aladin',
          primarySwatch: Themes.swatch,
        ),
        home: const HomeScreen(
          appTitle: appTitle,
        ),
      ),
    );
  }
}
