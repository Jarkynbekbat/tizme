import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

class ScheduleListTile extends StatelessWidget {
  final Schedule schedule;
  final bool isDisabled;

  final bool showWeekType;

  const ScheduleListTile({
    super.key,
    required this.schedule,
    this.isDisabled = false,
    this.showWeekType = true,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Opacity(
        opacity: isDisabled ? 0.33 : 1.0,
        child: ListTile(
          leading: FittedBox(
            child: Container(
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
                '${schedule.time.from}\n${schedule.time.to}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18.0),
              ),
            ),
          ),
          title: Text(schedule.subject),
          subtitle: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  '${schedule.teacher} • ${schedule.classroom} • ${schedule.lessonType}',
                ),
              ),
              if (showWeekType)
                Text(
                  schedule.week == WeekType.even ? 'Числитель' : 'Знаменатель',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.66),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
