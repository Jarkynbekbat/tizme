import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:studtime/src/features/home/blocs/settings_cubit.dart';
import 'package:studtime/src/features/splash/pages/setup_page/blocs/setup_cubit/setup_cubit.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
import 'package:studtime/src/shared/data/models/settings/user_settings.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';
import 'package:studtime/src/shared/data/repos/app_cache_repo.dart';
import 'package:studtime/src/shared/widgets/app_search_delegate.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    final setupCubit = context.read<SetupCubit>();
    final settingsCubit = context.read<SettingsCubit>();

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: AppBar(
        centerTitle: true,
        title: BlocBuilder<SettingsCubit, UserSettings>(
          key: key,
          builder: (context, state) {
            final appCacheRepo = context.read<AppCacheRepo>();
            final isIntroShown = appCacheRepo.isIntroShownCache.get();

            if (!isIntroShown) {
              Future.delayed(const Duration(milliseconds: 500), () {
                Intro.of(context).start();
                appCacheRepo.isIntroShownCache.set(true);
              });
            }

            return CupertinoButton(
              onPressed: () async {
                final items = setupCubit.state.maybeMap<List<SuggestionItem>>(
                  loaded: (loaded) => loaded.items,
                  orElse: () => [],
                );

                final selected = await showSearch(
                  context: context,
                  delegate: AppSearchDelegate(items),
                );

                if (selected == null) return;

                settingsCubit.setSettings(
                  UserSettings(
                    id: selected.id,
                    name: selected.name,
                    type: selected is Teacher
                        ? UserSettingsType.teacher
                        : UserSettingsType.student,
                  ),
                );
              },
              child: IntroStepBuilder(
                order: 1,
                text: "Нажмите сюда, чтобы выбрать\n группу или преподавателя",
                builder: (context, key) {
                  return Text(
                    state.name,
                    key: key,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
