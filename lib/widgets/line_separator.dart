import 'package:flutter/material.dart';
import 'package:lotterynumbergen/providers/theme_provider.dart';
import 'package:lotterynumbergen/utils/app_colors.dart';
import 'package:lotterynumbergen/utils/app_themes.dart';

class LineSeparator extends StatelessWidget {
  const LineSeparator({
    Key? key,
    required this.themeProvider,
  }) : super(key: key);

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 15.0),
      child: Container(
        height: 1,
        width: double.infinity,
        color: themeProvider.getTheme() == darkMode
            ? kColorOne
            : kColorThree,
      ),
    );
  }
}