import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lotterynumbergen/providers/language_provider.dart';
import 'package:lotterynumbergen/providers/theme_provider.dart';
import 'package:lotterynumbergen/screens/settings_screen.dart';
import 'package:lotterynumbergen/screens/start_screen.dart';
import 'package:lotterynumbergen/utils/app_localization.dart';
import 'package:lotterynumbergen/utils/app_themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  AppLanguageProvider appLanguageProvider = AppLanguageProvider();
  await appLanguageProvider.fetchLocale();

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]).then((_) {
    SharedPreferences.getInstance().then((preferences) {
      var darkModeOn = preferences.getBool('darkMode') ?? true;

      runApp(
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(darkModeOn ? darkMode : lightMode),
          child: MyApp(
            appLanguageProvider: appLanguageProvider,
          ),
        )
      );
    });
  });
}

class MyApp extends StatelessWidget {
  final AppLanguageProvider appLanguageProvider;

  MyApp({this.appLanguageProvider});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return ChangeNotifierProvider<AppLanguageProvider>(
      create: (_) => appLanguageProvider,
      child: Consumer<AppLanguageProvider>(
        builder: (context, model, child) {
          return MaterialApp(
            locale: model.appLocale,
            supportedLocales: [
              Locale('en', 'EN'),
              Locale('de', 'DE'),
              Locale('es', 'ES'),
              Locale('nl', 'NL'),
              Locale('it', 'IT'),
            ],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            title: 'Lottery Number Generator',
            theme: themeProvider.getTheme(),
            routes: {
              StartScreen.id: (context) => StartScreen(),
              SettingsScreen.id: (context) => SettingsScreen(),
            },
            initialRoute: StartScreen.id,
          );
        },
      ),
    );
  }
}

