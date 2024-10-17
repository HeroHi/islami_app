import 'package:flutter/material.dart';
import 'package:islami/ui/providers/language_provider.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';
import 'package:islami/utils/extensions/extensions.dart';
import 'package:islami/utils/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../providers/theme_provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool isDark = false;
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;
  late ThemeData theme;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
    theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            context.localization.language,
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          buildDropDownButton(),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.localization.darkTheme,
                style: theme.textTheme.titleLarge,
              ),
              buildThemeSwitch(),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildDropDownButton() => DropdownButton(
      isExpanded: true,
      value: languageProvider.currentLanguage,
      dropdownColor: theme.primaryColorDark.withOpacity(1.0),
      items: [
        DropdownMenuItem<String>(
            value: "en",
            child: Text(
              "English",
              style: theme.textTheme.headlineMedium,
            )),
        DropdownMenuItem<String>(
            value: "ar",
            child: Text(
              "العربية",
              style: theme.textTheme.headlineMedium,
            ))
      ],
      onChanged: (newValue) {
        languageProvider.newLanguage =
            newValue ?? (languageProvider.currentLanguage);
        setState(() {});
      });

  buildThemeSwitch() => Switch(
      value: themeProvider.isDark,
      inactiveTrackColor: AppColors.transparent,
      activeColor: theme.primaryColor,
      onChanged: (newValue) {
        themeProvider.toggleTheme();
      });
}
