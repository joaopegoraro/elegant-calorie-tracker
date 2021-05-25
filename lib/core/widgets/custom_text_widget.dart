import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:flutter/material.dart';

/// Shadowed text wraped in a FittedBox
class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget(
    this.text, {
    this.overflow,
    this.align,
    this.color,
    this.fontWeight = FontWeight.bold,
    this.fontSize,
    this.fontFamily = 'Aladin',
    this.shadow = true,
    this.shadowColor,
    this.blurRadius = 0.5,
  });
  final String text;
  final TextOverflow? overflow;
  final TextAlign? align;
  final Color? color;
  final FontWeight fontWeight;
  final double? fontSize;
  final String fontFamily;
  final bool shadow;
  final Color? shadowColor;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text,
      textScaleFactor: 1.0,
      overflow: overflow,
      textAlign: align,
      style: TextStyle(
        color: color ?? theme.primaryColorLight,
        fontWeight: fontWeight,
        fontSize: fontSize ?? Screen.heightUnit(context) * 3.5,
        fontFamily: fontFamily,
        shadows: [
          Shadow(
            color: (shadowColor ?? theme.primaryColorDark)
                .withOpacity(shadow ? 1.0 : 0.0),
            blurRadius: blurRadius,
          ),
        ],
      ),
    );
  }
}
