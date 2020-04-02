import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lotterynumbergen/providers/language_provider.dart';
import 'package:lotterynumbergen/providers/theme_provider.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_text_utils.dart';
import 'package:lotterynumbergen/utils/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  static String id = 'settingsscreen';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _darkTheme = true;

  void onLanguageChanged(int index, AppLanguageProvider notifier) {
    switch(index) {
      case 0:
      // GERMAN
        notifier.changeLanguage(Locale('de'));
        break;
      case 1:
      // ENGLISH
        notifier.changeLanguage(Locale('en'));
        break;
      case 2:
      // SPANISH
        notifier.changeLanguage(Locale('es'));
        break;
      case 3:
      // DUTCH
        notifier.changeLanguage(Locale('nl'));
        break;
      case 4:
      // ITALIAN
        notifier.changeLanguage(Locale('it'));
        break;
    }
  }

  void onThemeChanged(bool value, ThemeProvider themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkMode)
        : themeNotifier.setTheme(lightMode);
    var preferences = await SharedPreferences.getInstance();
    preferences.setBool('darkMode', value);
  }

  List<Widget> _buildLanguagePickerElements(ThemeProvider themeProvider) {
    List<Widget> allSupportedLanguages = [];

    AppTextUtils.getSupportedLanguages().forEach((language) {
      allSupportedLanguages.add(Text(
        AppTextUtils.getUIText(context, language),
        style: TextStyle(
          fontSize: 18.0,
          color: (themeProvider.getTheme() == darkMode
              ? Colors.white70
              : Colors.black),
        ),
      ),);
    });

    return allSupportedLanguages;
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final appLanguageProvider = Provider.of<AppLanguageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppTextUtils.getUIText(context, 'settings_screen_title'),),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(AppTextUtils.getUIText(context, 'settings_screen_theme')),
            contentPadding: const EdgeInsets.only(left: 16.0),
            trailing: Transform.scale(
              scale: 0.4,
              child: DayNightSwitch(
                sunColor: kColorOne,
                dayColor: kColorFour,
                nightColor: kColorOne,
                moonColor: kColorFour,
                value: themeProvider.getTheme() == darkMode ? true : false,
                onChanged: (value) {
                  setState(() {
                    _darkTheme = value;
                  });
                  onThemeChanged(value, themeProvider);
                },
              ),
            ),
          ),
          ListTile(
            title: Text(AppTextUtils.getUIText(context, 'settings_screen_language')),
          ),
          Container(
            height: 110,
            child: CupertinoPicker(
              useMagnifier: true,
              diameterRatio: 0.8,
              magnification: 1.2,
              itemExtent: 30.0,
              backgroundColor: (themeProvider.getTheme() == darkMode
                  ? Colors.black38
                  : Colors.white70),
              looping: true,
              onSelectedItemChanged: (int index) {
                onLanguageChanged(index, appLanguageProvider);
              },
              children: _buildLanguagePickerElements(themeProvider),
            ),
          ),
        ],
      ),
    );
  }
}
