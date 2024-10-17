import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/ui/providers/language_provider.dart';
import 'package:islami/ui/providers/theme_provider.dart';
import 'package:islami/ui/screens/hadeth/hadeth.dart';
import 'package:islami/ui/screens/quran/Quran.dart';
import 'package:islami/utils/app_themes.dart';
import 'package:provider/provider.dart';

import 'ui/screens/home/home.dart';
import 'ui/screens/splash/splash.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: ChangeNotifierProvider(
        create: (context) => LanguageProvider(), child: const MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeProvider.themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(languageProvider.currentLanguage),
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
        Quran.routeName: (_) => Quran(),
        Hadeth.routeName: (_) => Hadeth(),
      },
      initialRoute: Splash.routeName,
    );
  }
}
