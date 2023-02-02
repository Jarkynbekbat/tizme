import 'package:flutter/material.dart';
import 'package:studtime/src/features/home/pages/home_page/elements/schedule_list_tile.dart';
import 'package:studtime/src/shared/data/models/timetable/timetable.dart';

class TimetableList extends StatelessWidget {
  final int weekdayIndex;
  const TimetableList({super.key, required this.weekdayIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, index) => ScheduleListTile(
        scheduleItem: ScheduleItem.mock(),
      ),
    );
  }
}
