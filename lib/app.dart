import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:studtime/src/features/home/blocs/theme_cubit.dart';
import 'package:studtime/src/features/splash/splash_navigator.dart';
import 'package:studtime/src/shared/styles/app_themes.dart';

import 'src/shared/configs/easy_loading_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    setupEasyLoading();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()..init()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: themeMode,
            debugShowCheckedModeBanner: false,
            builder: EasyLoading.init(),
            home: const SplashNavigator(),
          );
        },
      ),
    );
  }
}
