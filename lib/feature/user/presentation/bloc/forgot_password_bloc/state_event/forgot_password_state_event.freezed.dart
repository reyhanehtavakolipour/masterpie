// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onForgotPassword,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onForgotPassword,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onForgotPassword,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPassword value) onForgotPassword,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPassword value)? onForgotPassword,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPassword value)? onForgotPassword,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordEventCopyWith<$Res> {
  factory $ForgotPasswordEventCopyWith(
          ForgotPasswordEvent value, $Res Function(ForgotPasswordEvent) then) =
      _$ForgotPasswordEventCopyWithImpl<$Res, ForgotPasswordEvent>;
}

/// @nodoc
class _$ForgotPasswordEventCopyWithImpl<$Res, $Val extends ForgotPasswordEvent>
    implements $ForgotPasswordEventCopyWith<$Res> {
  _$ForgotPasswordEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ForgotPasswordImplCopyWith<$Res> {
  factory _$$ForgotPasswordImplCopyWith(_$ForgotPasswordImpl value,
          $Res Function(_$ForgotPasswordImpl) then) =
      __$$ForgotPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$ForgotPasswordImpl>
    implements _$$ForgotPasswordImplCopyWith<$Res> {
  __$$ForgotPasswordImplCopyWithImpl(
      _$ForgotPasswordImpl _value, $Res Function(_$ForgotPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordImpl implements ForgotPassword {
  const _$ForgotPasswordImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordEvent.onForgotPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      __$$ForgotPasswordImplCopyWithImpl<_$ForgotPasswordImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onForgotPassword,
    required TResult Function() onReset,
  }) {
    return onForgotPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onForgotPassword,
    TResult? Function()? onReset,
  }) {
    return onForgotPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onForgotPassword,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onForgotPassword != null) {
      return onForgotPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ForgotPassword value) onForgotPassword,
    required TResult Function(Reset value) onReset,
  }) {
    return onForgotPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPassword value)? onForgotPassword,
    TResult? Function(Reset value)? onReset,
  }) {
    return onForgotPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPassword value)? onForgotPassword,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onForgotPassword != null) {
      return onForgotPassword(this);
    }
    return orElse();
  }
}

abstract class ForgotPassword implements ForgotPasswordEvent {
  const factory ForgotPassword(final String email) = _$ForgotPasswordImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$ForgotPasswordImplCopyWith<_$ForgotPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$ForgotPasswordEventCopyWithImpl<$Res, _$ResetImpl>
    implements _$$ResetImplCopyWith<$Res> {
  __$$ResetImplCopyWithImpl(
      _$ResetImpl _value, $Res Function(_$ResetImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResetImpl implements Reset {
  const _$ResetImpl();

  @override
  String toString() {
    return 'ForgotPasswordEvent.onReset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email) onForgotPassword,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email)? onForgotPassword,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email)? onForgotPassword,
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
    required TResult Function(ForgotPassword value) onForgotPassword,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPassword value)? onForgotPassword,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPassword value)? onForgotPassword,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements ForgotPasswordEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$ForgotPasswordState {
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
    required TResult Function(ForgotPasswordInitialState value) initial,
    required TResult Function(ForgotPasswordLoadingState value) loading,
    required TResult Function(ForgotPasswordErrorState value) error,
    required TResult Function(ForgotPasswordLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordInitialState value)? initial,
    TResult? Function(ForgotPasswordLoadingState value)? loading,
    TResult? Function(ForgotPasswordErrorState value)? error,
    TResult? Function(ForgotPasswordLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordInitialState value)? initial,
    TResult Function(ForgotPasswordLoadingState value)? loading,
    TResult Function(ForgotPasswordErrorState value)? error,
    TResult Function(ForgotPasswordLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) then) =
      _$ForgotPasswordStateCopyWithImpl<$Res, ForgotPasswordState>;
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res, $Val extends ForgotPasswordState>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ForgotPasswordInitialStateImplCopyWith<$Res> {
  factory _$$ForgotPasswordInitialStateImplCopyWith(
          _$ForgotPasswordInitialStateImpl value,
          $Res Function(_$ForgotPasswordInitialStateImpl) then) =
      __$$ForgotPasswordInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForgotPasswordInitialStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$ForgotPasswordInitialStateImpl>
    implements _$$ForgotPasswordInitialStateImplCopyWith<$Res> {
  __$$ForgotPasswordInitialStateImplCopyWithImpl(
      _$ForgotPasswordInitialStateImpl _value,
      $Res Function(_$ForgotPasswordInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ForgotPasswordInitialStateImpl implements ForgotPasswordInitialState {
  const _$ForgotPasswordInitialStateImpl();

  @override
  String toString() {
    return 'ForgotPasswordState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordInitialStateImpl);
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
    required TResult Function(ForgotPasswordInitialState value) initial,
    required TResult Function(ForgotPasswordLoadingState value) loading,
    required TResult Function(ForgotPasswordErrorState value) error,
    required TResult Function(ForgotPasswordLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordInitialState value)? initial,
    TResult? Function(ForgotPasswordLoadingState value)? loading,
    TResult? Function(ForgotPasswordErrorState value)? error,
    TResult? Function(ForgotPasswordLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordInitialState value)? initial,
    TResult Function(ForgotPasswordLoadingState value)? loading,
    TResult Function(ForgotPasswordErrorState value)? error,
    TResult Function(ForgotPasswordLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordInitialState implements ForgotPasswordState {
  const factory ForgotPasswordInitialState() = _$ForgotPasswordInitialStateImpl;
}

/// @nodoc
abstract class _$$ForgotPasswordLoadingStateImplCopyWith<$Res> {
  factory _$$ForgotPasswordLoadingStateImplCopyWith(
          _$ForgotPasswordLoadingStateImpl value,
          $Res Function(_$ForgotPasswordLoadingStateImpl) then) =
      __$$ForgotPasswordLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForgotPasswordLoadingStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$ForgotPasswordLoadingStateImpl>
    implements _$$ForgotPasswordLoadingStateImplCopyWith<$Res> {
  __$$ForgotPasswordLoadingStateImplCopyWithImpl(
      _$ForgotPasswordLoadingStateImpl _value,
      $Res Function(_$ForgotPasswordLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ForgotPasswordLoadingStateImpl implements ForgotPasswordLoadingState {
  const _$ForgotPasswordLoadingStateImpl();

  @override
  String toString() {
    return 'ForgotPasswordState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordLoadingStateImpl);
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
    required TResult Function(ForgotPasswordInitialState value) initial,
    required TResult Function(ForgotPasswordLoadingState value) loading,
    required TResult Function(ForgotPasswordErrorState value) error,
    required TResult Function(ForgotPasswordLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordInitialState value)? initial,
    TResult? Function(ForgotPasswordLoadingState value)? loading,
    TResult? Function(ForgotPasswordErrorState value)? error,
    TResult? Function(ForgotPasswordLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordInitialState value)? initial,
    TResult Function(ForgotPasswordLoadingState value)? loading,
    TResult Function(ForgotPasswordErrorState value)? error,
    TResult Function(ForgotPasswordLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordLoadingState implements ForgotPasswordState {
  const factory ForgotPasswordLoadingState() = _$ForgotPasswordLoadingStateImpl;
}

/// @nodoc
abstract class _$$ForgotPasswordErrorStateImplCopyWith<$Res> {
  factory _$$ForgotPasswordErrorStateImplCopyWith(
          _$ForgotPasswordErrorStateImpl value,
          $Res Function(_$ForgotPasswordErrorStateImpl) then) =
      __$$ForgotPasswordErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ForgotPasswordErrorStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$ForgotPasswordErrorStateImpl>
    implements _$$ForgotPasswordErrorStateImplCopyWith<$Res> {
  __$$ForgotPasswordErrorStateImplCopyWithImpl(
      _$ForgotPasswordErrorStateImpl _value,
      $Res Function(_$ForgotPasswordErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ForgotPasswordErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordErrorStateImpl implements ForgotPasswordErrorState {
  const _$ForgotPasswordErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ForgotPasswordState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordErrorStateImplCopyWith<_$ForgotPasswordErrorStateImpl>
      get copyWith => __$$ForgotPasswordErrorStateImplCopyWithImpl<
          _$ForgotPasswordErrorStateImpl>(this, _$identity);

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
    required TResult Function(ForgotPasswordInitialState value) initial,
    required TResult Function(ForgotPasswordLoadingState value) loading,
    required TResult Function(ForgotPasswordErrorState value) error,
    required TResult Function(ForgotPasswordLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordInitialState value)? initial,
    TResult? Function(ForgotPasswordLoadingState value)? loading,
    TResult? Function(ForgotPasswordErrorState value)? error,
    TResult? Function(ForgotPasswordLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordInitialState value)? initial,
    TResult Function(ForgotPasswordLoadingState value)? loading,
    TResult Function(ForgotPasswordErrorState value)? error,
    TResult Function(ForgotPasswordLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordErrorState implements ForgotPasswordState {
  const factory ForgotPasswordErrorState(final String message) =
      _$ForgotPasswordErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ForgotPasswordErrorStateImplCopyWith<_$ForgotPasswordErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ForgotPasswordLoadedStateImplCopyWith<$Res> {
  factory _$$ForgotPasswordLoadedStateImplCopyWith(
          _$ForgotPasswordLoadedStateImpl value,
          $Res Function(_$ForgotPasswordLoadedStateImpl) then) =
      __$$ForgotPasswordLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ForgotPasswordLoadedStateImplCopyWithImpl<$Res>
    extends _$ForgotPasswordStateCopyWithImpl<$Res,
        _$ForgotPasswordLoadedStateImpl>
    implements _$$ForgotPasswordLoadedStateImplCopyWith<$Res> {
  __$$ForgotPasswordLoadedStateImplCopyWithImpl(
      _$ForgotPasswordLoadedStateImpl _value,
      $Res Function(_$ForgotPasswordLoadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ForgotPasswordLoadedStateImpl implements ForgotPasswordLoadedState {
  const _$ForgotPasswordLoadedStateImpl();

  @override
  String toString() {
    return 'ForgotPasswordState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordLoadedStateImpl);
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
    required TResult Function(ForgotPasswordInitialState value) initial,
    required TResult Function(ForgotPasswordLoadingState value) loading,
    required TResult Function(ForgotPasswordErrorState value) error,
    required TResult Function(ForgotPasswordLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ForgotPasswordInitialState value)? initial,
    TResult? Function(ForgotPasswordLoadingState value)? loading,
    TResult? Function(ForgotPasswordErrorState value)? error,
    TResult? Function(ForgotPasswordLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ForgotPasswordInitialState value)? initial,
    TResult Function(ForgotPasswordLoadingState value)? loading,
    TResult Function(ForgotPasswordErrorState value)? error,
    TResult Function(ForgotPasswordLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ForgotPasswordLoadedState implements ForgotPasswordState {
  const factory ForgotPasswordLoadedState() = _$ForgotPasswordLoadedStateImpl;
}
