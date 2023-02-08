import 'package:studtime/src/shared/data/models/schedule/schedule.dart';

/// Элемент расписания с зависимостью от типа недели
class WeekDependSchedule extends Schedule {
  final Schedule disabled;

  const WeekDependSchedule({
    required super.id,
    required super.classroom,
    required super.day,
    required super.group,
    required super.lessonType,
    required super.semester,
    required super.subject,
    required super.teacher,
    required super.time,
    required super.week,
    required this.disabled,
  });

  factory WeekDependSchedule.fromSchedule({
    required Schedule schedule,
    required Schedule disabled,
  }) {
    return WeekDependSchedule(
      id: schedule.id,
      classroom: schedule.classroom,
      day: schedule.day,
      group: schedule.group,
      lessonType: schedule.lessonType,
      semester: schedule.semester,
      subject: schedule.subject,
      teacher: schedule.teacher,
      time: schedule.time,
      week: schedule.week,
      disabled: disabled,
    );
  }
}
