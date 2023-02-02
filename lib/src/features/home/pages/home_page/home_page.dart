import 'package:calendar_view/calendar_view.dart';
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

    final now = DateTime.now();

    return Scaffold(
      appBar: const HomeAppBar(),
      drawer: const HomeDrawer(),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          navigationIndex.value = index;
        },
        children: [
          DayView(
            controller: EventController<String>()
              ..addAll([
                CalendarEventData(
                  date: DateTime.now(),
                  event: "Введение в программирование",
                  title: "Project meeting",
                  description: "Today is project meeting.",
                  startTime: DateTime(now.year, now.month, now.day, 13, 00),
                  endTime: DateTime(now.year, now.month, now.day, 14, 20),
                ),
              ]),
            dayTitleBuilder: (date) {
              return Container();
            },
            eventTileBuilder: (date, events, boundry, start, end) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  events.first.event.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
            fullDayEventBuilder: (events, date) {
              return Container();
            },
            showVerticalLine: true,
            showLiveTimeLineInAllDays: true,
            minDay: DateTime(1990),
            maxDay: DateTime(2050),
            initialDay: DateTime.now(),
            heightPerMinute: 1,
            eventArranger: const SideEventArranger(),
          ),
          const TimetableList(weekdayIndex: 1),
          const TimetableList(weekdayIndex: 2),
          const TimetableList(weekdayIndex: 3),
          const TimetableList(weekdayIndex: 4),
        ],
      ),
      bottomNavigationBar: TitledBottomNavigationBar(
        height: 60,
        indicatorHeight: 2.0,
        onTap: pageController.jumpToPage,
        reverse: false,
        curve: Curves.fastOutSlowIn,
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
