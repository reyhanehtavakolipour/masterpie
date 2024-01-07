// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_logged_foods_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetLoggedFoodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) onGetLoggedFoods,
    required TResult Function(String date) onGetImmediateLoggedFoods,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String date)? onGetLoggedFoods,
    TResult? Function(String date)? onGetImmediateLoggedFoods,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? onGetLoggedFoods,
    TResult Function(String date)? onGetImmediateLoggedFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllLoggedFoodsEvent value) onGetLoggedFoods,
    required TResult Function(GetImmediateLoggedFoodsEvent value)
        onGetImmediateLoggedFoods,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult? Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLoggedFoodsEventCopyWith<$Res> {
  factory $GetLoggedFoodsEventCopyWith(
          GetLoggedFoodsEvent value, $Res Function(GetLoggedFoodsEvent) then) =
      _$GetLoggedFoodsEventCopyWithImpl<$Res, GetLoggedFoodsEvent>;
}

/// @nodoc
class _$GetLoggedFoodsEventCopyWithImpl<$Res, $Val extends GetLoggedFoodsEvent>
    implements $GetLoggedFoodsEventCopyWith<$Res> {
  _$GetLoggedFoodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllLoggedFoodsEventCopyWith<$Res> {
  factory _$$GetAllLoggedFoodsEventCopyWith(_$GetAllLoggedFoodsEvent value,
          $Res Function(_$GetAllLoggedFoodsEvent) then) =
      __$$GetAllLoggedFoodsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String date});
}

/// @nodoc
class __$$GetAllLoggedFoodsEventCopyWithImpl<$Res>
    extends _$GetLoggedFoodsEventCopyWithImpl<$Res, _$GetAllLoggedFoodsEvent>
    implements _$$GetAllLoggedFoodsEventCopyWith<$Res> {
  __$$GetAllLoggedFoodsEventCopyWithImpl(_$GetAllLoggedFoodsEvent _value,
      $Res Function(_$GetAllLoggedFoodsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GetAllLoggedFoodsEvent(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAllLoggedFoodsEvent implements GetAllLoggedFoodsEvent {
  const _$GetAllLoggedFoodsEvent(this.date);

  @override
  final String date;

  @override
  String toString() {
    return 'GetLoggedFoodsEvent.onGetLoggedFoods(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllLoggedFoodsEvent &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllLoggedFoodsEventCopyWith<_$GetAllLoggedFoodsEvent> get copyWith =>
      __$$GetAllLoggedFoodsEventCopyWithImpl<_$GetAllLoggedFoodsEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) onGetLoggedFoods,
    required TResult Function(String date) onGetImmediateLoggedFoods,
    required TResult Function() onReset,
  }) {
    return onGetLoggedFoods(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String date)? onGetLoggedFoods,
    TResult? Function(String date)? onGetImmediateLoggedFoods,
    TResult? Function()? onReset,
  }) {
    return onGetLoggedFoods?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? onGetLoggedFoods,
    TResult Function(String date)? onGetImmediateLoggedFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetLoggedFoods != null) {
      return onGetLoggedFoods(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllLoggedFoodsEvent value) onGetLoggedFoods,
    required TResult Function(GetImmediateLoggedFoodsEvent value)
        onGetImmediateLoggedFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetLoggedFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult? Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetLoggedFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetLoggedFoods != null) {
      return onGetLoggedFoods(this);
    }
    return orElse();
  }
}

abstract class GetAllLoggedFoodsEvent implements GetLoggedFoodsEvent {
  const factory GetAllLoggedFoodsEvent(final String date) =
      _$GetAllLoggedFoodsEvent;

  String get date;
  @JsonKey(ignore: true)
  _$$GetAllLoggedFoodsEventCopyWith<_$GetAllLoggedFoodsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetImmediateLoggedFoodsEventCopyWith<$Res> {
  factory _$$GetImmediateLoggedFoodsEventCopyWith(
          _$GetImmediateLoggedFoodsEvent value,
          $Res Function(_$GetImmediateLoggedFoodsEvent) then) =
      __$$GetImmediateLoggedFoodsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String date});
}

/// @nodoc
class __$$GetImmediateLoggedFoodsEventCopyWithImpl<$Res>
    extends _$GetLoggedFoodsEventCopyWithImpl<$Res,
        _$GetImmediateLoggedFoodsEvent>
    implements _$$GetImmediateLoggedFoodsEventCopyWith<$Res> {
  __$$GetImmediateLoggedFoodsEventCopyWithImpl(
      _$GetImmediateLoggedFoodsEvent _value,
      $Res Function(_$GetImmediateLoggedFoodsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GetImmediateLoggedFoodsEvent(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetImmediateLoggedFoodsEvent implements GetImmediateLoggedFoodsEvent {
  const _$GetImmediateLoggedFoodsEvent(this.date);

  @override
  final String date;

  @override
  String toString() {
    return 'GetLoggedFoodsEvent.onGetImmediateLoggedFoods(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetImmediateLoggedFoodsEvent &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetImmediateLoggedFoodsEventCopyWith<_$GetImmediateLoggedFoodsEvent>
      get copyWith => __$$GetImmediateLoggedFoodsEventCopyWithImpl<
          _$GetImmediateLoggedFoodsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) onGetLoggedFoods,
    required TResult Function(String date) onGetImmediateLoggedFoods,
    required TResult Function() onReset,
  }) {
    return onGetImmediateLoggedFoods(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String date)? onGetLoggedFoods,
    TResult? Function(String date)? onGetImmediateLoggedFoods,
    TResult? Function()? onReset,
  }) {
    return onGetImmediateLoggedFoods?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? onGetLoggedFoods,
    TResult Function(String date)? onGetImmediateLoggedFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetImmediateLoggedFoods != null) {
      return onGetImmediateLoggedFoods(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllLoggedFoodsEvent value) onGetLoggedFoods,
    required TResult Function(GetImmediateLoggedFoodsEvent value)
        onGetImmediateLoggedFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetImmediateLoggedFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult? Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetImmediateLoggedFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetImmediateLoggedFoods != null) {
      return onGetImmediateLoggedFoods(this);
    }
    return orElse();
  }
}

abstract class GetImmediateLoggedFoodsEvent implements GetLoggedFoodsEvent {
  const factory GetImmediateLoggedFoodsEvent(final String date) =
      _$GetImmediateLoggedFoodsEvent;

  String get date;
  @JsonKey(ignore: true)
  _$$GetImmediateLoggedFoodsEventCopyWith<_$GetImmediateLoggedFoodsEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$GetLoggedFoodsEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'GetLoggedFoodsEvent.onReset()';
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
    required TResult Function(String date) onGetLoggedFoods,
    required TResult Function(String date) onGetImmediateLoggedFoods,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String date)? onGetLoggedFoods,
    TResult? Function(String date)? onGetImmediateLoggedFoods,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? onGetLoggedFoods,
    TResult Function(String date)? onGetImmediateLoggedFoods,
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
    required TResult Function(GetAllLoggedFoodsEvent value) onGetLoggedFoods,
    required TResult Function(GetImmediateLoggedFoodsEvent value)
        onGetImmediateLoggedFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult? Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllLoggedFoodsEvent value)? onGetLoggedFoods,
    TResult Function(GetImmediateLoggedFoodsEvent value)?
        onGetImmediateLoggedFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements GetLoggedFoodsEvent {
  const factory Reset() = _$Reset;
}

/// @nodoc
mixin _$GetLoggedFoodsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(LoggedFoods loggedFoods) loaded,
    required TResult Function(LoggedFoods loggedFoods) loadedImmediateResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(LoggedFoods loggedFoods)? loaded,
    TResult? Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(LoggedFoods loggedFoods)? loaded,
    TResult Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLoggedFoodsInitialState value) initial,
    required TResult Function(GetLoggedFoodsLoadingState value) loading,
    required TResult Function(GetLoggedFoodsErrorState value) error,
    required TResult Function(GetLoggedFoodsLoadedState value) loaded,
    required TResult Function(GetImmediateLoggedFoodsState value)
        loadedImmediateResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoggedFoodsInitialState value)? initial,
    TResult? Function(GetLoggedFoodsLoadingState value)? loading,
    TResult? Function(GetLoggedFoodsErrorState value)? error,
    TResult? Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult? Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoggedFoodsInitialState value)? initial,
    TResult Function(GetLoggedFoodsLoadingState value)? loading,
    TResult Function(GetLoggedFoodsErrorState value)? error,
    TResult Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetLoggedFoodsStateCopyWith<$Res> {
  factory $GetLoggedFoodsStateCopyWith(
          GetLoggedFoodsState value, $Res Function(GetLoggedFoodsState) then) =
      _$GetLoggedFoodsStateCopyWithImpl<$Res, GetLoggedFoodsState>;
}

/// @nodoc
class _$GetLoggedFoodsStateCopyWithImpl<$Res, $Val extends GetLoggedFoodsState>
    implements $GetLoggedFoodsStateCopyWith<$Res> {
  _$GetLoggedFoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetLoggedFoodsInitialStateCopyWith<$Res> {
  factory _$$GetLoggedFoodsInitialStateCopyWith(
          _$GetLoggedFoodsInitialState value,
          $Res Function(_$GetLoggedFoodsInitialState) then) =
      __$$GetLoggedFoodsInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoggedFoodsInitialStateCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetLoggedFoodsInitialState>
    implements _$$GetLoggedFoodsInitialStateCopyWith<$Res> {
  __$$GetLoggedFoodsInitialStateCopyWithImpl(
      _$GetLoggedFoodsInitialState _value,
      $Res Function(_$GetLoggedFoodsInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLoggedFoodsInitialState implements GetLoggedFoodsInitialState {
  const _$GetLoggedFoodsInitialState();

  @override
  String toString() {
    return 'GetLoggedFoodsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(LoggedFoods loggedFoods) loaded,
    required TResult Function(LoggedFoods loggedFoods) loadedImmediateResponse,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(LoggedFoods loggedFoods)? loaded,
    TResult? Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(LoggedFoods loggedFoods)? loaded,
    TResult Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
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
    required TResult Function(GetLoggedFoodsInitialState value) initial,
    required TResult Function(GetLoggedFoodsLoadingState value) loading,
    required TResult Function(GetLoggedFoodsErrorState value) error,
    required TResult Function(GetLoggedFoodsLoadedState value) loaded,
    required TResult Function(GetImmediateLoggedFoodsState value)
        loadedImmediateResponse,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoggedFoodsInitialState value)? initial,
    TResult? Function(GetLoggedFoodsLoadingState value)? loading,
    TResult? Function(GetLoggedFoodsErrorState value)? error,
    TResult? Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult? Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoggedFoodsInitialState value)? initial,
    TResult Function(GetLoggedFoodsLoadingState value)? loading,
    TResult Function(GetLoggedFoodsErrorState value)? error,
    TResult Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GetLoggedFoodsInitialState implements GetLoggedFoodsState {
  const factory GetLoggedFoodsInitialState() = _$GetLoggedFoodsInitialState;
}

/// @nodoc
abstract class _$$GetLoggedFoodsLoadingStateCopyWith<$Res> {
  factory _$$GetLoggedFoodsLoadingStateCopyWith(
          _$GetLoggedFoodsLoadingState value,
          $Res Function(_$GetLoggedFoodsLoadingState) then) =
      __$$GetLoggedFoodsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoggedFoodsLoadingStateCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetLoggedFoodsLoadingState>
    implements _$$GetLoggedFoodsLoadingStateCopyWith<$Res> {
  __$$GetLoggedFoodsLoadingStateCopyWithImpl(
      _$GetLoggedFoodsLoadingState _value,
      $Res Function(_$GetLoggedFoodsLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLoggedFoodsLoadingState implements GetLoggedFoodsLoadingState {
  const _$GetLoggedFoodsLoadingState();

  @override
  String toString() {
    return 'GetLoggedFoodsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(LoggedFoods loggedFoods) loaded,
    required TResult Function(LoggedFoods loggedFoods) loadedImmediateResponse,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(LoggedFoods loggedFoods)? loaded,
    TResult? Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(LoggedFoods loggedFoods)? loaded,
    TResult Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
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
    required TResult Function(GetLoggedFoodsInitialState value) initial,
    required TResult Function(GetLoggedFoodsLoadingState value) loading,
    required TResult Function(GetLoggedFoodsErrorState value) error,
    required TResult Function(GetLoggedFoodsLoadedState value) loaded,
    required TResult Function(GetImmediateLoggedFoodsState value)
        loadedImmediateResponse,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoggedFoodsInitialState value)? initial,
    TResult? Function(GetLoggedFoodsLoadingState value)? loading,
    TResult? Function(GetLoggedFoodsErrorState value)? error,
    TResult? Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult? Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoggedFoodsInitialState value)? initial,
    TResult Function(GetLoggedFoodsLoadingState value)? loading,
    TResult Function(GetLoggedFoodsErrorState value)? error,
    TResult Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetLoggedFoodsLoadingState implements GetLoggedFoodsState {
  const factory GetLoggedFoodsLoadingState() = _$GetLoggedFoodsLoadingState;
}

/// @nodoc
abstract class _$$GetLoggedFoodsErrorStateCopyWith<$Res> {
  factory _$$GetLoggedFoodsErrorStateCopyWith(_$GetLoggedFoodsErrorState value,
          $Res Function(_$GetLoggedFoodsErrorState) then) =
      __$$GetLoggedFoodsErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GetLoggedFoodsErrorStateCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res, _$GetLoggedFoodsErrorState>
    implements _$$GetLoggedFoodsErrorStateCopyWith<$Res> {
  __$$GetLoggedFoodsErrorStateCopyWithImpl(_$GetLoggedFoodsErrorState _value,
      $Res Function(_$GetLoggedFoodsErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GetLoggedFoodsErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetLoggedFoodsErrorState implements GetLoggedFoodsErrorState {
  const _$GetLoggedFoodsErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GetLoggedFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLoggedFoodsErrorStateCopyWith<_$GetLoggedFoodsErrorState>
      get copyWith =>
          __$$GetLoggedFoodsErrorStateCopyWithImpl<_$GetLoggedFoodsErrorState>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(LoggedFoods loggedFoods) loaded,
    required TResult Function(LoggedFoods loggedFoods) loadedImmediateResponse,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(LoggedFoods loggedFoods)? loaded,
    TResult? Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(LoggedFoods loggedFoods)? loaded,
    TResult Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
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
    required TResult Function(GetLoggedFoodsInitialState value) initial,
    required TResult Function(GetLoggedFoodsLoadingState value) loading,
    required TResult Function(GetLoggedFoodsErrorState value) error,
    required TResult Function(GetLoggedFoodsLoadedState value) loaded,
    required TResult Function(GetImmediateLoggedFoodsState value)
        loadedImmediateResponse,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoggedFoodsInitialState value)? initial,
    TResult? Function(GetLoggedFoodsLoadingState value)? loading,
    TResult? Function(GetLoggedFoodsErrorState value)? error,
    TResult? Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult? Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoggedFoodsInitialState value)? initial,
    TResult Function(GetLoggedFoodsLoadingState value)? loading,
    TResult Function(GetLoggedFoodsErrorState value)? error,
    TResult Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetLoggedFoodsErrorState implements GetLoggedFoodsState {
  const factory GetLoggedFoodsErrorState(final String message) =
      _$GetLoggedFoodsErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$GetLoggedFoodsErrorStateCopyWith<_$GetLoggedFoodsErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLoggedFoodsLoadedStateCopyWith<$Res> {
  factory _$$GetLoggedFoodsLoadedStateCopyWith(
          _$GetLoggedFoodsLoadedState value,
          $Res Function(_$GetLoggedFoodsLoadedState) then) =
      __$$GetLoggedFoodsLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({LoggedFoods loggedFoods});

  $LoggedFoodsCopyWith<$Res> get loggedFoods;
}

/// @nodoc
class __$$GetLoggedFoodsLoadedStateCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res, _$GetLoggedFoodsLoadedState>
    implements _$$GetLoggedFoodsLoadedStateCopyWith<$Res> {
  __$$GetLoggedFoodsLoadedStateCopyWithImpl(_$GetLoggedFoodsLoadedState _value,
      $Res Function(_$GetLoggedFoodsLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggedFoods = null,
  }) {
    return _then(_$GetLoggedFoodsLoadedState(
      loggedFoods: null == loggedFoods
          ? _value.loggedFoods
          : loggedFoods // ignore: cast_nullable_to_non_nullable
              as LoggedFoods,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LoggedFoodsCopyWith<$Res> get loggedFoods {
    return $LoggedFoodsCopyWith<$Res>(_value.loggedFoods, (value) {
      return _then(_value.copyWith(loggedFoods: value));
    });
  }
}

/// @nodoc

class _$GetLoggedFoodsLoadedState implements GetLoggedFoodsLoadedState {
  const _$GetLoggedFoodsLoadedState({required this.loggedFoods});

  @override
  final LoggedFoods loggedFoods;

  @override
  String toString() {
    return 'GetLoggedFoodsState.loaded(loggedFoods: $loggedFoods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsLoadedState &&
            (identical(other.loggedFoods, loggedFoods) ||
                other.loggedFoods == loggedFoods));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loggedFoods);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLoggedFoodsLoadedStateCopyWith<_$GetLoggedFoodsLoadedState>
      get copyWith => __$$GetLoggedFoodsLoadedStateCopyWithImpl<
          _$GetLoggedFoodsLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(LoggedFoods loggedFoods) loaded,
    required TResult Function(LoggedFoods loggedFoods) loadedImmediateResponse,
  }) {
    return loaded(loggedFoods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(LoggedFoods loggedFoods)? loaded,
    TResult? Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
  }) {
    return loaded?.call(loggedFoods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(LoggedFoods loggedFoods)? loaded,
    TResult Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(loggedFoods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLoggedFoodsInitialState value) initial,
    required TResult Function(GetLoggedFoodsLoadingState value) loading,
    required TResult Function(GetLoggedFoodsErrorState value) error,
    required TResult Function(GetLoggedFoodsLoadedState value) loaded,
    required TResult Function(GetImmediateLoggedFoodsState value)
        loadedImmediateResponse,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoggedFoodsInitialState value)? initial,
    TResult? Function(GetLoggedFoodsLoadingState value)? loading,
    TResult? Function(GetLoggedFoodsErrorState value)? error,
    TResult? Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult? Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoggedFoodsInitialState value)? initial,
    TResult Function(GetLoggedFoodsLoadingState value)? loading,
    TResult Function(GetLoggedFoodsErrorState value)? error,
    TResult Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GetLoggedFoodsLoadedState implements GetLoggedFoodsState {
  const factory GetLoggedFoodsLoadedState(
      {required final LoggedFoods loggedFoods}) = _$GetLoggedFoodsLoadedState;

  LoggedFoods get loggedFoods;
  @JsonKey(ignore: true)
  _$$GetLoggedFoodsLoadedStateCopyWith<_$GetLoggedFoodsLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetImmediateLoggedFoodsStateCopyWith<$Res> {
  factory _$$GetImmediateLoggedFoodsStateCopyWith(
          _$GetImmediateLoggedFoodsState value,
          $Res Function(_$GetImmediateLoggedFoodsState) then) =
      __$$GetImmediateLoggedFoodsStateCopyWithImpl<$Res>;
  @useResult
  $Res call({LoggedFoods loggedFoods});

  $LoggedFoodsCopyWith<$Res> get loggedFoods;
}

/// @nodoc
class __$$GetImmediateLoggedFoodsStateCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetImmediateLoggedFoodsState>
    implements _$$GetImmediateLoggedFoodsStateCopyWith<$Res> {
  __$$GetImmediateLoggedFoodsStateCopyWithImpl(
      _$GetImmediateLoggedFoodsState _value,
      $Res Function(_$GetImmediateLoggedFoodsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggedFoods = null,
  }) {
    return _then(_$GetImmediateLoggedFoodsState(
      loggedFoods: null == loggedFoods
          ? _value.loggedFoods
          : loggedFoods // ignore: cast_nullable_to_non_nullable
              as LoggedFoods,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $LoggedFoodsCopyWith<$Res> get loggedFoods {
    return $LoggedFoodsCopyWith<$Res>(_value.loggedFoods, (value) {
      return _then(_value.copyWith(loggedFoods: value));
    });
  }
}

/// @nodoc

class _$GetImmediateLoggedFoodsState implements GetImmediateLoggedFoodsState {
  const _$GetImmediateLoggedFoodsState({required this.loggedFoods});

  @override
  final LoggedFoods loggedFoods;

  @override
  String toString() {
    return 'GetLoggedFoodsState.loadedImmediateResponse(loggedFoods: $loggedFoods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetImmediateLoggedFoodsState &&
            (identical(other.loggedFoods, loggedFoods) ||
                other.loggedFoods == loggedFoods));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loggedFoods);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetImmediateLoggedFoodsStateCopyWith<_$GetImmediateLoggedFoodsState>
      get copyWith => __$$GetImmediateLoggedFoodsStateCopyWithImpl<
          _$GetImmediateLoggedFoodsState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(LoggedFoods loggedFoods) loaded,
    required TResult Function(LoggedFoods loggedFoods) loadedImmediateResponse,
  }) {
    return loadedImmediateResponse(loggedFoods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(LoggedFoods loggedFoods)? loaded,
    TResult? Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
  }) {
    return loadedImmediateResponse?.call(loggedFoods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(LoggedFoods loggedFoods)? loaded,
    TResult Function(LoggedFoods loggedFoods)? loadedImmediateResponse,
    required TResult orElse(),
  }) {
    if (loadedImmediateResponse != null) {
      return loadedImmediateResponse(loggedFoods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetLoggedFoodsInitialState value) initial,
    required TResult Function(GetLoggedFoodsLoadingState value) loading,
    required TResult Function(GetLoggedFoodsErrorState value) error,
    required TResult Function(GetLoggedFoodsLoadedState value) loaded,
    required TResult Function(GetImmediateLoggedFoodsState value)
        loadedImmediateResponse,
  }) {
    return loadedImmediateResponse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetLoggedFoodsInitialState value)? initial,
    TResult? Function(GetLoggedFoodsLoadingState value)? loading,
    TResult? Function(GetLoggedFoodsErrorState value)? error,
    TResult? Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult? Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
  }) {
    return loadedImmediateResponse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetLoggedFoodsInitialState value)? initial,
    TResult Function(GetLoggedFoodsLoadingState value)? loading,
    TResult Function(GetLoggedFoodsErrorState value)? error,
    TResult Function(GetLoggedFoodsLoadedState value)? loaded,
    TResult Function(GetImmediateLoggedFoodsState value)?
        loadedImmediateResponse,
    required TResult orElse(),
  }) {
    if (loadedImmediateResponse != null) {
      return loadedImmediateResponse(this);
    }
    return orElse();
  }
}

abstract class GetImmediateLoggedFoodsState implements GetLoggedFoodsState {
  const factory GetImmediateLoggedFoodsState(
          {required final LoggedFoods loggedFoods}) =
      _$GetImmediateLoggedFoodsState;

  LoggedFoods get loggedFoods;
  @JsonKey(ignore: true)
  _$$GetImmediateLoggedFoodsStateCopyWith<_$GetImmediateLoggedFoodsState>
      get copyWith => throw _privateConstructorUsedError;
}
