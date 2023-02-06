import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studtime/src/features/home/blocs/settings_cubit.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/date_text.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/home_app_bar.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/home_drawer.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/timetable_list.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageController = useMemoized(() => PageController(initialPage: 0));
    final navigationIndex = useState(pageController.initialPage);

    return BlocProvider(
      create: (_) => TimetableCubit(
        FirebaseFirestore.instance,
        context.read<SettingsCubit>(),
      ),
      child: Scaffold(
        appBar: const HomeAppBar(),
        drawer: const HomeDrawer(),
        body: PageView(
          controller: pageController,
          onPageChanged: (index) {
            navigationIndex.value = index;
          },
          children: const [
            TimetableList(weekday: Weekday.monday),
            TimetableList(weekday: Weekday.tuesday),
            TimetableList(weekday: Weekday.wednesday),
            TimetableList(weekday: Weekday.thursday),
            TimetableList(weekday: Weekday.friday),
          ],
        ),
        bottomNavigationBar: TitledBottomNavigationBar(
          height: 60,
          indicatorHeight: 2.0,
          reverse: false,
          curve: Curves.fastOutSlowIn,
          onTap: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          currentIndex: navigationIndex.value,
          items: [
            TitledNavigationBarItem(
              title: const Text('ПН'),
              icon: const DateText(0),
            ),
            TitledNavigationBarItem(
              title: const Text('ВТ'),
              icon: const DateText(1),
            ),
            TitledNavigationBarItem(
              title: const Text('СР'),
              icon: const DateText(2),
            ),
            TitledNavigationBarItem(
              title: const Text('ЧТ'),
              icon: const DateText(3),
            ),
            TitledNavigationBarItem(
              title: const Text('ПТ'),
              icon: const DateText(4),
            ),
          ],
          activeColor: AppColors.primaryColor,
          inactiveColor: Colors.blueGrey,
        ),
      ),
    );
  }
}
