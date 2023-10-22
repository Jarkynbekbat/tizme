// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as int,
      classroomId: json['classroom_id'] as int,
      subjectId: json['subject_id'] as int,
      teacherId: json['teacher_id'] as int,
      groupId: json['group_id'] as int?,
      wayId: json['way_id'] as int?,
      classroom: Classroom.fromJson(json['classrooms'] as Map<String, dynamic>),
      subject: Subject.fromJson(json['subjects'] as Map<String, dynamic>),
      teacher: Teacher.fromJson(json['teachers'] as Map<String, dynamic>),
      group: json['groups'] == null
          ? null
          : Group.fromJson(json['groups'] as Map<String, dynamic>),
      way: json['ways'] == null
          ? null
          : Way.fromJson(json['ways'] as Map<String, dynamic>),
      weekday: $enumDecode(_$WeekdayEnumMap, json['weekday']),
      weekType: $enumDecode(_$WeekTypeEnumMap, json['week_type']),
      timeSlot: $enumDecode(_$TimeSlotEnumMap, json['time_slot']),
      lessonType: $enumDecode(_$LessonTypeEnumMap, json['lesson_type']),
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classroom_id': instance.classroomId,
      'subject_id': instance.subjectId,
      'teacher_id': instance.teacherId,
      'group_id': instance.groupId,
      'way_id': instance.wayId,
      'classrooms': instance.classroom,
      'subjects': instance.subject,
      'teachers': instance.teacher,
      'groups': instance.group,
      'ways': instance.way,
      'weekday': _$WeekdayEnumMap[instance.weekday]!,
      'week_type': _$WeekTypeEnumMap[instance.weekType]!,
      'time_slot': _$TimeSlotEnumMap[instance.timeSlot]!,
      'lesson_type': _$LessonTypeEnumMap[instance.lessonType]!,
    };

const _$WeekdayEnumMap = {
  Weekday.monday: 'monday',
  Weekday.tuesday: 'tuesday',
  Weekday.wednesday: 'wednesday',
  Weekday.thursday: 'thursday',
  Weekday.friday: 'friday',
  Weekday.saturday: 'saturday',
};

const _$WeekTypeEnumMap = {
  WeekType.even: 'even',
  WeekType.odd: 'odd',
};

const _$TimeSlotEnumMap = {
  TimeSlot.slot1: '1',
  TimeSlot.slot2: '2',
  TimeSlot.slot3: '3',
  TimeSlot.slot4: '4',
  TimeSlot.slot5: '5',
  TimeSlot.slot6: '6',
  TimeSlot.slot7: '7',
};

const _$LessonTypeEnumMap = {
  LessonType.lecture: 'lecture',
  LessonType.practice: 'practice',
  LessonType.lab: 'lab',
  LessonType.exam: 'exam',
};
