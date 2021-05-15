import 'package:flutter/material.dart';

/// Static class that contains the screen dimensions and custom width and
/// height units that are proportional to the screen
class Screen {
  static MediaQueryData data(BuildContext context) => MediaQuery.of(context);
  static Size size(BuildContext context) => data(context).size;
  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;
  static double width(BuildContext context) => size(context).width;
  static double height(BuildContext context) =>
      size(context).height - data(context).padding.top;

  // Custom units, one unit equals 1% of the screen height or width
  static double widthUnit(BuildContext context) =>
      isLandscape(context) ? width(context) / 100 : width(context) / 100;

  static double heightUnit(BuildContext context) =>
      // When turning the phone to the landscape orientation, the height goes from
      // being the largest dimension to the smallest, so instead of the height unit
      // being 1/100 (1%) of the screen, when in landscape mode the height unit is
      // actually 1/45 (2.2%), to make up for it. Feel free to change it to the
      // normal 1/100 to see the difference
      isLandscape(context) ? height(context) / 45 : height(context) / 100;
}
