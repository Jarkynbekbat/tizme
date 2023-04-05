import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  // todo: надо если cache theme isNotNull получал из кеша в super
  ThemeCubit() : super(ThemeMode.system) {
    init();
  }
// надо получить AppCahceRepo()
  Future<void> init() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final isDarkMode = sharedPreferences.getBool('isDarkMode');

    if (isDarkMode != null) {
      emit(isDarkMode ? ThemeMode.dark : ThemeMode.light);
    }
  }

  void toggleTheme(AppCacheRepo appCacheRepo) async {
    var isDarkMode = appCacheRepo.themeCache.get();

    appCacheRepo.themeCache.setBool(!isDarkMode);

    emit(!isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }
}
