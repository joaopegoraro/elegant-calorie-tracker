import 'package:elegant_calorie_tracker/theme_data/themes.dart';
import 'package:elegant_calorie_tracker/utils/screen.dart';
import 'package:flutter/material.dart';

/// 20x30 Button which follows the app theme
class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Screen.widthUnit(context) * 20,
      height: Screen.widthUnit(context) * 10,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(primary: Themes.button(context)),
        child: child,
      ),
    );
  }
}
