import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
    bool _isDark = EasyDynamicTheme.of(context).themeMode == ThemeMode.dark;
    final theme = Theme.of(context);
    return SafeArea(
      child: SizedBox(
        width: Screen.widthUnit(context) * 45,
        child: Drawer(
          child: Container(
            color: theme.dialogBackgroundColor,
            child: ListView(
              children: [
                SizedBox(
                  height: Screen.heightUnit(context) * 10,
                  child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    child: Text(
                      'Settings',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: Screen.heightUnit(context) * 4.5,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.brightness_3_rounded,
                    size: Screen.heightUnit(context) * 3.5,
                  ),
                  trailing: Switch(
                    value: _isDark,
                    onChanged: (bool value) {
                      setState(() {
                        _isDark = value;
                        EasyDynamicTheme.of(context).changeTheme(dark: _isDark);
                      });
                    },
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.bug_report,
                    size: Screen.heightUnit(context) * 3.5,
                  ),
                  title: CustomTextWidget(
                    'Report bugs',
                    color: theme.primaryColor,
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.format_align_left,
                    size: Screen.heightUnit(context) * 3.5,
                  ),
                  title: CustomTextWidget(
                    'About',
                    color: theme.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
