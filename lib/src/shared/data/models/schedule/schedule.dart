import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/schedule/group_schedule.dart';
import 'package:studtime/src/shared/data/models/schedule/way_schedule.dart';
import 'package:studtime/src/shared/data/models/subject/subject.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';
import 'package:studtime/src/shared/data/models/time/time.dart';

final fs = FirebaseFirestore.instance;

typedef MapDocRef = DocumentReference<Map<String, dynamic>>;
typedef MapDocSnap = DocumentSnapshot<Map<String, dynamic>>;
typedef MapQDocSnap = QueryDocumentSnapshot<Map<String, dynamic>>;

/// Интерфейс элемента расписания
abstract class Schedule {
  final String id;

  /// doc refs,
  final Classroom classroom;
  final Subject subject;
  final Teacher teacher;
  final Time time;

  final DocumentReference targetRef;

  /// enums,
  final Weekday weekday;
  final WeekType weekType;
  final LessonType lessonType;
  final Semester semester;
  final TargetType targetType;

  const Schedule({
    required this.id,

    /// doc refs,
    required this.classroom,
    required this.subject,
    required this.teacher,
    required this.time,
    required this.targetRef,

    /// enums,
    required this.weekday,
    required this.weekType,
    required this.lessonType,
    required this.semester,
    required this.targetType,
  });

  static Future<Schedule> fromDoc(MapDocSnap doc) {
    final data = doc.data()!;
    final targetType = TargetType.values.firstWhere(
      (e) => e.name == data['target_type'],
    );

    switch (targetType) {
      case TargetType.group:
        return GroupSchedule.fromDoc(doc);
      case TargetType.way:
        return WaySchedule.fromDoc(doc);
      default:
        throw Exception('Unknown target type');
    }
  }

  Map<String, dynamic> toFirestoreMap() {
    return {
      'classroom_ref': fs.doc('/classroms/${classroom.id}'),
      'subject_ref': fs.doc('/subjects/${subject.id}'),
      'teacher_ref': fs.doc('/teachers/${teacher.id}'),
      'time_ref': fs.doc('/times/${time.id}'),
      'target_ref': targetRef,
      'weekday': weekday.name,
      'week_type': weekType.name,
      'lesson_type': lessonType.name,
      'semester': semester.name,
    };
  }

  T map<T>({
    required T Function(GroupSchedule) group,
    required T Function(WaySchedule) way,
  }) {
    if (this is GroupSchedule) {
      return group(this as GroupSchedule);
    } else if (this is WaySchedule) {
      return way(this as WaySchedule);
    } else {
      throw Exception('Unknown schedule type');
    }
  }
}

enum Semester {
  first,
  second,
}

enum Weekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
}

enum WeekType {
  even,
  odd,
}

enum LessonType {
  lecture,
  practice,
  lab,
  exam,
}

enum TargetType {
  group,
  way,
}
