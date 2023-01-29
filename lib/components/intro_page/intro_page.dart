import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:studtime/components/intro_page/elements/intro_body.dart';
import 'package:studtime/data/repos/app_cache_repo.dart';

class IntroPage extends HookWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        final cacheRepo = context.read<AppCacheRepo>();
        cacheRepo.isFirstTimeCache.set(true);
        return null;
      },
      const [],
    );

    return Scaffold(
      body: const IntroBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/auth');
        },
        child: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
