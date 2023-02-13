import 'package:flutter/material.dart';
import 'package:studtime/src/shared/styles/app_colors.dart';

class DateText extends StatelessWidget {
  final int weekdayIndex;
  const DateText(this.weekdayIndex, {super.key});

  String getDateByWeekday(int weekday) {
    final now = DateTime.now();
    final daysUntilTarget = weekday - now.weekday;
    final targetDate = now.add(Duration(days: daysUntilTarget));
    final day = targetDate.day.toString().padLeft(2, "0");
    final month = targetDate.month.toString().padLeft(2, "0");
    return '$day.$month';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      getDateByWeekday(weekdayIndex),
      style: const TextStyle(
        fontSize: 15.0,
        color: AppColors.primaryColor,
      ),
    );
  }
}
