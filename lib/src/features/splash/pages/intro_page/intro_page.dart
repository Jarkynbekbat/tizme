import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:studtime/src/shared/assets/assets.gen.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  Future<void> _onDone(BuildContext context) async {
    /// отмечаем, что интро показано
    final cacheRepo = context.read<AppCacheRepo>();
    final isFirstLaunchCache = cacheRepo.isFirstLaunchCache;
    isFirstLaunchCache.set(false);

    /// переходим на страницу настройки
    context.pushReplacementNamed('/setup');
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      showSkipButton: true,
      showNextButton: false,
      skip: const Text("Пропустить"),
      done: const Text("Начать"),
      onSkip: () => _onDone(context),
      onDone: () => _onDone(context),
      bodyPadding: const EdgeInsets.only(top: 40.0),
      isTopSafeArea: true,
      pages: [
        PageViewModel(
          title: "Расписание занятий",
          body: "Актуальное расписание занятий, всегда под рукой",
          image: Assets.intro.intro0.svg(),
          decoration: const PageDecoration(
            titlePadding: EdgeInsets.only(top: 16.0, bottom: 8.0),
            bodyPadding: EdgeInsets.symmetric(horizontal: 36.0),
          ),
        ),
        PageViewModel(
          title: "Учебные материалы",
          body: "Загружайте учебные материалы и читайте их в удобном формате",
          image: Assets.intro.intro1.svg(),
          decoration: const PageDecoration(
            titlePadding: EdgeInsets.only(top: 16.0, bottom: 8.0),
            bodyPadding: EdgeInsets.symmetric(horizontal: 36.0),
          ),
        ),
        PageViewModel(
          title: "График сессий и модулей",
          body: "Всегда в курсе, когда начнутся сессии и модули",
          image: Assets.intro.intro2.svg(),
          decoration: const PageDecoration(
            titlePadding: EdgeInsets.only(top: 16.0, bottom: 8.0),
            bodyPadding: EdgeInsets.symmetric(horizontal: 36.0),
          ),
        ),
      ],
    );
  }
}
