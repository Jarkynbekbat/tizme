import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';
import 'package:studtime/src/shared/widgets/app_future_widget.dart';

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
      child: AppFutureWidget(
        key: ValueKey("AppFutureWidget__${schedule.id}"),
        future: schedule.fetch(),
        builder: (context, data) {
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
                '${data.time.from}\n${data.time.to}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            title: Text(
              data.subject,
            ),
            subtitle: Text(
              "${data.teacher} • ${data.classroom} • ${data.lessonType}",
            ),
          );
        },
      ),
    );
  }
}
