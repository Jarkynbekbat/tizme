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
  int get id => throw _privateConstructorUsedError;
  int get classroomId => throw _privateConstructorUsedError;
  int get subjectId => throw _privateConstructorUsedError;
  int get teacherId => throw _privateConstructorUsedError;
  int? get groupId => throw _privateConstructorUsedError;
  int? get wayId => throw _privateConstructorUsedError;
  @JsonKey(name: 'classrooms')
  Classroom get classroom => throw _privateConstructorUsedError;
  @JsonKey(name: 'subjects')
  Subject get subject => throw _privateConstructorUsedError;
  @JsonKey(name: 'teachers')
  Teacher get teacher => throw _privateConstructorUsedError;
  @JsonKey(name: 'groups')
  Group? get group => throw _privateConstructorUsedError;
  @JsonKey(name: 'ways')
  Way? get way => throw _privateConstructorUsedError;
  Weekday get weekday => throw _privateConstructorUsedError;
  WeekType get weekType => throw _privateConstructorUsedError;
  TimeSlot get timeSlot => throw _privateConstructorUsedError;
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
      {int id,
      int classroomId,
      int subjectId,
      int teacherId,
      int? groupId,
      int? wayId,
      @JsonKey(name: 'classrooms') Classroom classroom,
      @JsonKey(name: 'subjects') Subject subject,
      @JsonKey(name: 'teachers') Teacher teacher,
      @JsonKey(name: 'groups') Group? group,
      @JsonKey(name: 'ways') Way? way,
      Weekday weekday,
      WeekType weekType,
      TimeSlot timeSlot,
      LessonType lessonType});

  $ClassroomCopyWith<$Res> get classroom;
  $SubjectCopyWith<$Res> get subject;
  $TeacherCopyWith<$Res> get teacher;
  $GroupCopyWith<$Res>? get group;
  $WayCopyWith<$Res>? get way;
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
    Object? classroomId = null,
    Object? subjectId = null,
    Object? teacherId = null,
    Object? groupId = freezed,
    Object? wayId = freezed,
    Object? classroom = null,
    Object? subject = null,
    Object? teacher = null,
    Object? group = freezed,
    Object? way = freezed,
    Object? weekday = null,
    Object? weekType = null,
    Object? timeSlot = null,
    Object? lessonType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      wayId: freezed == wayId
          ? _value.wayId
          : wayId // ignore: cast_nullable_to_non_nullable
              as int?,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as Classroom,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
      way: freezed == way
          ? _value.way
          : way // ignore: cast_nullable_to_non_nullable
              as Way?,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as Weekday,
      weekType: null == weekType
          ? _value.weekType
          : weekType // ignore: cast_nullable_to_non_nullable
              as WeekType,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot,
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
  $GroupCopyWith<$Res>? get group {
    if (_value.group == null) {
      return null;
    }

    return $GroupCopyWith<$Res>(_value.group!, (value) {
      return _then(_value.copyWith(group: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WayCopyWith<$Res>? get way {
    if (_value.way == null) {
      return null;
    }

    return $WayCopyWith<$Res>(_value.way!, (value) {
      return _then(_value.copyWith(way: value) as $Val);
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
      {int id,
      int classroomId,
      int subjectId,
      int teacherId,
      int? groupId,
      int? wayId,
      @JsonKey(name: 'classrooms') Classroom classroom,
      @JsonKey(name: 'subjects') Subject subject,
      @JsonKey(name: 'teachers') Teacher teacher,
      @JsonKey(name: 'groups') Group? group,
      @JsonKey(name: 'ways') Way? way,
      Weekday weekday,
      WeekType weekType,
      TimeSlot timeSlot,
      LessonType lessonType});

  @override
  $ClassroomCopyWith<$Res> get classroom;
  @override
  $SubjectCopyWith<$Res> get subject;
  @override
  $TeacherCopyWith<$Res> get teacher;
  @override
  $GroupCopyWith<$Res>? get group;
  @override
  $WayCopyWith<$Res>? get way;
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
    Object? classroomId = null,
    Object? subjectId = null,
    Object? teacherId = null,
    Object? groupId = freezed,
    Object? wayId = freezed,
    Object? classroom = null,
    Object? subject = null,
    Object? teacher = null,
    Object? group = freezed,
    Object? way = freezed,
    Object? weekday = null,
    Object? weekType = null,
    Object? timeSlot = null,
    Object? lessonType = null,
  }) {
    return _then(_$_Schedule(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as int,
      subjectId: null == subjectId
          ? _value.subjectId
          : subjectId // ignore: cast_nullable_to_non_nullable
              as int,
      teacherId: null == teacherId
          ? _value.teacherId
          : teacherId // ignore: cast_nullable_to_non_nullable
              as int,
      groupId: freezed == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as int?,
      wayId: freezed == wayId
          ? _value.wayId
          : wayId // ignore: cast_nullable_to_non_nullable
              as int?,
      classroom: null == classroom
          ? _value.classroom
          : classroom // ignore: cast_nullable_to_non_nullable
              as Classroom,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      teacher: null == teacher
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as Teacher,
      group: freezed == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as Group?,
      way: freezed == way
          ? _value.way
          : way // ignore: cast_nullable_to_non_nullable
              as Way?,
      weekday: null == weekday
          ? _value.weekday
          : weekday // ignore: cast_nullable_to_non_nullable
              as Weekday,
      weekType: null == weekType
          ? _value.weekType
          : weekType // ignore: cast_nullable_to_non_nullable
              as WeekType,
      timeSlot: null == timeSlot
          ? _value.timeSlot
          : timeSlot // ignore: cast_nullable_to_non_nullable
              as TimeSlot,
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
  const _$_Schedule(
      {required this.id,
      required this.classroomId,
      required this.subjectId,
      required this.teacherId,
      required this.groupId,
      required this.wayId,
      @JsonKey(name: 'classrooms') required this.classroom,
      @JsonKey(name: 'subjects') required this.subject,
      @JsonKey(name: 'teachers') required this.teacher,
      @JsonKey(name: 'groups') required this.group,
      @JsonKey(name: 'ways') required this.way,
      required this.weekday,
      required this.weekType,
      required this.timeSlot,
      required this.lessonType});

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  final int id;
  @override
  final int classroomId;
  @override
  final int subjectId;
  @override
  final int teacherId;
  @override
  final int? groupId;
  @override
  final int? wayId;
  @override
  @JsonKey(name: 'classrooms')
  final Classroom classroom;
  @override
  @JsonKey(name: 'subjects')
  final Subject subject;
  @override
  @JsonKey(name: 'teachers')
  final Teacher teacher;
  @override
  @JsonKey(name: 'groups')
  final Group? group;
  @override
  @JsonKey(name: 'ways')
  final Way? way;
  @override
  final Weekday weekday;
  @override
  final WeekType weekType;
  @override
  final TimeSlot timeSlot;
  @override
  final LessonType lessonType;

  @override
  String toString() {
    return 'Schedule(id: $id, classroomId: $classroomId, subjectId: $subjectId, teacherId: $teacherId, groupId: $groupId, wayId: $wayId, classroom: $classroom, subject: $subject, teacher: $teacher, group: $group, way: $way, weekday: $weekday, weekType: $weekType, timeSlot: $timeSlot, lessonType: $lessonType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.classroomId, classroomId) ||
                other.classroomId == classroomId) &&
            (identical(other.subjectId, subjectId) ||
                other.subjectId == subjectId) &&
            (identical(other.teacherId, teacherId) ||
                other.teacherId == teacherId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.wayId, wayId) || other.wayId == wayId) &&
            (identical(other.classroom, classroom) ||
                other.classroom == classroom) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.teacher, teacher) || other.teacher == teacher) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.way, way) || other.way == way) &&
            (identical(other.weekday, weekday) || other.weekday == weekday) &&
            (identical(other.weekType, weekType) ||
                other.weekType == weekType) &&
            (identical(other.timeSlot, timeSlot) ||
                other.timeSlot == timeSlot) &&
            (identical(other.lessonType, lessonType) ||
                other.lessonType == lessonType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      classroomId,
      subjectId,
      teacherId,
      groupId,
      wayId,
      classroom,
      subject,
      teacher,
      group,
      way,
      weekday,
      weekType,
      timeSlot,
      lessonType);

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
  const factory _Schedule(
      {required final int id,
      required final int classroomId,
      required final int subjectId,
      required final int teacherId,
      required final int? groupId,
      required final int? wayId,
      @JsonKey(name: 'classrooms') required final Classroom classroom,
      @JsonKey(name: 'subjects') required final Subject subject,
      @JsonKey(name: 'teachers') required final Teacher teacher,
      @JsonKey(name: 'groups') required final Group? group,
      @JsonKey(name: 'ways') required final Way? way,
      required final Weekday weekday,
      required final WeekType weekType,
      required final TimeSlot timeSlot,
      required final LessonType lessonType}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  int get id;
  @override
  int get classroomId;
  @override
  int get subjectId;
  @override
  int get teacherId;
  @override
  int? get groupId;
  @override
  int? get wayId;
  @override
  @JsonKey(name: 'classrooms')
  Classroom get classroom;
  @override
  @JsonKey(name: 'subjects')
  Subject get subject;
  @override
  @JsonKey(name: 'teachers')
  Teacher get teacher;
  @override
  @JsonKey(name: 'groups')
  Group? get group;
  @override
  @JsonKey(name: 'ways')
  Way? get way;
  @override
  Weekday get weekday;
  @override
  WeekType get weekType;
  @override
  TimeSlot get timeSlot;
  @override
  LessonType get lessonType;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}
