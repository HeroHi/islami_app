import 'package:flutter/material.dart';
import 'package:islami/utils/app_colors.dart';
import 'package:islami/utils/app_styles.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primary.withAlpha(57),
      primaryColorLight: AppColors.white.withOpacity(0.8),
      dividerTheme:
          const DividerThemeData(color: AppColors.primary, thickness: 0.95),
      iconTheme: const IconThemeData(color: AppColors.black),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColors.black),
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        titleTextStyle: AppStyles.appBarTextStyle,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle:
                  AppStyles.intermediate.copyWith(color: AppColors.white),
              backgroundColor: AppColors.primary)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.black,
        selectedLabelStyle: AppStyles.intermediate.copyWith(fontSize: 12),
      ),
      textTheme: TextTheme(
          headlineSmall: AppStyles.contentStyle,
          headlineMedium: AppStyles.intermediate,
          titleLarge: AppStyles.semiBold,
          titleMedium: AppStyles.intermediate,
          displaySmall:
              AppStyles.intermediate.copyWith(color: AppColors.white)));
  static ThemeData darkTheme = ThemeData(
      primaryColor: AppColors.darkPrimary,
      primaryColorDark: AppColors.darkAccent.withAlpha(80),
      primaryColorLight: AppColors.darkAccent.withOpacity(0.8),
      dividerTheme:
          const DividerThemeData(color: AppColors.darkPrimary, thickness: 0.95),
      iconTheme: const IconThemeData(color: AppColors.darkPrimary),
      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.transparent,
        centerTitle: true,
        titleTextStyle:
            AppStyles.appBarTextStyle.copyWith(color: AppColors.white),
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle:
                  AppStyles.intermediate.copyWith(color: AppColors.black),
              backgroundColor: AppColors.darkPrimary)),
      textTheme: TextTheme(
          headlineSmall:
              AppStyles.contentStyle.copyWith(color: AppColors.darkPrimary),
          headlineMedium:
              AppStyles.intermediate.copyWith(color: AppColors.white),
          titleLarge: AppStyles.semiBold.copyWith(color: AppColors.white),
          titleMedium:
              AppStyles.intermediate.copyWith(color: AppColors.darkPrimary),
          displaySmall: AppStyles.intermediate));
}
