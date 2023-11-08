import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studtime/src/features/home/blocs/setup_cubit.dart';
import 'package:studtime/src/features/home/blocs/timetable_cubit/timetable_cubit.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/date_text.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/home_app_bar.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/home_drawer.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/timetable_list.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TimetablePage extends HookWidget {
  const TimetablePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageController = useMemoized(
      () =>
          PageController(initialPage: (DateTime.now().weekday - 1).clamp(0, 5)),
    );
    final navigationIndex = useState(pageController.initialPage);

    return BlocProvider(
      create: (_) => TimetableCubit(
        Supabase.instance.client,
        context.read<SetupCubit>(),
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
            TimetableList(weekday: Weekday.saturday),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          currentIndex: navigationIndex.value,
          items: [
            BottomNavigationBarItem(
              icon: const Text(
                'ПН',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              activeIcon: const SizedBox.shrink(),
              label: DateText.getDateByWeekday(1),
            ),
            BottomNavigationBarItem(
              icon: const Text(
                'ВТ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              activeIcon: const SizedBox.shrink(),
              label: DateText.getDateByWeekday(2),
            ),
            BottomNavigationBarItem(
              icon: const Text(
                'СР',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              label: DateText.getDateByWeekday(3),
              activeIcon: const SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: const Text(
                'ЧТ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              label: DateText.getDateByWeekday(4),
              activeIcon: const SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: const Text(
                'ПТ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              label: DateText.getDateByWeekday(5),
              activeIcon: const SizedBox.shrink(),
            ),
            BottomNavigationBarItem(
              icon: const Text(
                'СБ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w300),
              ),
              label: DateText.getDateByWeekday(6),
              activeIcon: const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
