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
  );
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
}
