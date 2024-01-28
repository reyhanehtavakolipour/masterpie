// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        onLoginWithCredential,
    required TResult Function() onLoginWithGoogle,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onLoginWithCredential,
    TResult? Function()? onLoginWithGoogle,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onLoginWithCredential,
    TResult Function()? onLoginWithGoogle,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithCredentialEvent value)
        onLoginWithCredential,
    required TResult Function(LoginWithGoogleEvent value) onLoginWithGoogle,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult? Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginWithCredentialEventImplCopyWith<$Res> {
  factory _$$LoginWithCredentialEventImplCopyWith(
          _$LoginWithCredentialEventImpl value,
          $Res Function(_$LoginWithCredentialEventImpl) then) =
      __$$LoginWithCredentialEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginWithCredentialEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginWithCredentialEventImpl>
    implements _$$LoginWithCredentialEventImplCopyWith<$Res> {
  __$$LoginWithCredentialEventImplCopyWithImpl(
      _$LoginWithCredentialEventImpl _value,
      $Res Function(_$LoginWithCredentialEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginWithCredentialEventImpl(
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

class _$LoginWithCredentialEventImpl implements LoginWithCredentialEvent {
  const _$LoginWithCredentialEventImpl(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginEvent.onLoginWithCredential(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithCredentialEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginWithCredentialEventImplCopyWith<_$LoginWithCredentialEventImpl>
      get copyWith => __$$LoginWithCredentialEventImplCopyWithImpl<
          _$LoginWithCredentialEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        onLoginWithCredential,
    required TResult Function() onLoginWithGoogle,
    required TResult Function() onReset,
  }) {
    return onLoginWithCredential(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onLoginWithCredential,
    TResult? Function()? onLoginWithGoogle,
    TResult? Function()? onReset,
  }) {
    return onLoginWithCredential?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onLoginWithCredential,
    TResult Function()? onLoginWithGoogle,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onLoginWithCredential != null) {
      return onLoginWithCredential(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithCredentialEvent value)
        onLoginWithCredential,
    required TResult Function(LoginWithGoogleEvent value) onLoginWithGoogle,
    required TResult Function(Reset value) onReset,
  }) {
    return onLoginWithCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult? Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) {
    return onLoginWithCredential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onLoginWithCredential != null) {
      return onLoginWithCredential(this);
    }
    return orElse();
  }
}

abstract class LoginWithCredentialEvent implements LoginEvent {
  const factory LoginWithCredentialEvent(
          final String email, final String password) =
      _$LoginWithCredentialEventImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$LoginWithCredentialEventImplCopyWith<_$LoginWithCredentialEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginWithGoogleEventImplCopyWith<$Res> {
  factory _$$LoginWithGoogleEventImplCopyWith(_$LoginWithGoogleEventImpl value,
          $Res Function(_$LoginWithGoogleEventImpl) then) =
      __$$LoginWithGoogleEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginWithGoogleEventImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$LoginWithGoogleEventImpl>
    implements _$$LoginWithGoogleEventImplCopyWith<$Res> {
  __$$LoginWithGoogleEventImplCopyWithImpl(_$LoginWithGoogleEventImpl _value,
      $Res Function(_$LoginWithGoogleEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginWithGoogleEventImpl implements LoginWithGoogleEvent {
  const _$LoginWithGoogleEventImpl();

  @override
  String toString() {
    return 'LoginEvent.onLoginWithGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginWithGoogleEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password)
        onLoginWithCredential,
    required TResult Function() onLoginWithGoogle,
    required TResult Function() onReset,
  }) {
    return onLoginWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onLoginWithCredential,
    TResult? Function()? onLoginWithGoogle,
    TResult? Function()? onReset,
  }) {
    return onLoginWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onLoginWithCredential,
    TResult Function()? onLoginWithGoogle,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onLoginWithGoogle != null) {
      return onLoginWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginWithCredentialEvent value)
        onLoginWithCredential,
    required TResult Function(LoginWithGoogleEvent value) onLoginWithGoogle,
    required TResult Function(Reset value) onReset,
  }) {
    return onLoginWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult? Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) {
    return onLoginWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onLoginWithGoogle != null) {
      return onLoginWithGoogle(this);
    }
    return orElse();
  }
}

abstract class LoginWithGoogleEvent implements LoginEvent {
  const factory LoginWithGoogleEvent() = _$LoginWithGoogleEventImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'LoginEvent.onReset()';
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
    required TResult Function(String email, String password)
        onLoginWithCredential,
    required TResult Function() onLoginWithGoogle,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? onLoginWithCredential,
    TResult? Function()? onLoginWithGoogle,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? onLoginWithCredential,
    TResult Function()? onLoginWithGoogle,
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
    required TResult Function(LoginWithCredentialEvent value)
        onLoginWithCredential,
    required TResult Function(LoginWithGoogleEvent value) onLoginWithGoogle,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult? Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginWithCredentialEvent value)? onLoginWithCredential,
    TResult Function(LoginWithGoogleEvent value)? onLoginWithGoogle,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements LoginEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
    required TResult Function() registerWithGoogleLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
    TResult? Function()? registerWithGoogleLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
    TResult Function()? registerWithGoogleLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginErrorState value) error,
    required TResult Function(LoginLoadedState value) loaded,
    required TResult Function(RegisterWithGoogleLoadedState value)
        registerWithGoogleLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitialState value)? initial,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginErrorState value)? error,
    TResult? Function(LoginLoadedState value)? loaded,
    TResult? Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginErrorState value)? error,
    TResult Function(LoginLoadedState value)? loaded,
    TResult Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginInitialStateImplCopyWith<$Res> {
  factory _$$LoginInitialStateImplCopyWith(_$LoginInitialStateImpl value,
          $Res Function(_$LoginInitialStateImpl) then) =
      __$$LoginInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginInitialStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginInitialStateImpl>
    implements _$$LoginInitialStateImplCopyWith<$Res> {
  __$$LoginInitialStateImplCopyWithImpl(_$LoginInitialStateImpl _value,
      $Res Function(_$LoginInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginInitialStateImpl implements LoginInitialState {
  const _$LoginInitialStateImpl();

  @override
  String toString() {
    return 'LoginState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginInitialStateImpl);
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
    required TResult Function() registerWithGoogleLoaded,
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
    TResult? Function()? registerWithGoogleLoaded,
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
    TResult Function()? registerWithGoogleLoaded,
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
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginErrorState value) error,
    required TResult Function(LoginLoadedState value) loaded,
    required TResult Function(RegisterWithGoogleLoadedState value)
        registerWithGoogleLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitialState value)? initial,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginErrorState value)? error,
    TResult? Function(LoginLoadedState value)? loaded,
    TResult? Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginErrorState value)? error,
    TResult Function(LoginLoadedState value)? loaded,
    TResult Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LoginInitialState implements LoginState {
  const factory LoginInitialState() = _$LoginInitialStateImpl;
}

/// @nodoc
abstract class _$$LoginLoadingStateImplCopyWith<$Res> {
  factory _$$LoginLoadingStateImplCopyWith(_$LoginLoadingStateImpl value,
          $Res Function(_$LoginLoadingStateImpl) then) =
      __$$LoginLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginLoadingStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginLoadingStateImpl>
    implements _$$LoginLoadingStateImplCopyWith<$Res> {
  __$$LoginLoadingStateImplCopyWithImpl(_$LoginLoadingStateImpl _value,
      $Res Function(_$LoginLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginLoadingStateImpl implements LoginLoadingState {
  const _$LoginLoadingStateImpl();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadingStateImpl);
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
    required TResult Function() registerWithGoogleLoaded,
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
    TResult? Function()? registerWithGoogleLoaded,
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
    TResult Function()? registerWithGoogleLoaded,
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
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginErrorState value) error,
    required TResult Function(LoginLoadedState value) loaded,
    required TResult Function(RegisterWithGoogleLoadedState value)
        registerWithGoogleLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitialState value)? initial,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginErrorState value)? error,
    TResult? Function(LoginLoadedState value)? loaded,
    TResult? Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginErrorState value)? error,
    TResult Function(LoginLoadedState value)? loaded,
    TResult Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoginLoadingState implements LoginState {
  const factory LoginLoadingState() = _$LoginLoadingStateImpl;
}

/// @nodoc
abstract class _$$LoginErrorStateImplCopyWith<$Res> {
  factory _$$LoginErrorStateImplCopyWith(_$LoginErrorStateImpl value,
          $Res Function(_$LoginErrorStateImpl) then) =
      __$$LoginErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LoginErrorStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginErrorStateImpl>
    implements _$$LoginErrorStateImplCopyWith<$Res> {
  __$$LoginErrorStateImplCopyWithImpl(
      _$LoginErrorStateImpl _value, $Res Function(_$LoginErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LoginErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginErrorStateImpl implements LoginErrorState {
  const _$LoginErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LoginState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginErrorStateImplCopyWith<_$LoginErrorStateImpl> get copyWith =>
      __$$LoginErrorStateImplCopyWithImpl<_$LoginErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
    required TResult Function() registerWithGoogleLoaded,
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
    TResult? Function()? registerWithGoogleLoaded,
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
    TResult Function()? registerWithGoogleLoaded,
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
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginErrorState value) error,
    required TResult Function(LoginLoadedState value) loaded,
    required TResult Function(RegisterWithGoogleLoadedState value)
        registerWithGoogleLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitialState value)? initial,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginErrorState value)? error,
    TResult? Function(LoginLoadedState value)? loaded,
    TResult? Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginErrorState value)? error,
    TResult Function(LoginLoadedState value)? loaded,
    TResult Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LoginErrorState implements LoginState {
  const factory LoginErrorState(final String message) = _$LoginErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LoginErrorStateImplCopyWith<_$LoginErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginLoadedStateImplCopyWith<$Res> {
  factory _$$LoginLoadedStateImplCopyWith(_$LoginLoadedStateImpl value,
          $Res Function(_$LoginLoadedStateImpl) then) =
      __$$LoginLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoginLoadedStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$LoginLoadedStateImpl>
    implements _$$LoginLoadedStateImplCopyWith<$Res> {
  __$$LoginLoadedStateImplCopyWithImpl(_$LoginLoadedStateImpl _value,
      $Res Function(_$LoginLoadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoginLoadedStateImpl implements LoginLoadedState {
  const _$LoginLoadedStateImpl();

  @override
  String toString() {
    return 'LoginState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoginLoadedStateImpl);
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
    required TResult Function() registerWithGoogleLoaded,
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
    TResult? Function()? registerWithGoogleLoaded,
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
    TResult Function()? registerWithGoogleLoaded,
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
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginErrorState value) error,
    required TResult Function(LoginLoadedState value) loaded,
    required TResult Function(RegisterWithGoogleLoadedState value)
        registerWithGoogleLoaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitialState value)? initial,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginErrorState value)? error,
    TResult? Function(LoginLoadedState value)? loaded,
    TResult? Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginErrorState value)? error,
    TResult Function(LoginLoadedState value)? loaded,
    TResult Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoginLoadedState implements LoginState {
  const factory LoginLoadedState() = _$LoginLoadedStateImpl;
}

/// @nodoc
abstract class _$$RegisterWithGoogleLoadedStateImplCopyWith<$Res> {
  factory _$$RegisterWithGoogleLoadedStateImplCopyWith(
          _$RegisterWithGoogleLoadedStateImpl value,
          $Res Function(_$RegisterWithGoogleLoadedStateImpl) then) =
      __$$RegisterWithGoogleLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterWithGoogleLoadedStateImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$RegisterWithGoogleLoadedStateImpl>
    implements _$$RegisterWithGoogleLoadedStateImplCopyWith<$Res> {
  __$$RegisterWithGoogleLoadedStateImplCopyWithImpl(
      _$RegisterWithGoogleLoadedStateImpl _value,
      $Res Function(_$RegisterWithGoogleLoadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterWithGoogleLoadedStateImpl
    implements RegisterWithGoogleLoadedState {
  const _$RegisterWithGoogleLoadedStateImpl();

  @override
  String toString() {
    return 'LoginState.registerWithGoogleLoaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithGoogleLoadedStateImpl);
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
    required TResult Function() registerWithGoogleLoaded,
  }) {
    return registerWithGoogleLoaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
    TResult? Function()? registerWithGoogleLoaded,
  }) {
    return registerWithGoogleLoaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
    TResult Function()? registerWithGoogleLoaded,
    required TResult orElse(),
  }) {
    if (registerWithGoogleLoaded != null) {
      return registerWithGoogleLoaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoginInitialState value) initial,
    required TResult Function(LoginLoadingState value) loading,
    required TResult Function(LoginErrorState value) error,
    required TResult Function(LoginLoadedState value) loaded,
    required TResult Function(RegisterWithGoogleLoadedState value)
        registerWithGoogleLoaded,
  }) {
    return registerWithGoogleLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoginInitialState value)? initial,
    TResult? Function(LoginLoadingState value)? loading,
    TResult? Function(LoginErrorState value)? error,
    TResult? Function(LoginLoadedState value)? loaded,
    TResult? Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
  }) {
    return registerWithGoogleLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoginInitialState value)? initial,
    TResult Function(LoginLoadingState value)? loading,
    TResult Function(LoginErrorState value)? error,
    TResult Function(LoginLoadedState value)? loaded,
    TResult Function(RegisterWithGoogleLoadedState value)?
        registerWithGoogleLoaded,
    required TResult orElse(),
  }) {
    if (registerWithGoogleLoaded != null) {
      return registerWithGoogleLoaded(this);
    }
    return orElse();
  }
}

abstract class RegisterWithGoogleLoadedState implements LoginState {
  const factory RegisterWithGoogleLoadedState() =
      _$RegisterWithGoogleLoadedStateImpl;
}
