import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:studtime/data/repos/app_cache_repo.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final cacheRepo = context.read<AppCacheRepo>();
      final futures = <Future>[];

      /// инициализируем все репозитории
      futures.add(cacheRepo.init());

      Future.wait(futures).then((_) async {
        /// проверяем, первый ли раз открывается приложение
        final isFirstTime = cacheRepo.isFirstTimeCache.get();

        /// если первый раз, то переходим на страницу с интро
        final route = isFirstTime ? '/intro' : '/auth';

        context.pushReplacement(route);
      });

      return null;
    }, const []);

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
