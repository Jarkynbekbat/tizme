// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialization,
    required TResult Function() loading,
    required TResult Function() loggedOut,
    required TResult Function(Student student) loggedIn,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialization,
    TResult? Function()? loading,
    TResult? Function()? loggedOut,
    TResult? Function(Student student)? loggedIn,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialization,
    TResult Function()? loading,
    TResult Function()? loggedOut,
    TResult Function(Student student)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialization value) initialization,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loaded value) loggedIn,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialization value)? initialization,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Loaded value)? loggedIn,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialization value)? initialization,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loaded value)? loggedIn,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializationCopyWith<$Res> {
  factory _$$_InitializationCopyWith(
          _$_Initialization value, $Res Function(_$_Initialization) then) =
      __$$_InitializationCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializationCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Initialization>
    implements _$$_InitializationCopyWith<$Res> {
  __$$_InitializationCopyWithImpl(
      _$_Initialization _value, $Res Function(_$_Initialization) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialization implements _Initialization {
  const _$_Initialization();

  @override
  String toString() {
    return 'AuthState.initialization()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialization);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialization,
    required TResult Function() loading,
    required TResult Function() loggedOut,
    required TResult Function(Student student) loggedIn,
    required TResult Function(String message) error,
  }) {
    return initialization();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialization,
    TResult? Function()? loading,
    TResult? Function()? loggedOut,
    TResult? Function(Student student)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return initialization?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialization,
    TResult Function()? loading,
    TResult Function()? loggedOut,
    TResult Function(Student student)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initialization != null) {
      return initialization();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialization value) initialization,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loaded value) loggedIn,
    required TResult Function(_Error value) error,
  }) {
    return initialization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialization value)? initialization,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Loaded value)? loggedIn,
    TResult? Function(_Error value)? error,
  }) {
    return initialization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialization value)? initialization,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loaded value)? loggedIn,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initialization != null) {
      return initialization(this);
    }
    return orElse();
  }
}

abstract class _Initialization implements AuthState {
  const factory _Initialization() = _$_Initialization;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialization,
    required TResult Function() loading,
    required TResult Function() loggedOut,
    required TResult Function(Student student) loggedIn,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialization,
    TResult? Function()? loading,
    TResult? Function()? loggedOut,
    TResult? Function(Student student)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialization,
    TResult Function()? loading,
    TResult Function()? loggedOut,
    TResult Function(Student student)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialization value) initialization,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loaded value) loggedIn,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialization value)? initialization,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Loaded value)? loggedIn,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialization value)? initialization,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loaded value)? loggedIn,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AuthState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_LoggedOutCopyWith<$Res> {
  factory _$$_LoggedOutCopyWith(
          _$_LoggedOut value, $Res Function(_$_LoggedOut) then) =
      __$$_LoggedOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoggedOutCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_LoggedOut>
    implements _$$_LoggedOutCopyWith<$Res> {
  __$$_LoggedOutCopyWithImpl(
      _$_LoggedOut _value, $Res Function(_$_LoggedOut) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoggedOut implements _LoggedOut {
  const _$_LoggedOut();

  @override
  String toString() {
    return 'AuthState.loggedOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoggedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialization,
    required TResult Function() loading,
    required TResult Function() loggedOut,
    required TResult Function(Student student) loggedIn,
    required TResult Function(String message) error,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialization,
    TResult? Function()? loading,
    TResult? Function()? loggedOut,
    TResult? Function(Student student)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialization,
    TResult Function()? loading,
    TResult Function()? loggedOut,
    TResult Function(Student student)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialization value) initialization,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loaded value) loggedIn,
    required TResult Function(_Error value) error,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialization value)? initialization,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Loaded value)? loggedIn,
    TResult? Function(_Error value)? error,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialization value)? initialization,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loaded value)? loggedIn,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class _LoggedOut implements AuthState {
  const factory _LoggedOut() = _$_LoggedOut;
}

/// @nodoc
abstract class _$$_LoadedCopyWith<$Res> {
  factory _$$_LoadedCopyWith(_$_Loaded value, $Res Function(_$_Loaded) then) =
      __$$_LoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Student student});

  $StudentCopyWith<$Res> get student;
}

/// @nodoc
class __$$_LoadedCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Loaded>
    implements _$$_LoadedCopyWith<$Res> {
  __$$_LoadedCopyWithImpl(_$_Loaded _value, $Res Function(_$_Loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? student = null,
  }) {
    return _then(_$_Loaded(
      null == student
          ? _value.student
          : student // ignore: cast_nullable_to_non_nullable
              as Student,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $StudentCopyWith<$Res> get student {
    return $StudentCopyWith<$Res>(_value.student, (value) {
      return _then(_value.copyWith(student: value));
    });
  }
}

/// @nodoc

class _$_Loaded implements _Loaded {
  const _$_Loaded(this.student);

  @override
  final Student student;

  @override
  String toString() {
    return 'AuthState.loggedIn(student: $student)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Loaded &&
            (identical(other.student, student) || other.student == student));
  }

  @override
  int get hashCode => Object.hash(runtimeType, student);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      __$$_LoadedCopyWithImpl<_$_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialization,
    required TResult Function() loading,
    required TResult Function() loggedOut,
    required TResult Function(Student student) loggedIn,
    required TResult Function(String message) error,
  }) {
    return loggedIn(student);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialization,
    TResult? Function()? loading,
    TResult? Function()? loggedOut,
    TResult? Function(Student student)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return loggedIn?.call(student);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialization,
    TResult Function()? loading,
    TResult Function()? loggedOut,
    TResult Function(Student student)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(student);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialization value) initialization,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loaded value) loggedIn,
    required TResult Function(_Error value) error,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialization value)? initialization,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Loaded value)? loggedIn,
    TResult? Function(_Error value)? error,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialization value)? initialization,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loaded value)? loggedIn,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements AuthState {
  const factory _Loaded(final Student student) = _$_Loaded;

  Student get student;
  @JsonKey(ignore: true)
  _$$_LoadedCopyWith<_$_Loaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Error(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialization,
    required TResult Function() loading,
    required TResult Function() loggedOut,
    required TResult Function(Student student) loggedIn,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialization,
    TResult? Function()? loading,
    TResult? Function()? loggedOut,
    TResult? Function(Student student)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialization,
    TResult Function()? loading,
    TResult Function()? loggedOut,
    TResult Function(Student student)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialization value) initialization,
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoggedOut value) loggedOut,
    required TResult Function(_Loaded value) loggedIn,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialization value)? initialization,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_LoggedOut value)? loggedOut,
    TResult? Function(_Loaded value)? loggedIn,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialization value)? initialization,
    TResult Function(_Loading value)? loading,
    TResult Function(_LoggedOut value)? loggedOut,
    TResult Function(_Loaded value)? loggedIn,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AuthState {
  const factory _Error(final String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}
