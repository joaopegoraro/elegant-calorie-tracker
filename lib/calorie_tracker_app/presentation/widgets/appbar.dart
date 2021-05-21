import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';
import '../../../core/widgets/custom_text_widget.dart';

class CalorieTrackerAppBar extends StatelessWidget {
  const CalorieTrackerAppBar({
    Key? key,
    required this.appTitle,
  }) : super(key: key);
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: 0,
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
              color: theme.primaryColor,
              iconSize: Screen.heightUnit(context) * 3.5,
            ),
          ),
          Row(
            children: [
              CustomTextWidget(
                'G',
                color: theme.primaryColor,
                fontWeight: FontWeight.normal,
                fontSize: Screen.heightUnit(context) * 6.5,
                fontFamily: 'Doodle',
              ),
              SizedBox(
                width: Screen.widthUnit(context) * 3,
              ),
              CustomTextWidget(
                appTitle,
                color: theme.primaryColor,
                fontSize: Screen.heightUnit(context) * 3.5,
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            color: theme.primaryColor,
            iconSize: Screen.heightUnit(context) * 3.5,
          ),
        ],
      ),
    );
  }
}
