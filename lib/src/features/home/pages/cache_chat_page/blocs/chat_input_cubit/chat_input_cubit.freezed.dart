// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_input_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatInputState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() sendDisabled,
    required TResult Function() attachActions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? sendDisabled,
    TResult? Function()? attachActions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? sendDisabled,
    TResult Function()? attachActions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
    required TResult Function(_SendDisabled value) sendDisabled,
    required TResult Function(_AttachActions value) attachActions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
    TResult? Function(_SendDisabled value)? sendDisabled,
    TResult? Function(_AttachActions value)? attachActions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    TResult Function(_SendDisabled value)? sendDisabled,
    TResult Function(_AttachActions value)? attachActions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatInputStateCopyWith<$Res> {
  factory $ChatInputStateCopyWith(
          ChatInputState value, $Res Function(ChatInputState) then) =
      _$ChatInputStateCopyWithImpl<$Res, ChatInputState>;
}

/// @nodoc
class _$ChatInputStateCopyWithImpl<$Res, $Val extends ChatInputState>
    implements $ChatInputStateCopyWith<$Res> {
  _$ChatInputStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SendCopyWith<$Res> {
  factory _$$_SendCopyWith(_$_Send value, $Res Function(_$_Send) then) =
      __$$_SendCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$_SendCopyWithImpl<$Res>
    extends _$ChatInputStateCopyWithImpl<$Res, _$_Send>
    implements _$$_SendCopyWith<$Res> {
  __$$_SendCopyWithImpl(_$_Send _value, $Res Function(_$_Send) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$_Send(
      null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Send implements _Send {
  const _$_Send(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'ChatInputState.send(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Send &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SendCopyWith<_$_Send> get copyWith =>
      __$$_SendCopyWithImpl<_$_Send>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() sendDisabled,
    required TResult Function() attachActions,
  }) {
    return send(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? sendDisabled,
    TResult? Function()? attachActions,
  }) {
    return send?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? sendDisabled,
    TResult Function()? attachActions,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
    required TResult Function(_SendDisabled value) sendDisabled,
    required TResult Function(_AttachActions value) attachActions,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
    TResult? Function(_SendDisabled value)? sendDisabled,
    TResult? Function(_AttachActions value)? attachActions,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    TResult Function(_SendDisabled value)? sendDisabled,
    TResult Function(_AttachActions value)? attachActions,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements ChatInputState {
  const factory _Send(final String text) = _$_Send;

  String get text;
  @JsonKey(ignore: true)
  _$$_SendCopyWith<_$_Send> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendDisabledCopyWith<$Res> {
  factory _$$_SendDisabledCopyWith(
          _$_SendDisabled value, $Res Function(_$_SendDisabled) then) =
      __$$_SendDisabledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendDisabledCopyWithImpl<$Res>
    extends _$ChatInputStateCopyWithImpl<$Res, _$_SendDisabled>
    implements _$$_SendDisabledCopyWith<$Res> {
  __$$_SendDisabledCopyWithImpl(
      _$_SendDisabled _value, $Res Function(_$_SendDisabled) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SendDisabled implements _SendDisabled {
  const _$_SendDisabled();

  @override
  String toString() {
    return 'ChatInputState.sendDisabled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SendDisabled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() sendDisabled,
    required TResult Function() attachActions,
  }) {
    return sendDisabled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? sendDisabled,
    TResult? Function()? attachActions,
  }) {
    return sendDisabled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? sendDisabled,
    TResult Function()? attachActions,
    required TResult orElse(),
  }) {
    if (sendDisabled != null) {
      return sendDisabled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
    required TResult Function(_SendDisabled value) sendDisabled,
    required TResult Function(_AttachActions value) attachActions,
  }) {
    return sendDisabled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
    TResult? Function(_SendDisabled value)? sendDisabled,
    TResult? Function(_AttachActions value)? attachActions,
  }) {
    return sendDisabled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    TResult Function(_SendDisabled value)? sendDisabled,
    TResult Function(_AttachActions value)? attachActions,
    required TResult orElse(),
  }) {
    if (sendDisabled != null) {
      return sendDisabled(this);
    }
    return orElse();
  }
}

abstract class _SendDisabled implements ChatInputState {
  const factory _SendDisabled() = _$_SendDisabled;
}

/// @nodoc
abstract class _$$_AttachActionsCopyWith<$Res> {
  factory _$$_AttachActionsCopyWith(
          _$_AttachActions value, $Res Function(_$_AttachActions) then) =
      __$$_AttachActionsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AttachActionsCopyWithImpl<$Res>
    extends _$ChatInputStateCopyWithImpl<$Res, _$_AttachActions>
    implements _$$_AttachActionsCopyWith<$Res> {
  __$$_AttachActionsCopyWithImpl(
      _$_AttachActions _value, $Res Function(_$_AttachActions) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AttachActions implements _AttachActions {
  const _$_AttachActions();

  @override
  String toString() {
    return 'ChatInputState.attachActions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AttachActions);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) send,
    required TResult Function() sendDisabled,
    required TResult Function() attachActions,
  }) {
    return attachActions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? send,
    TResult? Function()? sendDisabled,
    TResult? Function()? attachActions,
  }) {
    return attachActions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? send,
    TResult Function()? sendDisabled,
    TResult Function()? attachActions,
    required TResult orElse(),
  }) {
    if (attachActions != null) {
      return attachActions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Send value) send,
    required TResult Function(_SendDisabled value) sendDisabled,
    required TResult Function(_AttachActions value) attachActions,
  }) {
    return attachActions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Send value)? send,
    TResult? Function(_SendDisabled value)? sendDisabled,
    TResult? Function(_AttachActions value)? attachActions,
  }) {
    return attachActions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Send value)? send,
    TResult Function(_SendDisabled value)? sendDisabled,
    TResult Function(_AttachActions value)? attachActions,
    required TResult orElse(),
  }) {
    if (attachActions != null) {
      return attachActions(this);
    }
    return orElse();
  }
}

abstract class _AttachActions implements ChatInputState {
  const factory _AttachActions() = _$_AttachActions;
}
