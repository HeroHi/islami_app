import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? userPrefs;

  void initPref() async {
    userPrefs = await SharedPreferences.getInstance();
  }

  void setThemePref(bool isDark) async {
    initPref();
    await userPrefs!.setBool("isDark", isDark);
  }
}
