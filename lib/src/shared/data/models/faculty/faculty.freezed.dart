// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'faculty.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Faculty _$FacultyFromJson(Map<String, dynamic> json) {
  return _Faculty.fromJson(json);
}

/// @nodoc
mixin _$Faculty {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FacultyCopyWith<Faculty> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FacultyCopyWith<$Res> {
  factory $FacultyCopyWith(Faculty value, $Res Function(Faculty) then) =
      _$FacultyCopyWithImpl<$Res, Faculty>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$FacultyCopyWithImpl<$Res, $Val extends Faculty>
    implements $FacultyCopyWith<$Res> {
  _$FacultyCopyWithImpl(this._value, this._then);

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
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FacultyCopyWith<$Res> implements $FacultyCopyWith<$Res> {
  factory _$$_FacultyCopyWith(
          _$_Faculty value, $Res Function(_$_Faculty) then) =
      __$$_FacultyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$_FacultyCopyWithImpl<$Res>
    extends _$FacultyCopyWithImpl<$Res, _$_Faculty>
    implements _$$_FacultyCopyWith<$Res> {
  __$$_FacultyCopyWithImpl(_$_Faculty _value, $Res Function(_$_Faculty) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_Faculty(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Faculty implements _Faculty {
  const _$_Faculty({required this.id, required this.name});

  factory _$_Faculty.fromJson(Map<String, dynamic> json) =>
      _$$_FacultyFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'Faculty(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Faculty &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FacultyCopyWith<_$_Faculty> get copyWith =>
      __$$_FacultyCopyWithImpl<_$_Faculty>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FacultyToJson(
      this,
    );
  }
}

abstract class _Faculty implements Faculty {
  const factory _Faculty(
      {required final String id, required final String name}) = _$_Faculty;

  factory _Faculty.fromJson(Map<String, dynamic> json) = _$_Faculty.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_FacultyCopyWith<_$_Faculty> get copyWith =>
      throw _privateConstructorUsedError;
}
