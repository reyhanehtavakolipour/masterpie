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
abstract class _$$RegisterWithCredentialEventImplCopyWith<$Res> {
  factory _$$RegisterWithCredentialEventImplCopyWith(
          _$RegisterWithCredentialEventImpl value,
          $Res Function(_$RegisterWithCredentialEventImpl) then) =
      __$$RegisterWithCredentialEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$RegisterWithCredentialEventImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterWithCredentialEventImpl>
    implements _$$RegisterWithCredentialEventImplCopyWith<$Res> {
  __$$RegisterWithCredentialEventImplCopyWithImpl(
      _$RegisterWithCredentialEventImpl _value,
      $Res Function(_$RegisterWithCredentialEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$RegisterWithCredentialEventImpl(
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

class _$RegisterWithCredentialEventImpl implements RegisterWithCredentialEvent {
  const _$RegisterWithCredentialEventImpl(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'RegisterEvent.onRegisterWithCredential(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithCredentialEventImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterWithCredentialEventImplCopyWith<_$RegisterWithCredentialEventImpl>
      get copyWith => __$$RegisterWithCredentialEventImplCopyWithImpl<
          _$RegisterWithCredentialEventImpl>(this, _$identity);

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
      _$RegisterWithCredentialEventImpl;

  String get email;
  String get password;
  @JsonKey(ignore: true)
  _$$RegisterWithCredentialEventImplCopyWith<_$RegisterWithCredentialEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterWithGoogleEventImplCopyWith<$Res> {
  factory _$$RegisterWithGoogleEventImplCopyWith(
          _$RegisterWithGoogleEventImpl value,
          $Res Function(_$RegisterWithGoogleEventImpl) then) =
      __$$RegisterWithGoogleEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterWithGoogleEventImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$RegisterWithGoogleEventImpl>
    implements _$$RegisterWithGoogleEventImplCopyWith<$Res> {
  __$$RegisterWithGoogleEventImplCopyWithImpl(
      _$RegisterWithGoogleEventImpl _value,
      $Res Function(_$RegisterWithGoogleEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterWithGoogleEventImpl implements RegisterWithGoogleEvent {
  const _$RegisterWithGoogleEventImpl();

  @override
  String toString() {
    return 'RegisterEvent.onRegisterWithGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterWithGoogleEventImpl);
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
  const factory RegisterWithGoogleEvent() = _$RegisterWithGoogleEventImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$RegisterEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'RegisterEvent.onReset()';
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
  const factory Reset() = _$ResetImpl;
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
abstract class _$$RegisterInitialStateImplCopyWith<$Res> {
  factory _$$RegisterInitialStateImplCopyWith(_$RegisterInitialStateImpl value,
          $Res Function(_$RegisterInitialStateImpl) then) =
      __$$RegisterInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterInitialStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterInitialStateImpl>
    implements _$$RegisterInitialStateImplCopyWith<$Res> {
  __$$RegisterInitialStateImplCopyWithImpl(_$RegisterInitialStateImpl _value,
      $Res Function(_$RegisterInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterInitialStateImpl implements RegisterInitialState {
  const _$RegisterInitialStateImpl();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterInitialStateImpl);
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
  const factory RegisterInitialState() = _$RegisterInitialStateImpl;
}

/// @nodoc
abstract class _$$RegisterLoadingStateImplCopyWith<$Res> {
  factory _$$RegisterLoadingStateImplCopyWith(_$RegisterLoadingStateImpl value,
          $Res Function(_$RegisterLoadingStateImpl) then) =
      __$$RegisterLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RegisterLoadingStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterLoadingStateImpl>
    implements _$$RegisterLoadingStateImplCopyWith<$Res> {
  __$$RegisterLoadingStateImplCopyWithImpl(_$RegisterLoadingStateImpl _value,
      $Res Function(_$RegisterLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RegisterLoadingStateImpl implements RegisterLoadingState {
  const _$RegisterLoadingStateImpl();

  @override
  String toString() {
    return 'RegisterState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadingStateImpl);
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
  const factory RegisterLoadingState() = _$RegisterLoadingStateImpl;
}

/// @nodoc
abstract class _$$RegisterErrorStateImplCopyWith<$Res> {
  factory _$$RegisterErrorStateImplCopyWith(_$RegisterErrorStateImpl value,
          $Res Function(_$RegisterErrorStateImpl) then) =
      __$$RegisterErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RegisterErrorStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterErrorStateImpl>
    implements _$$RegisterErrorStateImplCopyWith<$Res> {
  __$$RegisterErrorStateImplCopyWithImpl(_$RegisterErrorStateImpl _value,
      $Res Function(_$RegisterErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RegisterErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterErrorStateImpl implements RegisterErrorState {
  const _$RegisterErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RegisterState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterErrorStateImplCopyWith<_$RegisterErrorStateImpl> get copyWith =>
      __$$RegisterErrorStateImplCopyWithImpl<_$RegisterErrorStateImpl>(
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
  const factory RegisterErrorState(final String message) =
      _$RegisterErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RegisterErrorStateImplCopyWith<_$RegisterErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RegisterLoadedStateImplCopyWith<$Res> {
  factory _$$RegisterLoadedStateImplCopyWith(_$RegisterLoadedStateImpl value,
          $Res Function(_$RegisterLoadedStateImpl) then) =
      __$$RegisterLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$RegisterLoadedStateImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$RegisterLoadedStateImpl>
    implements _$$RegisterLoadedStateImplCopyWith<$Res> {
  __$$RegisterLoadedStateImplCopyWithImpl(_$RegisterLoadedStateImpl _value,
      $Res Function(_$RegisterLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$RegisterLoadedStateImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterLoadedStateImpl implements RegisterLoadedState {
  const _$RegisterLoadedStateImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'RegisterState.loaded(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterLoadedStateImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterLoadedStateImplCopyWith<_$RegisterLoadedStateImpl> get copyWith =>
      __$$RegisterLoadedStateImplCopyWithImpl<_$RegisterLoadedStateImpl>(
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
  const factory RegisterLoadedState(final String email) =
      _$RegisterLoadedStateImpl;

  String get email;
  @JsonKey(ignore: true)
  _$$RegisterLoadedStateImplCopyWith<_$RegisterLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
