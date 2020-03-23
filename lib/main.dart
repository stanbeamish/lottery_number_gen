import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lotterynumbergen/models/lottery_field.dart';
import 'package:lotterynumbergen/models/lottery_number.dart';
import 'package:lotterynumbergen/models/lottery_system.dart';
import 'package:lotterynumbergen/providers/generation_data_provider.dart';
import 'package:lotterynumbergen/providers/language_provider.dart';
import 'package:lotterynumbergen/providers/theme_provider.dart';
import 'package:lotterynumbergen/screens/gen_result_screen.dart';
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

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguageProvider>(create: (_) => appLanguageProvider),
        ChangeNotifierProvider<GenerationDataProvider>(create: (_) => GenerationDataProvider(
          GenerationData(
            selectedSystem: supportedLotterySystems[0], // initialize with defaults
            selectedLotteryField: supportedLotteryFields[0],
            selectedLotteryNumber: supportedLotteryNumbers[0],
          ),
        ),),
      ],
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
              GenResultScreen.id: (context) => GenResultScreen(),
            },
            initialRoute: StartScreen.id,
          );
        },
      ),
    );
  }
}

