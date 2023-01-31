import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/auth/auth_navigator.dart';
import 'package:studtime/src/features/splash/blocs/init_cubit/init_cubit.dart';
import 'package:studtime/src/features/splash/pages/intro_page/intro_page.dart';
import 'package:studtime/src/features/splash/pages/splash_page/splash_page.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';

class SplashNavigator extends StatelessWidget {
  const SplashNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final cacheRepo = context.read<AppCacheRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InitCubit(cacheRepo)..initApp()),
      ],
      child: Navigator(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return const SplashPage().toMatRoute();
            case '/intro':
              return const IntroPage().toMatRoute();
            case '/auth':
              return const AuthNavigator().toMatRoute();
            default:
              return null;
          }
        },
        onPopPage: (route, result) {
          if (!route.didPop(result)) return false;
          return true;
        },
      ),
    );
  }
}
