import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('TODO: IntroPage'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /// отмечаем, что интро показано
          final cacheRepo = context.read<AppCacheRepo>();
          final isIntroShownCache = cacheRepo.isIntroShownCache;
          isIntroShownCache.set(true);

          /// переходим на страницу авторизации
          context.pushReplacementNamed('/auth');
        },
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
