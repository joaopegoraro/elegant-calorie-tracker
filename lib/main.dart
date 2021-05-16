import 'package:device_preview/device_preview.dart';
import 'package:elegant_calorie_tracker/calorie_tracker/presentation/home.dart';
import 'package:elegant_calorie_tracker/core/utils/themes.dart';
import 'package:flutter/material.dart';

void main() {
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
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here
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
