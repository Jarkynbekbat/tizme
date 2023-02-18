import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

class ScheduleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ScheduleAppBar({
    super.key,
    required this.schedule,
  });

  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AutoSizeText(
        schedule.subject.name,
        style: const TextStyle(fontSize: 16),
        maxLines: 2,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
