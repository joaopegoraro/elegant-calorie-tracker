import 'package:flutter/material.dart';

class LightTheme {
  /// Colors.brown[600]
  static const Color header = const Color(0xFF6D4C41);

  /// Colors.brown[600]
  static const Color button = const Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color cardHeader = const Color(0xFF4E342E);

  /// Colors.brown[600]
  static const Color cardContent = const Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color cardConstantUnit = const Color(0xFF4E342E);

  /// Colors.grey[100]
  static const Color cardBackground = const Color(0xFFF5F5F5);

  /// Colors.brown[200]
  static const Color mainBackground = const Color(0xFFBCAAA4);

  /// Colors.brown[300]
  static const Color secondaryBackground = const Color(0xFFA1887F);

  /// Colors.brown[800]
  static const Color constantUnit = const Color(0xFF4E342E);
}

class DarkTheme {
  /// Colors.brown[100]
  static const Color header = const Color(0xFFD7CCC8);

  /// Colors.brown[600]
  static const Color button = const Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color cardHeader = const Color(0xFF4E342E);

  /// Colors.brown[600]
  static const Color cardContent = const Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color cardConstantUnit = const Color(0xFF4E342E);

  /// Colors.grey[100]
  static const Color cardBackground = const Color(0xFFF5F5F5);

  /// Colors.brown[600]
  static const Color mainBackground = const Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color secondaryBackground = const Color(0xFF4E342E);

  /// Colors.brown[200]
  static const Color constantUnit = const Color(0xFFBCAAA4);
}

/// Static class that contains the theme colors
class Themes {
  static const MaterialColor swatch = Colors.brown;

  /// Colors.white
  static const Color light = const Color(0xFFFFFFFF);

  /// Colors.black
  static const Color dark = const Color(0xFF000000);

  static bool isDarkMode(BuildContext context) =>
      MediaQuery.of(context).platformBrightness == Brightness.dark;

  /// LightMode: brown[600] | Darkmode: brown[200]
  static Color header(BuildContext context) =>
      isDarkMode(context) ? DarkTheme.header : LightTheme.header;

  /// LightMode: brown[600] | Darkmode: brown[200]
  static Color button(BuildContext context) =>
      isDarkMode(context) ? DarkTheme.button : LightTheme.button;

  /// LightMode: brown[800] | Darkmode: brown[300]
  static Color cardHeader(BuildContext context) =>
      isDarkMode(context) ? DarkTheme.cardHeader : LightTheme.cardHeader;

  /// LightMode: brown[800] | Darkmode: brown[300]
  static Color cardContent(BuildContext context) =>
      isDarkMode(context) ? DarkTheme.cardContent : LightTheme.cardContent;

  /// LightMode: brown[800] | Darkmode: brown[300]
  static Color cardConstantUnit(BuildContext context) => isDarkMode(context)
      ? DarkTheme.cardConstantUnit
      : LightTheme.cardConstantUnit;

  /// LightMode: grey[100] | Darkmode: grey[900]
  static Color cardBackground(BuildContext context) => isDarkMode(context)
      ? DarkTheme.cardBackground
      : LightTheme.cardBackground;

  /// LightMode: brown[200] | Darkmode: brown[600]
  static Color mainBackground(BuildContext context) => isDarkMode(context)
      ? DarkTheme.mainBackground
      : LightTheme.mainBackground;

  /// LightMode: brown[300] | Darkmode: brown[800]
  static Color secondaryBackground(BuildContext context) => isDarkMode(context)
      ? DarkTheme.secondaryBackground
      : LightTheme.secondaryBackground;

  /// LightMode: brown[300] | Darkmode: brown[800]
  static Color constantUnit(BuildContext context) =>
      isDarkMode(context) ? DarkTheme.constantUnit : LightTheme.constantUnit;
}
