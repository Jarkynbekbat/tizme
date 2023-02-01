import 'package:flutter/material.dart';
import 'package:studtime/src/features/splash/splash_navigator.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true).copyWith(
        primaryColor: const Color(0xff0071f2),
        colorScheme: const ColorScheme.light(
          primary: Color(0xff0071f2),
          secondary: Color(0xff2f2e41),
        ),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: const SplashNavigator(),
    );
  }
}
