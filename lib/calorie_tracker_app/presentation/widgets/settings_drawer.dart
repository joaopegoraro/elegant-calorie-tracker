import 'package:about/about.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:elegant_calorie_tracker/core/utils/screen.dart';
import 'package:elegant_calorie_tracker/core/widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsDrawer extends StatefulWidget {
  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  @override
  Widget build(BuildContext context) {
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
                      textScaleFactor: 1,
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
                  trailing: Transform.scale(
                    scale: Screen.height(context) >= 900 ? 1.5 : 1,
                    child: Switch(
                      value: _isDarkMode(theme),
                      onChanged: (bool value) {
                        setState(() {
                          EasyDynamicTheme.of(context).changeTheme(dark: value);
                        });
                      },
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(
                    Icons.bug_report,
                    size: Screen.heightUnit(context) * 3.5,
                  ),
                  onTap: () {
                    launch(
                        'https://github.com/hahmraro/elegant-calorie-tracker/issues');
                  },
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
                  onTap: () => _buildShowAboutPage(context, theme),
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

  bool _isDarkMode(ThemeData theme) => theme.brightness == Brightness.dark;

  Future<void> _buildShowAboutPage(BuildContext context, ThemeData theme) {
    return showAboutPage(
      context: context,
      values: {
        'version': '1.0.0',
      },
      title: CustomTextWidget(
        'About',
        color: theme.hoverColor,
      ),
      applicationDescription: CustomTextWidget(
        'Minimalist calorie tracker with a fun and different design',
        color: theme.primaryColor,
      ),
      applicationIcon: CustomTextWidget(
        'G',
        align: TextAlign.center,
        color: theme.primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: Screen.heightUnit(context) * 13.5,
        fontFamily: 'Doodle',
      ),
      children: <Widget>[
        LicensesPageListTile(
          title: Text(
            "Licenses",
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: Screen.heightUnit(context) * 3,
            ),
          ),
          icon: const Icon(Icons.favorite),
        ),
      ],
    );
  }
}
