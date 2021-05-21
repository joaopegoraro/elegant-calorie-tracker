import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    this.borderRadius,
    this.elevation = 4.0,
    this.height,
    this.width,
    this.alignment = Alignment.center,
    this.paddingSides,
    this.paddingTopBottom,
    required this.child,
  }) : super(key: key);
  final double? borderRadius;
  final double elevation;
  final double? height;
  final double? width;
  final AlignmentGeometry alignment;
  final double? paddingSides;
  final double? paddingTopBottom;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final double defaultSidePadding = Screen.widthUnit(context) * 4;
    final double defaultTopBottomPadding = Screen.heightUnit(context) * 1;
    final double defaultHeight = Screen.heightUnit(context) * 11;
    return Card(
      shadowColor: theme.primaryColorDark,
      color: theme.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: (borderRadius != null)
              ? BorderRadius.circular(borderRadius!)
              : BorderRadius.circular(Screen.heightUnit(context) * 1.5)),
      elevation: elevation,
      child: Container(
        height: height ?? defaultHeight,
        width: width ?? Screen.widthUnit(context) * 27,
        alignment: alignment,
        // Padding needs to be separated between sides and top/bottom so it stays proportional to screen size
        padding: EdgeInsets.only(
          left: paddingSides ?? defaultSidePadding,
          right: paddingSides ?? defaultSidePadding,
          top: paddingTopBottom ?? defaultTopBottomPadding,
          bottom: paddingTopBottom ?? defaultTopBottomPadding,
        ),
        child: child,
      ),
    );
  }
}
