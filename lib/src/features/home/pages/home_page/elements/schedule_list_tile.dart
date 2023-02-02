import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/timetable/timetable.dart';

class ScheduleListTile extends StatelessWidget {
  final ScheduleItem scheduleItem;

  const ScheduleListTile({
    super.key,
    required this.scheduleItem,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Theme.of(context).dividerColor.withOpacity(0.33),
              width: 1.0,
            ),
          ),
        ),
        child: Text(
          '${scheduleItem.timeFrom}\n${scheduleItem.timeTo}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
      title: Text(
        scheduleItem.subject,
        style: const TextStyle(
          height: 1.0,
        ),
      ),
      subtitle: Text(
        "${scheduleItem.teacher} • ${scheduleItem.classroom} • ${scheduleItem.lessonType}",
        style: const TextStyle(
          height: 1.0,
        ),
      ),
    );
  }
}
