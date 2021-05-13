import 'package:elegant_calorie_tracker/core/themes.dart';
import 'package:elegant_calorie_tracker/utils/screen.dart';
import 'package:flutter/material.dart';

/// Shadowed text wraped in a FittedBox
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
    this.text, {
    this.color = Themes.light,
    this.fontWeight = FontWeight.bold,
    this.fontSize,
    this.fontFamily = 'Aladin',
    this.shadow = true,
    this.shadowColor = Themes.dark,
    this.blurRadius = 0.5,
  });
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final double? fontSize;
  final String fontFamily;
  final bool shadow;
  final Color shadowColor;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: fontSize ?? Screen.heightUnit(context) * 3.5,
          fontFamily: fontFamily,
          shadows: [
            Shadow(
              color: shadowColor.withOpacity(shadow ? 1.0 : 0.0),
              blurRadius: blurRadius,
            ),
          ],
        ),
      ),
    );
  }
}
