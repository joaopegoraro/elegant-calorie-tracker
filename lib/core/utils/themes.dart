import 'package:flutter/material.dart';

class LightTheme {
  /// Colors.brown[600] OK
  static const Color header = Color(0xFF6D4C41);

  /// Colors.brown[600] OK
  static const Color button = Color(0xFF6D4C41);

  /// Colors.brown[800] OK
  static const Color cardHeader = Color(0xFF4E342E);

  /// Colors.brown[600] OK
  static const Color cardContent = Color(0xFF6D4C41);

  /// Colors.brown[800] OK
  static const Color cardConstantUnit = Color(0xFF4E342E);

  /// Colors.grey[100] OK
  static const Color cardBackground = Color(0xFFF5F5F5);

  /// Colors.brown[200] Ok
  static const Color mainBackground = Color(0xFFBCAAA4);

  /// Colors.brown[300] Ok
  static const Color secondaryBackground = Color(0xFFA1887F);

  /// Colors.brown[800] OK
  static const Color constantUnit = Color(0xFF4E342E);
}

class DarkTheme {
  /// Colors.brown[100]
  static const Color header = Color(0xFFD7CCC8);

  /// Colors.brown[600]
  static const Color button = Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color cardHeader = Color(0xFF4E342E);

  /// Colors.brown[600]
  static const Color cardContent = Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color cardConstantUnit = Color(0xFF4E342E);

  /// Colors.grey[100]
  static const Color cardBackground = Color(0xFFF5F5F5);

  /// Colors.brown[600]
  static const Color mainBackground = Color(0xFF6D4C41);

  /// Colors.brown[800]
  static const Color secondaryBackground = Color(0xFF4E342E);

  /// Colors.brown[200]
  static const Color constantUnit = Color(0xFFBCAAA4);
}

/// Static class that contains the theme colors
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Aladin',
  primarySwatch: swatch,
  primaryColor: LightTheme.header,
  secondaryHeaderColor: LightTheme.cardHeader,
  cardColor: LightTheme.cardBackground,
  dialogBackgroundColor: LightTheme.mainBackground,
  backgroundColor: LightTheme.secondaryBackground,
  primaryColorLight: light,
  primaryColorDark: dark,
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Aladin',
  primarySwatch: swatch,
  primaryColor: DarkTheme.header,
  secondaryHeaderColor: DarkTheme.cardHeader,
  cardColor: DarkTheme.cardBackground,
  dialogBackgroundColor: DarkTheme.mainBackground,
  backgroundColor: DarkTheme.secondaryBackground,
);

const MaterialColor swatch = Colors.brown;

/// Colors.white
const Color light = Color(0xFFFFFFFF);

/// Colors.black
const Color dark = Color(0xFF000000);
