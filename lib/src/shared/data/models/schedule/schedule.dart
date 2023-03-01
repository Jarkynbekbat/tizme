import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/data/models/subject/subject.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';
import 'package:studtime/src/shared/data/models/time/time.dart';
import 'package:studtime/src/shared/extensions/on_doc_ref.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

typedef MapDocRef = DocumentReference<Map<String, dynamic>>;
typedef MapDocSnap = DocumentSnapshot<Map<String, dynamic>>;
typedef MapQDocSnap = QueryDocumentSnapshot<Map<String, dynamic>>;

/// Модель элемента расписания
@freezed
class Schedule with _$Schedule {
  factory Schedule({
    required String id,

    /// doc refs
    required Classroom classroom,
    required Group group,
    required Subject subject,
    required Teacher teacher,
    required Time time,

    /// enums,
    required Weekday weekday,
    required WeekType weekType,
    required LessonType lessonType,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  static Future<Schedule> fromDoc(MapQDocSnap doc) async {
    final data = doc.data();

    final classroomRef = data['classroom_ref'] as MapDocRef;
    final groupRef = data['group_ref'] as MapDocRef;
    final subjectRef = data['subject_ref'] as MapDocRef;
    final teacherRef = data['teacher_ref'] as MapDocRef;
    final timeRef = data['time_ref'] as MapDocRef;

    final results = await Future.wait([
      classroomRef.flyweightFetch(),
      groupRef.flyweightFetch(),
      subjectRef.flyweightFetch(),
      teacherRef.flyweightFetch(),
      timeRef.flyweightFetch(),
    ]);

    return Schedule.fromJson({
      "id": doc.id,
      "classroom": {'id': classroomRef.id, ...results[0].data()!},
      "group": {'id': groupRef.id, ...results[1].data()!},
      "subject": {'id': subjectRef.id, ...results[2].data()!},
      "teacher": {'id': teacherRef.id, ...results[3].data()!},
      "time": {'id': timeRef.id, ...results[4].data()!},
      "weekday": data['weekday'],
      "weekType": data['week_type'],
      "lessonType": data['lesson_type'],
    });
  }
}

enum Weekday {
  @JsonValue("monday")
  monday,

  @JsonValue("tuesday")
  tuesday,

  @JsonValue("wednesday")
  wednesday,

  @JsonValue("thursday")
  thursday,

  @JsonValue("friday")
  friday,

  @JsonValue("saturday")
  saturday,
}

enum WeekType {
  @JsonValue("even")
  even,

  @JsonValue("odd")
  odd,
}

enum LessonType {
  @JsonValue("lecture")
  lecture,

  @JsonValue("practice")
  practice,

  @JsonValue("lab")
  lab,

  @JsonValue("exam")
  exam,
}
