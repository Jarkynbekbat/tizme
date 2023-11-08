// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'way.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Way _$WayFromJson(Map<String, dynamic> json) {
  return _Way.fromJson(json);
}

/// @nodoc
mixin _$Way {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get facultyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WayCopyWith<Way> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WayCopyWith<$Res> {
  factory $WayCopyWith(Way value, $Res Function(Way) then) =
      _$WayCopyWithImpl<$Res, Way>;
  @useResult
  $Res call({int id, String name, int facultyId});
}

/// @nodoc
class _$WayCopyWithImpl<$Res, $Val extends Way> implements $WayCopyWith<$Res> {
  _$WayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? facultyId = null,
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
      facultyId: null == facultyId
          ? _value.facultyId
          : facultyId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WayCopyWith<$Res> implements $WayCopyWith<$Res> {
  factory _$$_WayCopyWith(_$_Way value, $Res Function(_$_Way) then) =
      __$$_WayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, int facultyId});
}

/// @nodoc
class __$$_WayCopyWithImpl<$Res> extends _$WayCopyWithImpl<$Res, _$_Way>
    implements _$$_WayCopyWith<$Res> {
  __$$_WayCopyWithImpl(_$_Way _value, $Res Function(_$_Way) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? facultyId = null,
  }) {
    return _then(_$_Way(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      facultyId: null == facultyId
          ? _value.facultyId
          : facultyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Way implements _Way {
  const _$_Way({required this.id, required this.name, required this.facultyId});

  factory _$_Way.fromJson(Map<String, dynamic> json) => _$$_WayFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int facultyId;

  @override
  String toString() {
    return 'Way(id: $id, name: $name, facultyId: $facultyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Way &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.facultyId, facultyId) ||
                other.facultyId == facultyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, facultyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WayCopyWith<_$_Way> get copyWith =>
      __$$_WayCopyWithImpl<_$_Way>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WayToJson(
      this,
    );
  }
}

abstract class _Way implements Way {
  const factory _Way(
      {required final int id,
      required final String name,
      required final int facultyId}) = _$_Way;

  factory _Way.fromJson(Map<String, dynamic> json) = _$_Way.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get facultyId;
  @override
  @JsonKey(ignore: true)
  _$$_WayCopyWith<_$_Way> get copyWith => throw _privateConstructorUsedError;
}
