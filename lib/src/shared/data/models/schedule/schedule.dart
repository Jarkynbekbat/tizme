import 'package:equatable/equatable.dart';
import 'package:studtime/src/shared/data/models/schedule/schedule_ref.dart';
import 'package:studtime/src/shared/data/models/time/time.dart';
import 'package:studtime/src/shared/extensions/on_datetime.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

class Schedule extends Equatable {
  final String id;
  final String classroom;
  final Weekday day;
  final String group;
  final String lessonType;
  final Semester semester;
  final String subject;
  final String subjectId;
  final String teacher;
  final Time time;
  final WeekType week;

  const Schedule({
    required this.id,
    required this.classroom,
    required this.day,
    required this.group,
    required this.lessonType,
    required this.semester,
    required this.subject,
    required this.subjectId,
    required this.teacher,
    required this.time,
    required this.week,
  });

  static Future<Schedule> fromRef(ScheduleRef scheduleRef) async {
    final futures = [
      scheduleRef.classroomRef.flyweightFetch(),
      scheduleRef.dayRef.flyweightFetch(),
      scheduleRef.groupRef.flyweightFetch(),
      scheduleRef.lessonTypeRef.flyweightFetch(),
      scheduleRef.semesterRef.flyweightFetch(),
      scheduleRef.subjectRef.flyweightFetch(),
      scheduleRef.teacherRef.flyweightFetch(),
      scheduleRef.timeRef.flyweightFetch(),
      scheduleRef.weekRef.flyweightFetch()
    ];

    final results = await Future.wait(futures);

    final classroomMap = results[0].data() as Map<String, dynamic>;
    final classroom = classroomMap['name'] as String;

    final weekdayMap = results[1].data() as Map<String, dynamic>;
    final weekdayIndex = weekdayMap['index'] as int;
    final weekday = Weekday.values[weekdayIndex];

    final groupMap = results[2].data() as Map<String, dynamic>;
    final group = groupMap['name'] as String;

    final lessonTypeMap = results[3].data() as Map<String, dynamic>;
    final lessonType = lessonTypeMap['name'] as String;

    final semesterMap = results[4].data() as Map<String, dynamic>;
    final semesterIndex = semesterMap['index'] as int;
    final semester = Semester.values[semesterIndex];

    final subjectMap = results[5].data() as Map<String, dynamic>;
    final subject = subjectMap['name'] as String;
    final subjectId = scheduleRef.subjectRef.id;

    final teacherMap = results[6].data() as Map<String, dynamic>;
    final teacher = teacherMap['name'] as String;

    final timeMap = results[7].data() as Map<String, dynamic>;
    final time = Time.fromJson(timeMap);

    final weekMap = results[8].data() as Map<String, dynamic>;

    final weekIndex = weekMap['index'] as int;
    final week = WeekType.values[weekIndex];

    return Schedule(
      id: scheduleRef.id,
      classroom: classroom,
      day: weekday,
      group: group,
      lessonType: lessonType,
      semester: semester,
      subject: subject,
      subjectId: subjectId,
      teacher: teacher,
      time: time,
      week: week,
    );
  }

  @override
  List<Object?> get props => [
        id,
        classroom,
        day,
        group,
        lessonType,
        semester,
        subject,
        teacher,
        time,
        week,
      ];

  bool get isCurrentWeek {
    final currentWeekType = DateTime.now().getWeekType();
    return week == currentWeekType;
  }
}

enum Weekday { monday, tuesday, wednesday, thursday, friday }

enum Semester { first, second }

enum WeekType {
  /// Числитель
  even,

  /// Знаменатель
  odd,
}
