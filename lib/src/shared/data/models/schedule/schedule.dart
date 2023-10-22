import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:studtime/src/shared/data/models/classroom/classroom.dart';
import 'package:studtime/src/shared/data/models/group/group.dart';
import 'package:studtime/src/shared/data/models/subject/subject.dart';
import 'package:studtime/src/shared/data/models/teacher/teacher.dart';
import 'package:studtime/src/shared/data/models/way/way.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    required int id,
    required int classroomId,
    required int subjectId,
    required int teacherId,
    required int? groupId,
    required int? wayId,
    @JsonKey(name: 'classrooms') required Classroom classroom,
    @JsonKey(name: 'subjects') required Subject subject,
    @JsonKey(name: 'teachers') required Teacher teacher,
    @JsonKey(name: 'groups') required Group? group,
    @JsonKey(name: 'ways') required Way? way,
    required Weekday weekday,
    required WeekType weekType,
    required TimeSlot timeSlot,
    required LessonType lessonType,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}

extension ScheduleTarget on Schedule {
  T map<T>({
    required T Function(Schedule value) group,
    required T Function(Schedule value) way,
  }) {
    if (groupId != null) {
      return group(this);
    } else if (wayId != null) {
      return way(this);
    } else {
      throw Exception('Unknown type');
    }
  }
}

enum TimeSlot {
  @JsonValue('1')
  slot1,
  @JsonValue('2')
  slot2,
  @JsonValue('3')
  slot3,
  @JsonValue('4')
  slot4,
  @JsonValue('5')
  slot5,
  @JsonValue('6')
  slot6,
  @JsonValue('7')
  slot7,
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
