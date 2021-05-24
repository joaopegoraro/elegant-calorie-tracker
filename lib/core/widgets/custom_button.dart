import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:flutter/material.dart';

/// 20x30 Button which follows the app theme
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width ?? Screen.widthUnit(context) * 20,
      height: width ?? Screen.widthUnit(context) * 12,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: theme.buttonColor,
        ),
        child: child,
      ),
    );
  }
}
