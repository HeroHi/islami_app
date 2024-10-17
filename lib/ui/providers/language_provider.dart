import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = "en";
  late SharedPreferences userPrefs;

  LanguageProvider() {
    loadLangPref();
  }

  void setLangPref() async {
    userPrefs = await SharedPreferences.getInstance();
    await userPrefs.setString("language", currentLanguage);
  }

  void loadLangPref() async {
    userPrefs = await SharedPreferences.getInstance();
    currentLanguage = userPrefs.getString("language") ?? "en";
    notifyListeners();
  }

  set newLanguage(String newLanguage) {
    currentLanguage = newLanguage;
    setLangPref();
    notifyListeners();
  }
}
