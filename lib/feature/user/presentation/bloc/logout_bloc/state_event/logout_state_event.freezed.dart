// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logout_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogoutEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLogOut,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLogOut,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLogOut,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutUserEvent value) onLogOut,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutUserEvent value)? onLogOut,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutUserEvent value)? onLogOut,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutEventCopyWith<$Res> {
  factory $LogoutEventCopyWith(
          LogoutEvent value, $Res Function(LogoutEvent) then) =
      _$LogoutEventCopyWithImpl<$Res, LogoutEvent>;
}

/// @nodoc
class _$LogoutEventCopyWithImpl<$Res, $Val extends LogoutEvent>
    implements $LogoutEventCopyWith<$Res> {
  _$LogoutEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogoutUserEventCopyWith<$Res> {
  factory _$$LogoutUserEventCopyWith(
          _$LogoutUserEvent value, $Res Function(_$LogoutUserEvent) then) =
      __$$LogoutUserEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutUserEventCopyWithImpl<$Res>
    extends _$LogoutEventCopyWithImpl<$Res, _$LogoutUserEvent>
    implements _$$LogoutUserEventCopyWith<$Res> {
  __$$LogoutUserEventCopyWithImpl(
      _$LogoutUserEvent _value, $Res Function(_$LogoutUserEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutUserEvent implements LogoutUserEvent {
  const _$LogoutUserEvent();

  @override
  String toString() {
    return 'LogoutEvent.onLogOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutUserEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLogOut,
    required TResult Function() onReset,
  }) {
    return onLogOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLogOut,
    TResult? Function()? onReset,
  }) {
    return onLogOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLogOut,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onLogOut != null) {
      return onLogOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutUserEvent value) onLogOut,
    required TResult Function(Reset value) onReset,
  }) {
    return onLogOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutUserEvent value)? onLogOut,
    TResult? Function(Reset value)? onReset,
  }) {
    return onLogOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutUserEvent value)? onLogOut,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onLogOut != null) {
      return onLogOut(this);
    }
    return orElse();
  }
}

abstract class LogoutUserEvent implements LogoutEvent {
  const factory LogoutUserEvent() = _$LogoutUserEvent;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$LogoutEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'LogoutEvent.onReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLogOut,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLogOut,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLogOut,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutUserEvent value) onLogOut,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutUserEvent value)? onLogOut,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutUserEvent value)? onLogOut,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements LogoutEvent {
  const factory Reset() = _$Reset;
}

/// @nodoc
mixin _$LogoutState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogoutStateCopyWith<$Res> {
  factory $LogoutStateCopyWith(
          LogoutState value, $Res Function(LogoutState) then) =
      _$LogoutStateCopyWithImpl<$Res, LogoutState>;
}

/// @nodoc
class _$LogoutStateCopyWithImpl<$Res, $Val extends LogoutState>
    implements $LogoutStateCopyWith<$Res> {
  _$LogoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogoutInitialStateCopyWith<$Res> {
  factory _$$LogoutInitialStateCopyWith(_$LogoutInitialState value,
          $Res Function(_$LogoutInitialState) then) =
      __$$LogoutInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutInitialStateCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutInitialState>
    implements _$$LogoutInitialStateCopyWith<$Res> {
  __$$LogoutInitialStateCopyWithImpl(
      _$LogoutInitialState _value, $Res Function(_$LogoutInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutInitialState implements LogoutInitialState {
  const _$LogoutInitialState();

  @override
  String toString() {
    return 'LogoutState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LogoutInitialState implements LogoutState {
  const factory LogoutInitialState() = _$LogoutInitialState;
}

/// @nodoc
abstract class _$$LogoutLoadingStateCopyWith<$Res> {
  factory _$$LogoutLoadingStateCopyWith(_$LogoutLoadingState value,
          $Res Function(_$LogoutLoadingState) then) =
      __$$LogoutLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutLoadingStateCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutLoadingState>
    implements _$$LogoutLoadingStateCopyWith<$Res> {
  __$$LogoutLoadingStateCopyWithImpl(
      _$LogoutLoadingState _value, $Res Function(_$LogoutLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutLoadingState implements LogoutLoadingState {
  const _$LogoutLoadingState();

  @override
  String toString() {
    return 'LogoutState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
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
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LogoutLoadingState implements LogoutState {
  const factory LogoutLoadingState() = _$LogoutLoadingState;
}

/// @nodoc
abstract class _$$LogoutErrorStateCopyWith<$Res> {
  factory _$$LogoutErrorStateCopyWith(
          _$LogoutErrorState value, $Res Function(_$LogoutErrorState) then) =
      __$$LogoutErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LogoutErrorStateCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutErrorState>
    implements _$$LogoutErrorStateCopyWith<$Res> {
  __$$LogoutErrorStateCopyWithImpl(
      _$LogoutErrorState _value, $Res Function(_$LogoutErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LogoutErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogoutErrorState implements LogoutErrorState {
  const _$LogoutErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LogoutState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogoutErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogoutErrorStateCopyWith<_$LogoutErrorState> get copyWith =>
      __$$LogoutErrorStateCopyWithImpl<_$LogoutErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
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
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LogoutErrorState implements LogoutState {
  const factory LogoutErrorState(final String message) = _$LogoutErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$LogoutErrorStateCopyWith<_$LogoutErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogoutLoadedStateCopyWith<$Res> {
  factory _$$LogoutLoadedStateCopyWith(
          _$LogoutLoadedState value, $Res Function(_$LogoutLoadedState) then) =
      __$$LogoutLoadedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutLoadedStateCopyWithImpl<$Res>
    extends _$LogoutStateCopyWithImpl<$Res, _$LogoutLoadedState>
    implements _$$LogoutLoadedStateCopyWith<$Res> {
  __$$LogoutLoadedStateCopyWithImpl(
      _$LogoutLoadedState _value, $Res Function(_$LogoutLoadedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutLoadedState implements LogoutLoadedState {
  const _$LogoutLoadedState();

  @override
  String toString() {
    return 'LogoutState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutLoadedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogoutInitialState value) initial,
    required TResult Function(LogoutLoadingState value) loading,
    required TResult Function(LogoutErrorState value) error,
    required TResult Function(LogoutLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogoutInitialState value)? initial,
    TResult? Function(LogoutLoadingState value)? loading,
    TResult? Function(LogoutErrorState value)? error,
    TResult? Function(LogoutLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogoutInitialState value)? initial,
    TResult Function(LogoutLoadingState value)? loading,
    TResult Function(LogoutErrorState value)? error,
    TResult Function(LogoutLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LogoutLoadedState implements LogoutState {
  const factory LogoutLoadedState() = _$LogoutLoadedState;
}
