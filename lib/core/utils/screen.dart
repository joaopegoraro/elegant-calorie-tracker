import 'package:flutter/material.dart';

/// Static class that contains the screen dimensions and custom width and
/// height units that are proportional to the screen
class Screen {
  static MediaQueryData data(BuildContext context) => MediaQuery.of(context);
  static Size size(BuildContext context) => data(context).size;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) =>
      size(context).height - data(context).padding.top;

  // Custom units, one unit equals 1% of the screen height or width
  static double widthUnit(BuildContext context) => width(context) / 100;

  static double heightUnit(BuildContext context) => height(context) / 100;
}
