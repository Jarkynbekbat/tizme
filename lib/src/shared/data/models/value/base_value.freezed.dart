// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BaseValue _$BaseValueFromJson(Map<String, dynamic> json) {
  return _BaseValue.fromJson(json);
}

/// @nodoc
mixin _$BaseValue {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BaseValueCopyWith<BaseValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseValueCopyWith<$Res> {
  factory $BaseValueCopyWith(BaseValue value, $Res Function(BaseValue) then) =
      _$BaseValueCopyWithImpl<$Res, BaseValue>;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$BaseValueCopyWithImpl<$Res, $Val extends BaseValue>
    implements $BaseValueCopyWith<$Res> {
  _$BaseValueCopyWithImpl(this._value, this._then);

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
abstract class _$$_BaseValueCopyWith<$Res> implements $BaseValueCopyWith<$Res> {
  factory _$$_BaseValueCopyWith(
          _$_BaseValue value, $Res Function(_$_BaseValue) then) =
      __$$_BaseValueCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$$_BaseValueCopyWithImpl<$Res>
    extends _$BaseValueCopyWithImpl<$Res, _$_BaseValue>
    implements _$$_BaseValueCopyWith<$Res> {
  __$$_BaseValueCopyWithImpl(
      _$_BaseValue _value, $Res Function(_$_BaseValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_BaseValue(
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
class _$_BaseValue implements _BaseValue {
  const _$_BaseValue({required this.id, required this.name});

  factory _$_BaseValue.fromJson(Map<String, dynamic> json) =>
      _$$_BaseValueFromJson(json);

  @override
  final String id;
  @override
  final String name;

  @override
  String toString() {
    return 'BaseValue(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BaseValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BaseValueCopyWith<_$_BaseValue> get copyWith =>
      __$$_BaseValueCopyWithImpl<_$_BaseValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BaseValueToJson(
      this,
    );
  }
}

abstract class _BaseValue implements BaseValue {
  const factory _BaseValue(
      {required final String id, required final String name}) = _$_BaseValue;

  factory _BaseValue.fromJson(Map<String, dynamic> json) =
      _$_BaseValue.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_BaseValueCopyWith<_$_BaseValue> get copyWith =>
      throw _privateConstructorUsedError;
}
