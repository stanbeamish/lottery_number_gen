import 'package:flutter/material.dart';
import 'package:lotterynumbergen/utils/app_localization.dart';

class AppTextUtils {
  // Return the text from the localized json file
  static String getUIText(BuildContext context, String key) {
    return AppLocalizations.of(context).translate(key);
  }

  // A list of all supported languages. You must not change the order
  static List<String> getSupportedLanguages() {
    return [
      'language_german',
      'language_english',
      'language_spanish',
      'language_dutch',
      'language_italian',
    ];
  }
}