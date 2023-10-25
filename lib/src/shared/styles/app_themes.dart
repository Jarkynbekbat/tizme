import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.grey[100],
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black.withOpacity(0.88),
        fontSize: 18.0,
      ),
    ),
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey[300],
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 17,
        height: 0.95,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w300,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: Colors.grey[900],
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.white.withOpacity(0.88),
        fontSize: 18.0,
      ),
    ),
    primaryColor: AppColors.primaryColor,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[850],
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: Colors.grey[500],
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 17,
        height: 0.95,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w300,
        color: Colors.grey[500],
      ),
    ),
  );
}
