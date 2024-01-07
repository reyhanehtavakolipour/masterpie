// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_user_credentials_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetUserCredentialsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetUserCredential,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetUserCredential,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetUserCredential,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserCredentials value) onGetUserCredential,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserCredentials value)? onGetUserCredential,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserCredentials value)? onGetUserCredential,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserCredentialsEventCopyWith<$Res> {
  factory $GetUserCredentialsEventCopyWith(GetUserCredentialsEvent value,
          $Res Function(GetUserCredentialsEvent) then) =
      _$GetUserCredentialsEventCopyWithImpl<$Res, GetUserCredentialsEvent>;
}

/// @nodoc
class _$GetUserCredentialsEventCopyWithImpl<$Res,
        $Val extends GetUserCredentialsEvent>
    implements $GetUserCredentialsEventCopyWith<$Res> {
  _$GetUserCredentialsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUserCredentialsCopyWith<$Res> {
  factory _$$GetUserCredentialsCopyWith(_$GetUserCredentials value,
          $Res Function(_$GetUserCredentials) then) =
      __$$GetUserCredentialsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserCredentialsCopyWithImpl<$Res>
    extends _$GetUserCredentialsEventCopyWithImpl<$Res, _$GetUserCredentials>
    implements _$$GetUserCredentialsCopyWith<$Res> {
  __$$GetUserCredentialsCopyWithImpl(
      _$GetUserCredentials _value, $Res Function(_$GetUserCredentials) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserCredentials implements GetUserCredentials {
  const _$GetUserCredentials();

  @override
  String toString() {
    return 'GetUserCredentialsEvent.onGetUserCredential()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserCredentials);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetUserCredential,
  }) {
    return onGetUserCredential();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetUserCredential,
  }) {
    return onGetUserCredential?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetUserCredential,
    required TResult orElse(),
  }) {
    if (onGetUserCredential != null) {
      return onGetUserCredential();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserCredentials value) onGetUserCredential,
  }) {
    return onGetUserCredential(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserCredentials value)? onGetUserCredential,
  }) {
    return onGetUserCredential?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserCredentials value)? onGetUserCredential,
    required TResult orElse(),
  }) {
    if (onGetUserCredential != null) {
      return onGetUserCredential(this);
    }
    return orElse();
  }
}

abstract class GetUserCredentials implements GetUserCredentialsEvent {
  const factory GetUserCredentials() = _$GetUserCredentials;
}

/// @nodoc
mixin _$GetUserCredentialsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserCredentials userCredentials) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserCredentials userCredentials)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserCredentials userCredentials)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserCredentialsInitialState value) initial,
    required TResult Function(GetUserCredentialsLoadingState value) loading,
    required TResult Function(GetUserCredentialsErrorState value) error,
    required TResult Function(GetUserCredentialsLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserCredentialsInitialState value)? initial,
    TResult? Function(GetUserCredentialsLoadingState value)? loading,
    TResult? Function(GetUserCredentialsErrorState value)? error,
    TResult? Function(GetUserCredentialsLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserCredentialsInitialState value)? initial,
    TResult Function(GetUserCredentialsLoadingState value)? loading,
    TResult Function(GetUserCredentialsErrorState value)? error,
    TResult Function(GetUserCredentialsLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetUserCredentialsStateCopyWith<$Res> {
  factory $GetUserCredentialsStateCopyWith(GetUserCredentialsState value,
          $Res Function(GetUserCredentialsState) then) =
      _$GetUserCredentialsStateCopyWithImpl<$Res, GetUserCredentialsState>;
}

/// @nodoc
class _$GetUserCredentialsStateCopyWithImpl<$Res,
        $Val extends GetUserCredentialsState>
    implements $GetUserCredentialsStateCopyWith<$Res> {
  _$GetUserCredentialsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetUserCredentialsInitialStateCopyWith<$Res> {
  factory _$$GetUserCredentialsInitialStateCopyWith(
          _$GetUserCredentialsInitialState value,
          $Res Function(_$GetUserCredentialsInitialState) then) =
      __$$GetUserCredentialsInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserCredentialsInitialStateCopyWithImpl<$Res>
    extends _$GetUserCredentialsStateCopyWithImpl<$Res,
        _$GetUserCredentialsInitialState>
    implements _$$GetUserCredentialsInitialStateCopyWith<$Res> {
  __$$GetUserCredentialsInitialStateCopyWithImpl(
      _$GetUserCredentialsInitialState _value,
      $Res Function(_$GetUserCredentialsInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserCredentialsInitialState
    implements GetUserCredentialsInitialState {
  const _$GetUserCredentialsInitialState();

  @override
  String toString() {
    return 'GetUserCredentialsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserCredentialsInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserCredentials userCredentials) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserCredentials userCredentials)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserCredentials userCredentials)? loaded,
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
    required TResult Function(GetUserCredentialsInitialState value) initial,
    required TResult Function(GetUserCredentialsLoadingState value) loading,
    required TResult Function(GetUserCredentialsErrorState value) error,
    required TResult Function(GetUserCredentialsLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserCredentialsInitialState value)? initial,
    TResult? Function(GetUserCredentialsLoadingState value)? loading,
    TResult? Function(GetUserCredentialsErrorState value)? error,
    TResult? Function(GetUserCredentialsLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserCredentialsInitialState value)? initial,
    TResult Function(GetUserCredentialsLoadingState value)? loading,
    TResult Function(GetUserCredentialsErrorState value)? error,
    TResult Function(GetUserCredentialsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GetUserCredentialsInitialState
    implements GetUserCredentialsState {
  const factory GetUserCredentialsInitialState() =
      _$GetUserCredentialsInitialState;
}

/// @nodoc
abstract class _$$GetUserCredentialsLoadingStateCopyWith<$Res> {
  factory _$$GetUserCredentialsLoadingStateCopyWith(
          _$GetUserCredentialsLoadingState value,
          $Res Function(_$GetUserCredentialsLoadingState) then) =
      __$$GetUserCredentialsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserCredentialsLoadingStateCopyWithImpl<$Res>
    extends _$GetUserCredentialsStateCopyWithImpl<$Res,
        _$GetUserCredentialsLoadingState>
    implements _$$GetUserCredentialsLoadingStateCopyWith<$Res> {
  __$$GetUserCredentialsLoadingStateCopyWithImpl(
      _$GetUserCredentialsLoadingState _value,
      $Res Function(_$GetUserCredentialsLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserCredentialsLoadingState
    implements GetUserCredentialsLoadingState {
  const _$GetUserCredentialsLoadingState();

  @override
  String toString() {
    return 'GetUserCredentialsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserCredentialsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserCredentials userCredentials) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserCredentials userCredentials)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserCredentials userCredentials)? loaded,
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
    required TResult Function(GetUserCredentialsInitialState value) initial,
    required TResult Function(GetUserCredentialsLoadingState value) loading,
    required TResult Function(GetUserCredentialsErrorState value) error,
    required TResult Function(GetUserCredentialsLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserCredentialsInitialState value)? initial,
    TResult? Function(GetUserCredentialsLoadingState value)? loading,
    TResult? Function(GetUserCredentialsErrorState value)? error,
    TResult? Function(GetUserCredentialsLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserCredentialsInitialState value)? initial,
    TResult Function(GetUserCredentialsLoadingState value)? loading,
    TResult Function(GetUserCredentialsErrorState value)? error,
    TResult Function(GetUserCredentialsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetUserCredentialsLoadingState
    implements GetUserCredentialsState {
  const factory GetUserCredentialsLoadingState() =
      _$GetUserCredentialsLoadingState;
}

/// @nodoc
abstract class _$$GetUserCredentialsErrorStateCopyWith<$Res> {
  factory _$$GetUserCredentialsErrorStateCopyWith(
          _$GetUserCredentialsErrorState value,
          $Res Function(_$GetUserCredentialsErrorState) then) =
      __$$GetUserCredentialsErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GetUserCredentialsErrorStateCopyWithImpl<$Res>
    extends _$GetUserCredentialsStateCopyWithImpl<$Res,
        _$GetUserCredentialsErrorState>
    implements _$$GetUserCredentialsErrorStateCopyWith<$Res> {
  __$$GetUserCredentialsErrorStateCopyWithImpl(
      _$GetUserCredentialsErrorState _value,
      $Res Function(_$GetUserCredentialsErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GetUserCredentialsErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetUserCredentialsErrorState implements GetUserCredentialsErrorState {
  const _$GetUserCredentialsErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GetUserCredentialsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserCredentialsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserCredentialsErrorStateCopyWith<_$GetUserCredentialsErrorState>
      get copyWith => __$$GetUserCredentialsErrorStateCopyWithImpl<
          _$GetUserCredentialsErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserCredentials userCredentials) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserCredentials userCredentials)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserCredentials userCredentials)? loaded,
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
    required TResult Function(GetUserCredentialsInitialState value) initial,
    required TResult Function(GetUserCredentialsLoadingState value) loading,
    required TResult Function(GetUserCredentialsErrorState value) error,
    required TResult Function(GetUserCredentialsLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserCredentialsInitialState value)? initial,
    TResult? Function(GetUserCredentialsLoadingState value)? loading,
    TResult? Function(GetUserCredentialsErrorState value)? error,
    TResult? Function(GetUserCredentialsLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserCredentialsInitialState value)? initial,
    TResult Function(GetUserCredentialsLoadingState value)? loading,
    TResult Function(GetUserCredentialsErrorState value)? error,
    TResult Function(GetUserCredentialsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetUserCredentialsErrorState implements GetUserCredentialsState {
  const factory GetUserCredentialsErrorState(final String message) =
      _$GetUserCredentialsErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$GetUserCredentialsErrorStateCopyWith<_$GetUserCredentialsErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserCredentialsLoadedStateCopyWith<$Res> {
  factory _$$GetUserCredentialsLoadedStateCopyWith(
          _$GetUserCredentialsLoadedState value,
          $Res Function(_$GetUserCredentialsLoadedState) then) =
      __$$GetUserCredentialsLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserCredentials userCredentials});

  $UserCredentialsCopyWith<$Res> get userCredentials;
}

/// @nodoc
class __$$GetUserCredentialsLoadedStateCopyWithImpl<$Res>
    extends _$GetUserCredentialsStateCopyWithImpl<$Res,
        _$GetUserCredentialsLoadedState>
    implements _$$GetUserCredentialsLoadedStateCopyWith<$Res> {
  __$$GetUserCredentialsLoadedStateCopyWithImpl(
      _$GetUserCredentialsLoadedState _value,
      $Res Function(_$GetUserCredentialsLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userCredentials = null,
  }) {
    return _then(_$GetUserCredentialsLoadedState(
      null == userCredentials
          ? _value.userCredentials
          : userCredentials // ignore: cast_nullable_to_non_nullable
              as UserCredentials,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCredentialsCopyWith<$Res> get userCredentials {
    return $UserCredentialsCopyWith<$Res>(_value.userCredentials, (value) {
      return _then(_value.copyWith(userCredentials: value));
    });
  }
}

/// @nodoc

class _$GetUserCredentialsLoadedState implements GetUserCredentialsLoadedState {
  const _$GetUserCredentialsLoadedState(this.userCredentials);

  @override
  final UserCredentials userCredentials;

  @override
  String toString() {
    return 'GetUserCredentialsState.loaded(userCredentials: $userCredentials)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetUserCredentialsLoadedState &&
            (identical(other.userCredentials, userCredentials) ||
                other.userCredentials == userCredentials));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userCredentials);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetUserCredentialsLoadedStateCopyWith<_$GetUserCredentialsLoadedState>
      get copyWith => __$$GetUserCredentialsLoadedStateCopyWithImpl<
          _$GetUserCredentialsLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserCredentials userCredentials) loaded,
  }) {
    return loaded(userCredentials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserCredentials userCredentials)? loaded,
  }) {
    return loaded?.call(userCredentials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserCredentials userCredentials)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userCredentials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetUserCredentialsInitialState value) initial,
    required TResult Function(GetUserCredentialsLoadingState value) loading,
    required TResult Function(GetUserCredentialsErrorState value) error,
    required TResult Function(GetUserCredentialsLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetUserCredentialsInitialState value)? initial,
    TResult? Function(GetUserCredentialsLoadingState value)? loading,
    TResult? Function(GetUserCredentialsErrorState value)? error,
    TResult? Function(GetUserCredentialsLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetUserCredentialsInitialState value)? initial,
    TResult Function(GetUserCredentialsLoadingState value)? loading,
    TResult Function(GetUserCredentialsErrorState value)? error,
    TResult Function(GetUserCredentialsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GetUserCredentialsLoadedState
    implements GetUserCredentialsState {
  const factory GetUserCredentialsLoadedState(
      final UserCredentials userCredentials) = _$GetUserCredentialsLoadedState;

  UserCredentials get userCredentials;
  @JsonKey(ignore: true)
  _$$GetUserCredentialsLoadedStateCopyWith<_$GetUserCredentialsLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}
