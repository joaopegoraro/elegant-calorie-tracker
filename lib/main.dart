import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'calorie_tracker/presentation/home_page.dart';
import 'core/utils/themes.dart';
import 'injection_container.dart' as di;

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
    return MaterialApp(
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
    );
  }
}
