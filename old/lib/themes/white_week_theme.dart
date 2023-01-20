import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

AppTheme whiteWeekTheme() {
  return AppTheme(
    id: "white_week_theme",
    description: "Custom Color Scheme",
    data: ThemeData(
      appBarTheme: AppBarTheme(
        color: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
            color: Color(0xFF4C5862),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 4,
        iconTheme: IconThemeData(
          color: Color(0xFF4C5862),
        ),
      ),
      scaffoldBackgroundColor: Color(0xFFF4F5F9),
      textTheme: TextTheme(body1: TextStyle(color: Color(0xFF4C5862))),
      iconTheme: IconThemeData(
        color: Color(0xFF4C5862),
      ),
      dividerColor: Color(0xFFE2E3E7),
      canvasColor: Color(0xFFF4F5F9),
    ),
  );
}
