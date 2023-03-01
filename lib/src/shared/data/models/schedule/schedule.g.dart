// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as String,
      classroom: Classroom.fromJson(json['classroom'] as Map<String, dynamic>),
      group: Group.fromJson(json['group'] as Map<String, dynamic>),
      subject: Subject.fromJson(json['subject'] as Map<String, dynamic>),
      teacher: Teacher.fromJson(json['teacher'] as Map<String, dynamic>),
      time: Time.fromJson(json['time'] as Map<String, dynamic>),
      weekday: $enumDecode(_$WeekdayEnumMap, json['weekday']),
      weekType: $enumDecode(_$WeekTypeEnumMap, json['weekType']),
      lessonType: $enumDecode(_$LessonTypeEnumMap, json['lessonType']),
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classroom': instance.classroom,
      'group': instance.group,
      'subject': instance.subject,
      'teacher': instance.teacher,
      'time': instance.time,
      'weekday': _$WeekdayEnumMap[instance.weekday]!,
      'weekType': _$WeekTypeEnumMap[instance.weekType]!,
      'lessonType': _$LessonTypeEnumMap[instance.lessonType]!,
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

const _$LessonTypeEnumMap = {
  LessonType.lecture: 'lecture',
  LessonType.practice: 'practice',
  LessonType.lab: 'lab',
  LessonType.exam: 'exam',
};
