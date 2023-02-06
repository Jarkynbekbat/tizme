import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/splash/blocs/init_cubit/init_cubit.dart';
import 'package:studtime/src/features/splash/pages/setup_page/blocs/setup_cubit/setup_cubit.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitCubit, InitState>(
      listener: (context, state) {
        state.maybeMap(
          loaded: (_) async {
            final cacheRepo = context.read<AppCacheRepo>();
            final isIntroShown = cacheRepo.isIntroShownCache.get();

            if (!isIntroShown) {
              context.pushReplacementNamed('/intro');
              return;
            }

            context.read<SetupCubit>().load();
            final settings = cacheRepo.settingsCache.get();
            if (settings == null) {
              context.pushReplacementNamed('/setup');
              return;
            }

            context.pushReplacementNamed('/home');
          },
          orElse: () {},
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
