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
  }

  ThemeMode get themeMode => isDark ? ThemeMode.dark : ThemeMode.light;

  String get bgImgPath =>
      !isDark ? AppAssets.defaultBg : AppAssets.defaultDarkBg;

  String get splashImgPath => !isDark ? AppAssets.splash : AppAssets.darkSplash;

  String get sebhaBody =>
      !isDark ? AppAssets.sebhaBody : AppAssets.sebhaBodyDark;

  String get sebhaHead =>
      !isDark ? AppAssets.sebhaHead : AppAssets.sebhaHeadDark;

  Color get bottomNavBarColor =>
      !isDark ? AppColors.primary : AppColors.darkAccent;

  Color get bottomNavBarSelectedColor =>
      !isDark ? AppColors.black : AppColors.darkPrimary;

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
