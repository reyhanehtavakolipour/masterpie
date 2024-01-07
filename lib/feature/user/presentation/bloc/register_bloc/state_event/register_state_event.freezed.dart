// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        onRegisterWithCredential,
    required TResult Function() onRegisterWithGoogle,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onRegisterWithCredential,
    TResult? Function()? onRegisterWithGoogle,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onRegisterWithCredential,
    TResult Function()? onRegisterWithGoogle,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterWithCredentialEvent value)
        onRegisterWithCredential,
    required TResult Function(RegisterWithGoogleEvent value)
        onRegisterWithGoogle,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult? Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterEventCopyWith<$Res> {
  factory $RegisterEventCopyWith(
          RegisterEvent value, $Res Function(RegisterEvent) then) =
      _$RegisterEventCopyWithImpl<$Res, RegisterEvent>;
}

/// @nodoc
class _$RegisterEventCopyWithImpl<$Res, $Val extends RegisterEvent>
    implements $RegisterEventCopyWith<$Res> {
  _$RegisterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterWithCredentialEventCopyWith<$Res> {
  factory _$$RegisterWithCredentialEventCopyWith(
          _$RegisterWithCredentialEvent value,
          $Res Function(_$RegisterWithCredentialEvent) then) =
      __$$RegisterWithCredentialEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$RegisterWithCredentialEventCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterWithCredentialEvent>
    implements _$$RegisterWithCredentialEventCopyWith<$Res> {
  __$$RegisterWithCredentialEventCopyWithImpl(
      _$RegisterWithCredentialEvent _value,
      $Res Function(_$RegisterWithCredentialEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$RegisterWithCredentialEvent(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterWithCredentialEvent implements RegisterWithCredentialEvent {
  const _$RegisterWithCredentialEvent(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.onRegisterWithCredential(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithCredentialEvent &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterWithCredentialEventCopyWith<_$RegisterWithCredentialEvent>
      get copyWith => __$$RegisterWithCredentialEventCopyWithImpl<
          _$RegisterWithCredentialEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        onRegisterWithCredential,
    required TResult Function() onRegisterWithGoogle,
    required TResult Function() onReset,
  }) {
    return onRegisterWithCredential(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onRegisterWithCredential,
    TResult? Function()? onRegisterWithGoogle,
    TResult? Function()? onReset,
  }) {
    return onRegisterWithCredential?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onRegisterWithCredential,
    TResult Function()? onRegisterWithGoogle,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onRegisterWithCredential != null) {
      return onRegisterWithCredential(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterWithCredentialEvent value)
        onRegisterWithCredential,
    required TResult Function(RegisterWithGoogleEvent value)
        onRegisterWithGoogle,
    required TResult Function(Reset value) onReset,
  }) {
    return onRegisterWithCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult? Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) {
    return onRegisterWithCredential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onRegisterWithCredential != null) {
      return onRegisterWithCredential(this);
    }
    return orElse();
  }
}

abstract class RegisterWithCredentialEvent implements RegisterEvent {
  const factory RegisterWithCredentialEvent(
          final String email, final String password) =
      _$RegisterWithCredentialEvent;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$RegisterWithCredentialEventCopyWith<_$RegisterWithCredentialEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterWithGoogleEventCopyWith<$Res> {
  factory _$$RegisterWithGoogleEventCopyWith(_$RegisterWithGoogleEvent value,
          $Res Function(_$RegisterWithGoogleEvent) then) =
      __$$RegisterWithGoogleEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterWithGoogleEventCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterWithGoogleEvent>
    implements _$$RegisterWithGoogleEventCopyWith<$Res> {
  __$$RegisterWithGoogleEventCopyWithImpl(_$RegisterWithGoogleEvent _value,
      $Res Function(_$RegisterWithGoogleEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterWithGoogleEvent implements RegisterWithGoogleEvent {
  const _$RegisterWithGoogleEvent();

  @override
  String toString() {
    return 'RegisterEvent.onRegisterWithGoogle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithGoogleEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        onRegisterWithCredential,
    required TResult Function() onRegisterWithGoogle,
    required TResult Function() onReset,
  }) {
    return onRegisterWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onRegisterWithCredential,
    TResult? Function()? onRegisterWithGoogle,
    TResult? Function()? onReset,
  }) {
    return onRegisterWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onRegisterWithCredential,
    TResult Function()? onRegisterWithGoogle,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onRegisterWithGoogle != null) {
      return onRegisterWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterWithCredentialEvent value)
        onRegisterWithCredential,
    required TResult Function(RegisterWithGoogleEvent value)
        onRegisterWithGoogle,
    required TResult Function(Reset value) onReset,
  }) {
    return onRegisterWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult? Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) {
    return onRegisterWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onRegisterWithGoogle != null) {
      return onRegisterWithGoogle(this);
    }
    return orElse();
  }
}

abstract class RegisterWithGoogleEvent implements RegisterEvent {
  const factory RegisterWithGoogleEvent() = _$RegisterWithGoogleEvent;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'RegisterEvent.onReset()';
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
    required TResult Function(String email, String password)
        onRegisterWithCredential,
    required TResult Function() onRegisterWithGoogle,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onRegisterWithCredential,
    TResult? Function()? onRegisterWithGoogle,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onRegisterWithCredential,
    TResult Function()? onRegisterWithGoogle,
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
    required TResult Function(RegisterWithCredentialEvent value)
        onRegisterWithCredential,
    required TResult Function(RegisterWithGoogleEvent value)
        onRegisterWithGoogle,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult? Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterWithCredentialEvent value)?
        onRegisterWithCredential,
    TResult Function(RegisterWithGoogleEvent value)? onRegisterWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements RegisterEvent {
  const factory Reset() = _$Reset;
}

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String email) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String email)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String email)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RegisterInitialStateCopyWith<$Res> {
  factory _$$RegisterInitialStateCopyWith(_$RegisterInitialState value,
          $Res Function(_$RegisterInitialState) then) =
      __$$RegisterInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterInitialStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterInitialState>
    implements _$$RegisterInitialStateCopyWith<$Res> {
  __$$RegisterInitialStateCopyWithImpl(_$RegisterInitialState _value,
      $Res Function(_$RegisterInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterInitialState implements RegisterInitialState {
  const _$RegisterInitialState();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String email) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String email)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String email)? loaded,
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
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RegisterInitialState implements RegisterState {
  const factory RegisterInitialState() = _$RegisterInitialState;
}

/// @nodoc
abstract class _$$RegisterLoadingStateCopyWith<$Res> {
  factory _$$RegisterLoadingStateCopyWith(_$RegisterLoadingState value,
          $Res Function(_$RegisterLoadingState) then) =
      __$$RegisterLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterLoadingStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterLoadingState>
    implements _$$RegisterLoadingStateCopyWith<$Res> {
  __$$RegisterLoadingStateCopyWithImpl(_$RegisterLoadingState _value,
      $Res Function(_$RegisterLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterLoadingState implements RegisterLoadingState {
  const _$RegisterLoadingState();

  @override
  String toString() {
    return 'RegisterState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RegisterLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String email) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String email)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String email)? loaded,
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
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadingState implements RegisterState {
  const factory RegisterLoadingState() = _$RegisterLoadingState;
}

/// @nodoc
abstract class _$$RegisterErrorStateCopyWith<$Res> {
  factory _$$RegisterErrorStateCopyWith(_$RegisterErrorState value,
          $Res Function(_$RegisterErrorState) then) =
      __$$RegisterErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterErrorState>
    implements _$$RegisterErrorStateCopyWith<$Res> {
  __$$RegisterErrorStateCopyWithImpl(
      _$RegisterErrorState _value, $Res Function(_$RegisterErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegisterErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterErrorState implements RegisterErrorState {
  const _$RegisterErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorStateCopyWith<_$RegisterErrorState> get copyWith =>
      __$$RegisterErrorStateCopyWithImpl<_$RegisterErrorState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String email) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String email)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String email)? loaded,
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
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RegisterErrorState implements RegisterState {
  const factory RegisterErrorState(final String message) = _$RegisterErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$RegisterErrorStateCopyWith<_$RegisterErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterLoadedStateCopyWith<$Res> {
  factory _$$RegisterLoadedStateCopyWith(_$RegisterLoadedState value,
          $Res Function(_$RegisterLoadedState) then) =
      __$$RegisterLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$RegisterLoadedStateCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterLoadedState>
    implements _$$RegisterLoadedStateCopyWith<$Res> {
  __$$RegisterLoadedStateCopyWithImpl(
      _$RegisterLoadedState _value, $Res Function(_$RegisterLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$RegisterLoadedState(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterLoadedState implements RegisterLoadedState {
  const _$RegisterLoadedState(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterState.loaded(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadedState &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterLoadedStateCopyWith<_$RegisterLoadedState> get copyWith =>
      __$$RegisterLoadedStateCopyWithImpl<_$RegisterLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(String email) loaded,
  }) {
    return loaded(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(String email)? loaded,
  }) {
    return loaded?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(String email)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RegisterInitialState value) initial,
    required TResult Function(RegisterLoadingState value) loading,
    required TResult Function(RegisterErrorState value) error,
    required TResult Function(RegisterLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RegisterInitialState value)? initial,
    TResult? Function(RegisterLoadingState value)? loading,
    TResult? Function(RegisterErrorState value)? error,
    TResult? Function(RegisterLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RegisterInitialState value)? initial,
    TResult Function(RegisterLoadingState value)? loading,
    TResult Function(RegisterErrorState value)? error,
    TResult Function(RegisterLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RegisterLoadedState implements RegisterState {
  const factory RegisterLoadedState(final String email) = _$RegisterLoadedState;

  String get email;
  @JsonKey(ignore: true)
  _$$RegisterLoadedStateCopyWith<_$RegisterLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
