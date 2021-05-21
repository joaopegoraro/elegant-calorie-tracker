import 'package:device_preview/device_preview.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'calorie_tracker_app/calorie_tracker_manager.dart';
import 'calorie_tracker_app/presentation/home_page.dart';
import 'core/utils/themes.dart' as themes;
import 'injection_container.dart' as di;
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await di.init();
  runApp(
    // ignore: avoid_redundant_argument_values
    DevicePreview(
      // ignore: avoid_redundant_argument_values
      enabled: true,
      builder: (context) => EasyDynamicThemeWidget(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const String appTitle = "Elegant Calorie Tracker";
    return ChangeNotifierProvider(
      create: (context) => serviceLocator<CalorieTrackerManager>(),
      child: Consumer<CalorieTrackerManager>(
        builder: (context, manager, child) {
          return MaterialApp(
            themeMode: EasyDynamicTheme.of(context).themeMode,
            theme: themes.lightTheme,
            darkTheme: themes.darkTheme,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            title: appTitle,
            home: const HomeScreen(
              appTitle: appTitle,
            ),
          );
        },
      ),
    );
  }
}
