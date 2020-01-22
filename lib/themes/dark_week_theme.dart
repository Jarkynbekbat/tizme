import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

AppTheme darkWeekTheme() {
  return AppTheme(
    id: "dark_week_theme",
    description: "Custom Color Scheme",
    data: ThemeData(
      hintColor: Color(0xfff2f2f2),
      appBarTheme: AppBarTheme(
        color: Color(0xFF253B4F),
        textTheme: TextTheme(
          title: TextStyle(
            color: Color(0xfff2f2f2),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 4,
        iconTheme: IconThemeData(
          color: Color(0xfff2f2f2),
        ),
      ),
      scaffoldBackgroundColor: Color(0xff1c2c3b),
      textTheme: TextTheme(body1: TextStyle(color: Color(0xfff2f2f2))),
      iconTheme: IconThemeData(
        color: Color(0xfff2f2f2),
      ),
      dividerColor: Color(0xFFE2E3E7).withOpacity(0),
      canvasColor: Color(0xff1c2c3b),
    ),
  );
}
