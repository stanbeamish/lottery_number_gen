import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale _appLocale = Locale('en');

  Locale get appLocale => _appLocale ?? Locale('en');

  fetchLocale() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getString('languageCode') == null) {
      _appLocale = Locale('en');
      return Null;
    }
    _appLocale = Locale(prefs.getString('languageCode'));
    return Null;
  }

  void changeLanguage(Locale type) async {
    var prefs = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }

    switch (type.languageCode) {
      case 'de':
        {
          _appLocale = Locale('de');
          await prefs.setString('languageCode', 'de');
          await prefs.setString('countryCode', 'DE');
        }
        break;
      case 'en':
        {
          _appLocale = Locale('en');
          await prefs.setString('languageCode', 'en');
          await prefs.setString('countryCode', 'US');
        }
        break;
      case 'es':
        {
          _appLocale = Locale('es');
          await prefs.setString('languageCode', 'es');
          await prefs.setString('countryCode', 'ES');
        }
        break;
      case 'nl':
        {
          _appLocale = Locale('nl');
          await prefs.setString('languageCode', 'nl');
          await prefs.setString('countryCode', 'NL');
        }
        break;
      case 'it':
        {
          _appLocale = Locale('it');
          await prefs.setString('languageCode', 'it');
          await prefs.setString('countryCode', 'IT');
        }
        break;

    }

    notifyListeners();
  }
}