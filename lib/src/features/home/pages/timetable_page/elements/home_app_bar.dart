import 'package:flutter/material.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/scan_q_r.dart';

import 'elements/home_current_target.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
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
<<<<<<< HEAD
        actions: const [ScanQR()],
        title: const HomeCurrentTarget(),
=======
        actions: const [
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
>>>>>>> 3194f129c976f4a44015ffc79500b622085ffc19
      ),
    );
  }
}
