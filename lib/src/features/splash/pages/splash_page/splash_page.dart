import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/splash/blocs/init_cubit/init_cubit.dart';
import 'package:studtime/src/features/splash/pages/setup_page/blocs/setup_list_cubit/setup_list_cubit.dart';
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
            context.read<SetupListCubit>().load();
            final cacheRepo = context.read<AppCacheRepo>();

            final isFirstLaunch = cacheRepo.isFirstLaunchCache.get();
            if (isFirstLaunch) {
              context.pushReplacementNamed('/intro');
              return;
            }

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
