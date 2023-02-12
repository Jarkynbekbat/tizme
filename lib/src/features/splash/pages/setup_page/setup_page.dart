import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studtime/src/features/splash/pages/setup_page/blocs/setup_cubit/setup_cubit.dart';
import 'package:studtime/src/shared/assets/assets.gen.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/settings/user_settings.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';
import 'package:studtime/src/shared/widgets/app_error_text.dart';
import 'package:studtime/src/shared/widgets/app_loading.dart';
import 'package:studtime/src/shared/widgets/app_search_delegate.dart';

class SetupPage extends StatelessWidget {
  const SetupPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cacheRepo = context.read<AppCacheRepo>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(
          AppPadding.defaultPaddingDouble,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Assets.setup.setup.svg(),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final setupCubit = context.read<SetupCubit>();

                    setupCubit.state.maybeMap(
                      loaded: (loaded) async {
                        final selected = await showSearch<SuggestionItem?>(
                          context: context,
                          delegate: AppSearchDelegate(loaded.items),
                        );
                        if (selected == null) return;

                        await cacheRepo.settingsCache.set(
                          UserSettings(
                            id: selected.id,
                            name: selected.name,
                            type: selected is Teacher
                                ? UserSettingsType.teacher
                                : UserSettingsType.student,
                          ),
                        );

                        // ignore: use_build_context_synchronously
                        context.pushReplacementNamed('/home');
                      },
                      orElse: () {},
                    );
                  },
                  icon: const Icon(Icons.search),
                  label: BlocBuilder<SetupCubit, SetupState>(
                    builder: (context, state) {
                      return state.map(
                        loading: (_) => Theme(
                          data: Theme.of(context).copyWith(
                            progressIndicatorTheme:
                                const ProgressIndicatorThemeData(
                              color: Colors.white,
                            ),
                          ),
                          child: const SizedBox.square(
                            dimension: 20,
                            child: AppLoading(),
                          ),
                        ),
                        error: (error) => AppErrorText(
                          message: error.message,
                        ),
                        loaded: (loaded) {
                          return const Text(
                            "Выберите группу или преподавателя",
                            textAlign: TextAlign.center,
                          );
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
