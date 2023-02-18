import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:studtime/src/features/home/home_navigator.dart';
import 'package:studtime/src/features/splash/blocs/init_cubit/init_cubit.dart';
import 'package:studtime/src/features/splash/pages/intro_page/intro_page.dart';
import 'package:studtime/src/features/splash/pages/setup_page/setup_page.dart';
import 'package:studtime/src/features/splash/pages/splash_page/splash_page.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';
import 'package:studtime/src/shared/widgets/dialogs/confirm_close_app.dart';

import 'pages/setup_page/blocs/setup_list_cubit/setup_list_cubit.dart';

class SplashNavigator extends StatelessWidget {
  static final navKey = GlobalKey<NavigatorState>();

  const SplashNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final cacheRepo = context.read<AppCacheRepo>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InitCubit(cacheRepo)..initApp()),
        BlocProvider(create: (_) => SetupListCubit(FirebaseFirestore.instance)),
      ],
      child: WillPopScope(
        onWillPop: () async {
          /// на случай, если активен HomeNavigator
          final homeNavState = HomeNavigator.navKey.currentState;
          final canHomePop = homeNavState?.canPop() ?? false;
          if (canHomePop) {
            homeNavState!.pop();
            return false;
          }

          /// на случай, если активен корневой Navigator
          final isConfirmed = await confirmCloseApp(context);
          return isConfirmed ?? false;
        },
        child: Intro(
          buttonTextBuilder: (_) => "Готово",
          child: Navigator(
            key: SplashNavigator.navKey,
            initialRoute: '/',
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/':
                  return const SplashPage().toMatRoute();
                case '/intro':
                  return const IntroPage().toMatRoute();
                case '/setup':
                  return const SetupPage().toMatRoute();
                case '/home':
                  return const HomeNavigator().toMatRoute();
                default:
                  return null;
              }
            },
            onPopPage: (route, result) => route.didPop(result),
          ),
        ),
      ),
    );
  }
}
