import 'package:flutter/material.dart';

import '../../../core/utils/screen.dart';
import '../../../core/utils/themes.dart';
import '../../../core/widgets/custom_text_widget.dart';

class CalorieTrackerAppBar extends StatelessWidget {
  const CalorieTrackerAppBar({
    Key? key,
    required this.appTitle,
  }) : super(key: key);
  final String appTitle;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: 0,
            child: IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {},
              color: Themes.header(context),
              iconSize: Screen.heightUnit(context) * 3.5,
            ),
          ),
          Row(
            children: [
              CustomTextWidget(
                'G',
                color: Themes.header(context),
                fontWeight: FontWeight.normal,
                fontSize: Screen.heightUnit(context) * 6.5,
                fontFamily: 'Doodle',
              ),
              SizedBox(
                width: Screen.widthUnit(context) * 3,
              ),
              CustomTextWidget(
                appTitle,
                color: Themes.header(context),
                fontSize: Screen.heightUnit(context) * 3.5,
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
            color: Themes.header(context),
            iconSize: Screen.heightUnit(context) * 3.5,
          ),
        ],
      ),
    );
  }
}
