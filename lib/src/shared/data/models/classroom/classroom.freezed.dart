// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'classroom.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Classroom _$ClassroomFromJson(Map<String, dynamic> json) {
  return _Classroom.fromJson(json);
}

/// @nodoc
mixin _$Classroom {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClassroomCopyWith<Classroom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClassroomCopyWith<$Res> {
  factory $ClassroomCopyWith(Classroom value, $Res Function(Classroom) then) =
      _$ClassroomCopyWithImpl<$Res, Classroom>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$ClassroomCopyWithImpl<$Res, $Val extends Classroom>
    implements $ClassroomCopyWith<$Res> {
  _$ClassroomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClassroomCopyWith<$Res> implements $ClassroomCopyWith<$Res> {
  factory _$$_ClassroomCopyWith(
          _$_Classroom value, $Res Function(_$_Classroom) then) =
      __$$_ClassroomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$_ClassroomCopyWithImpl<$Res>
    extends _$ClassroomCopyWithImpl<$Res, _$_Classroom>
    implements _$$_ClassroomCopyWith<$Res> {
  __$$_ClassroomCopyWithImpl(
      _$_Classroom _value, $Res Function(_$_Classroom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Classroom(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Classroom implements _Classroom {
  const _$_Classroom({required this.id, required this.name});

  factory _$_Classroom.fromJson(Map<String, dynamic> json) =>
      _$$_ClassroomFromJson(json);

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'Classroom(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Classroom &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClassroomCopyWith<_$_Classroom> get copyWith =>
      __$$_ClassroomCopyWithImpl<_$_Classroom>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClassroomToJson(
      this,
    );
  }
}

abstract class _Classroom implements Classroom {
  const factory _Classroom(
      {required final int id, required final String name}) = _$_Classroom;

  factory _Classroom.fromJson(Map<String, dynamic> json) =
      _$_Classroom.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_ClassroomCopyWith<_$_Classroom> get copyWith =>
      throw _privateConstructorUsedError;
}
