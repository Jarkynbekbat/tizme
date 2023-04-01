import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/flutter_intro.dart';

import '../../../../../shared/data/models/setup/setup.dart';
import '../../../../../shared/data/models/suggestion_item.dart';
import '../../../../../shared/data/models/teacher/teacher.dart';
import '../../../../../shared/data/repos/app_cache_repo.dart';
import '../../../../../shared/widgets/app_search_delegate.dart';
import '../../../../splash/pages/setup_page/blocs/setup_list_cubit/setup_list_cubit.dart';
import '../../../blocs/setup_cubit.dart';

class HomeCurrentTarget extends StatelessWidget {
  const HomeCurrentTarget({super.key});

  @override
  Widget build(BuildContext context) {
    final setupListCubit = context.read<SetupListCubit>();
    final setupCubit = context.read<SetupCubit>();

    return BlocBuilder<SetupCubit, Setup>(
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
            final items = setupListCubit.state.maybeMap<List<SuggestionItem>>(
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
                type:
                    selected is Teacher ? SetupType.teacher : SetupType.student,
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
    );
  }
}
