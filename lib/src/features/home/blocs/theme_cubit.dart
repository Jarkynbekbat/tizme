import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final isDarkMode = sharedPreferences.containsKey('isDarkMode')
        ? sharedPreferences.getBool('isDarkMode')
        : null;

    if (isDarkMode != null) {
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    }
  }

  void toggleTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    var isDarkMode = sharedPreferences.getBool('isDarkMode') ?? false;

    sharedPreferences.setBool('isDarkMode', !isDarkMode);

    emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
