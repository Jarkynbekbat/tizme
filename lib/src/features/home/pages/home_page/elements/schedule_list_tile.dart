import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/name/name.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/data/models/time/time.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

class ScheduleListTile extends StatelessWidget {
  final Schedule schedule;

  const ScheduleListTile({
    super.key,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
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
            child: schedule.timeRef.mapToWidget(
              mapper: Time.fromJson,
              builder: (time) {
                return Text(
                  '${time.from}\n${time.to}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18.0),
                );
              },
            ),
          ),
        ),
        title: schedule.subjectRef.mapToWidget<Name>(
          mapper: Name.fromJson,
          builder: (name) => Text(name.name),
        ),
        subtitle: Row(
          children: [
            schedule.teacherRef.mapToWidget<Name>(
              mapper: Name.fromJson,
              builder: (name) => Text(name.name),
            ),
            const Text(' • '),
            schedule.classroomRef.mapToWidget<Name>(
              mapper: Name.fromJson,
              builder: (value) => Text(value.name),
            ),
            const Text(' • '),
            schedule.lessonTypeRef.mapToWidget<Name>(
              mapper: Name.fromJson,
              builder: (value) => Text(value.name),
            ),
          ],
        ),
      ),
    );
  }
}
