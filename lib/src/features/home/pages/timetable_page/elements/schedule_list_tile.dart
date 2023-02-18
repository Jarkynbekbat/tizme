import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/extensions/on_context.dart';
import 'package:studtime/src/shared/extensions/on_lesson_type.dart';
import 'package:studtime/src/shared/extensions/on_weektype.dart';

class ScheduleListTile extends StatelessWidget {
  final Schedule schedule;
  final bool isDisabled;

  final bool showWeekType;
  final bool isTeacher;

  const ScheduleListTile({
    super.key,
    required this.schedule,
    required this.isDisabled,
    required this.showWeekType,
    required this.isTeacher,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.pushNamed('/schedule', arguments: schedule);
      },
      padding: EdgeInsets.zero,
      child: Card(
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
            title: Text(schedule.subject.name),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    '${isTeacher ? schedule.group.name : schedule.teacher.name} • ${schedule.classroom.name} • ${schedule.lessonType.title}',
                  ),
                ),
                if (showWeekType)
                  Text(
                    schedule.weekType.title,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor.withOpacity(0.66),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
