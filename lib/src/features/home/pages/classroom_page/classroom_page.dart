import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:studtime/src/features/home/pages/timetable_page/elements/timetable_list.dart';
import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

import 'elements/classroom_app_bar.dart';

class ClassroomPage extends HookWidget {
  final Classroom classroom;

  const ClassroomPage({
    Key? key,
    required this.classroom,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageController = useMemoized(
        () => PageController(initialPage: DateTime.now().weekday - 1));
    final navigationIndex = useState(pageController.initialPage);

    return Scaffold(
      appBar: ClassroomAppBar(classroom: classroom),
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
        items: const [
          BottomNavigationBarItem(
            icon: Text('ПН'),
            // icon: const DateText(0),
          ),
          BottomNavigationBarItem(
            icon: Text('ВТ'),
            // icon: const DateText(1),
          ),
          BottomNavigationBarItem(
            icon: Text('СР'),
            // icon: const DateText(2),
          ),
          BottomNavigationBarItem(
            icon: Text('ЧТ'),
            // icon: const DateText(3),
          ),
          BottomNavigationBarItem(
            icon: Text('ПТ'),
            // icon: const DateText(4),
          ),
          BottomNavigationBarItem(
            icon: Text('СБ'),
            // icon: const DateText(5),
          ),
        ],
        // activeColor: AppColors.primaryColor,
        // inactiveColor: Colors.blueGrey,
      ),
    );
  }
}
