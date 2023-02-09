import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_paddings.dart';

class ScheduleContent extends StatelessWidget {
  const ScheduleContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.defaultPadding),
        children: const [],
      ),
    );
  }
}
