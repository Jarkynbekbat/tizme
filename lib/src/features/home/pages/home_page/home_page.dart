import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/date_text.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/home_app_bar.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/home_drawer.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/timetable_list.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageController = useMemoized(() => PageController(initialPage: 0));
    final navigationIndex = useState(pageController.initialPage);

    return Scaffold(
      appBar: const HomeAppBar(),
      drawer: const HomeDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          navigationIndex.value = index;
        },
        children: const [
          TimetableList(weekdayIndex: 0),
          TimetableList(weekdayIndex: 1),
          TimetableList(weekdayIndex: 2),
          TimetableList(weekdayIndex: 3),
          TimetableList(weekdayIndex: 4),
        ],
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        height: 60,
        indicatorHeight: 2.0,
        reverse: false,
        curve: Curves.fastOutSlowIn,
        onTap: pageController.jumpToPage,
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
    );
  }
}
