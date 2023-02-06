import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/settings_cubit.dart';
import 'package:studtime/src/features/home/pages/home_page/home_page.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsCache = context.read<AppCacheRepo>().settingsCache;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SettingsCubit(settingsCache)),
      ],
      child: Builder(
        builder: (context) {
          return Navigator(
            initialRoute: '/',
            onGenerateRoute: (settings) {
              switch (settings.name) {
                case '/':
                  return const HomePage().toMatRoute();
                default:
                  return null;
              }
            },
            onPopPage: (route, result) {
              if (!route.didPop(result)) return false;
              return true;
            },
          );
        },
      ),
    );
  }
}
