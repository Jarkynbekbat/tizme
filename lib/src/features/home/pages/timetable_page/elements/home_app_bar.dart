import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:studtime/src/features/home/blocs/setup_cubit.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/barcode_widget.dart';
import 'package:studtime/src/features/splash/pages/setup_page/blocs/setup_list_cubit/setup_list_cubit.dart';
import 'package:studtime/src/shared/data/models/setup/setup.dart';
import 'package:studtime/src/shared/data/models/suggestion_item.dart';
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
    final setupListCubit = context.read<SetupListCubit>();
    final setupCubit = context.read<SetupCubit>();

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
        actions: [
          BarcodeWidget(),
        ],
        title: BlocBuilder<SetupCubit, Setup>(
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
                final items =
                    setupListCubit.state.maybeMap<List<SuggestionItem>>(
                  loaded: (loaded) => loaded.items,
                  orElse: () => [],
                );

                final selected = await showSearch(
                  context: context,
                  delegate: AppSearchDelegate(items),
                );

                if (selected == null) return;

                setupCubit.setSettings(
                  Setup(
                    id: selected.id,
                    name: selected.name,
                    type: selected is Teacher
                        ? SetupType.teacher
                        : SetupType.student,
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
