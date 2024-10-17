import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  late SharedPreferences userPrefs;
  bool isDark = false;

  ThemeProvider() {
    loadThemePref();
  }

  void setThemePref(bool isDark) async {
    userPrefs = await SharedPreferences.getInstance();
    await userPrefs.setBool("isDark", isDark);
  }

  void loadThemePref() async {
    userPrefs = await SharedPreferences.getInstance();
    isDark = userPrefs.getBool("isDark") ?? false;
    notifyListeners();
  }

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  String get bgImgPath =>
      isDark ? AppAssets.defaultDarkBg : AppAssets.defaultBg;

  String get splashImgPath => isDark ? AppAssets.darkSplash : AppAssets.splash;

  String get sebhaBody =>
      isDark ? AppAssets.sebhaBodyDark : AppAssets.sebhaBody;

  String get sebhaHead =>
      isDark ? AppAssets.sebhaHeadDark : AppAssets.sebhaHead;

  Color get bottomNavBarColor =>
      isDark ? AppColors.darkAccent : AppColors.primary;

  Color get bottomNavBarSelectedColor =>
      isDark ? AppColors.darkPrimary : AppColors.black;

  void toggleTheme() {
    if (isDark) {
      isDark = false;
    } else {
      isDark = true;
    }
    setThemePref(isDark);
    notifyListeners();
  }
}
