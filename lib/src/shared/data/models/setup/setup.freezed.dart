// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setup.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Setup _$SetupFromJson(Map<String, dynamic> json) {
  return _Setup.fromJson(json);
}

/// @nodoc
mixin _$Setup {
  /// student - id группы,
  /// teacher - id преподавателя
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  SetupType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetupCopyWith<Setup> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetupCopyWith<$Res> {
  factory $SetupCopyWith(Setup value, $Res Function(Setup) then) =
      _$SetupCopyWithImpl<$Res, Setup>;
  @useResult
  $Res call({String id, String name, SetupType type});
}

/// @nodoc
class _$SetupCopyWithImpl<$Res, $Val extends Setup>
    implements $SetupCopyWith<$Res> {
  _$SetupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SetupType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SetupCopyWith<$Res> implements $SetupCopyWith<$Res> {
  factory _$$_SetupCopyWith(_$_Setup value, $Res Function(_$_Setup) then) =
      __$$_SetupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, SetupType type});
}

/// @nodoc
class __$$_SetupCopyWithImpl<$Res> extends _$SetupCopyWithImpl<$Res, _$_Setup>
    implements _$$_SetupCopyWith<$Res> {
  __$$_SetupCopyWithImpl(_$_Setup _value, $Res Function(_$_Setup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? type = null,
  }) {
    return _then(_$_Setup(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as SetupType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Setup implements _Setup {
  _$_Setup({required this.id, required this.name, required this.type});

  factory _$_Setup.fromJson(Map<String, dynamic> json) =>
      _$$_SetupFromJson(json);

  /// student - id группы,
  /// teacher - id преподавателя
  @override
  final String id;
  @override
  final String name;
  @override
  final SetupType type;

  @override
  String toString() {
    return 'Setup(id: $id, name: $name, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Setup &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SetupCopyWith<_$_Setup> get copyWith =>
      __$$_SetupCopyWithImpl<_$_Setup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SetupToJson(
      this,
    );
  }
}

abstract class _Setup implements Setup {
  factory _Setup(
      {required final String id,
      required final String name,
      required final SetupType type}) = _$_Setup;

  factory _Setup.fromJson(Map<String, dynamic> json) = _$_Setup.fromJson;

  @override

  /// student - id группы,
  /// teacher - id преподавателя
  String get id;
  @override
  String get name;
  @override
  SetupType get type;
  @override
  @JsonKey(ignore: true)
  _$$_SetupCopyWith<_$_Setup> get copyWith =>
      throw _privateConstructorUsedError;
}
