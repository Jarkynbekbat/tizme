// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  String get id => throw _privateConstructorUsedError;

  /// doc refs
  Classroom get classroom => throw _privateConstructorUsedError;
  Group get group => throw _privateConstructorUsedError;
  Subject get subject => throw _privateConstructorUsedError;
  Teacher get teacher => throw _privateConstructorUsedError;
  Time get time => throw _privateConstructorUsedError;

  /// enums,
  Weekday get weekday => throw _privateConstructorUsedError;
  WeekType get weekType => throw _privateConstructorUsedError;
  LessonType get lessonType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {String id,
      Classroom classroom,
      Group group,
      Subject subject,
      Teacher teacher,
      Time time,
      Weekday weekday,
      WeekType weekType,
      LessonType lessonType});

  $ClassroomCopyWith<$Res> get classroom;
  $GroupCopyWith<$Res> get group;
  $SubjectCopyWith<$Res> get subject;
  $TeacherCopyWith<$Res> get teacher;
  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? classroom = null,
    Object? group = null,
    Object? subject = null,
    Object? teacher = null,
    Object? time = null,
    Object? weekday = null,
    Object? weekType = null,
    Object? lessonType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as Classroom,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as Weekday,
      weekType: null == weekType
          ? _value.weekType
          : weekType // ignore: cast_nullable_to_non_nullable
              as WeekType,
      lessonType: null == lessonType
          ? _value.lessonType
          : lessonType // ignore: cast_nullable_to_non_nullable
              as LessonType,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ClassroomCopyWith<$Res> get classroom {
    return $ClassroomCopyWith<$Res>(_value.classroom, (value) {
      return _then(_value.copyWith(classroom: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupCopyWith<$Res> get group {
    return $GroupCopyWith<$Res>(_value.group, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res> get subject {
    return $SubjectCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TeacherCopyWith<$Res> get teacher {
    return $TeacherCopyWith<$Res>(_value.teacher, (value) {
      return _then(_value.copyWith(teacher: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TimeCopyWith<$Res> get time {
    return $TimeCopyWith<$Res>(_value.time, (value) {
      return _then(_value.copyWith(time: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$$_ScheduleCopyWith(
          _$_Schedule value, $Res Function(_$_Schedule) then) =
      __$$_ScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Classroom classroom,
      Group group,
      Subject subject,
      Teacher teacher,
      Time time,
      Weekday weekday,
      WeekType weekType,
      LessonType lessonType});

  @override
  $ClassroomCopyWith<$Res> get classroom;
  @override
  $GroupCopyWith<$Res> get group;
  @override
  $SubjectCopyWith<$Res> get subject;
  @override
  $TeacherCopyWith<$Res> get teacher;
  @override
  $TimeCopyWith<$Res> get time;
}

/// @nodoc
class __$$_ScheduleCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$_Schedule>
    implements _$$_ScheduleCopyWith<$Res> {
  __$$_ScheduleCopyWithImpl(
      _$_Schedule _value, $Res Function(_$_Schedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? classroom = null,
    Object? group = null,
    Object? subject = null,
    Object? teacher = null,
    Object? time = null,
    Object? weekday = null,
    Object? weekType = null,
    Object? lessonType = null,
  }) {
    return _then(_$_Schedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as Classroom,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as Time,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as Weekday,
      weekType: null == weekType
          ? _value.weekType
          : weekType // ignore: cast_nullable_to_non_nullable
              as WeekType,
      lessonType: null == lessonType
          ? _value.lessonType
          : lessonType // ignore: cast_nullable_to_non_nullable
              as LessonType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schedule implements _Schedule {
  _$_Schedule(
      {required this.id,
      required this.classroom,
      required this.group,
      required this.subject,
      required this.teacher,
      required this.time,
      required this.weekday,
      required this.weekType,
      required this.lessonType});

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  final String id;

  /// doc refs
  @override
  final Classroom classroom;
  @override
  final Group group;
  @override
  final Subject subject;
  @override
  final Teacher teacher;
  @override
  final Time time;

  /// enums,
  @override
  final Weekday weekday;
  @override
  final WeekType weekType;
  @override
  final LessonType lessonType;

  @override
  String toString() {
    return 'Schedule(id: $id, classroom: $classroom, group: $group, subject: $subject, teacher: $teacher, time: $time, weekday: $weekday, weekType: $weekType, lessonType: $lessonType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.weekType, weekType) ||
                other.weekType == weekType) &&
            (identical(other.lessonType, lessonType) ||
                other.lessonType == lessonType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, classroom, group, subject,
      teacher, time, weekday, weekType, lessonType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      __$$_ScheduleCopyWithImpl<_$_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  factory _Schedule(
      {required final String id,
      required final Classroom classroom,
      required final Group group,
      required final Subject subject,
      required final Teacher teacher,
      required final Time time,
      required final Weekday weekday,
      required final WeekType weekType,
      required final LessonType lessonType}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  String get id;
  @override

  /// doc refs
  Classroom get classroom;
  @override
  Group get group;
  @override
  Subject get subject;
  @override
  Teacher get teacher;
  @override
  Time get time;
  @override

  /// enums,
  Weekday get weekday;
  @override
  WeekType get weekType;
  @override
  LessonType get lessonType;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}
