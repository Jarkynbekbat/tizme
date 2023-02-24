import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:studtime/src/features/splash/splash_navigator.dart';
import 'package:studtime/src/shared/styles/app_themes.dart';

import 'src/shared/configs/easy_loading_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    setupEasyLoading();

    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: const SplashNavigator(),
    );
  }
}
