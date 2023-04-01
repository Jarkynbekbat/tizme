import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/home/blocs/setup_cubit.dart';
import 'package:studtime/src/features/home/pages/about_page/about_page.dart';
import 'package:studtime/src/features/home/pages/timetable_page/timetable_page.dart';
import 'package:studtime/src/features/home/pages/cache_chat_page/cache_chat_page.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_widget.dart';

class HomeNavigator extends StatefulWidget {
  static final navKey = GlobalKey<NavigatorState>();

  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  @override
  Widget build(BuildContext context) {
    final settingsCache = context.read<AppCacheRepo>().settingsCache;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SetupCubit(settingsCache)),
      ],
      child: Navigator(
        initialRoute: '/',
        key: HomeNavigator.navKey,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return const TimetablePage().toMatRoute();

            case '/schedule':
              {
                final schedule = settings.arguments as Schedule;
                return CacheChatPage(schedule: schedule).toMatRoute();
              }

            case '/about':
              return const AboutPage().toMatRoute();

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
