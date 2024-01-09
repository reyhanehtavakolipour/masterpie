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
abstract class _$$GetAllLoggedFoodsEventImplCopyWith<$Res> {
  factory _$$GetAllLoggedFoodsEventImplCopyWith(
          _$GetAllLoggedFoodsEventImpl value,
          $Res Function(_$GetAllLoggedFoodsEventImpl) then) =
      __$$GetAllLoggedFoodsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String date});
}

/// @nodoc
class __$$GetAllLoggedFoodsEventImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsEventCopyWithImpl<$Res,
        _$GetAllLoggedFoodsEventImpl>
    implements _$$GetAllLoggedFoodsEventImplCopyWith<$Res> {
  __$$GetAllLoggedFoodsEventImplCopyWithImpl(
      _$GetAllLoggedFoodsEventImpl _value,
      $Res Function(_$GetAllLoggedFoodsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GetAllLoggedFoodsEventImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAllLoggedFoodsEventImpl implements GetAllLoggedFoodsEvent {
  const _$GetAllLoggedFoodsEventImpl(this.date);

  @override
  final String date;

  @override
  String toString() {
    return 'GetLoggedFoodsEvent.onGetLoggedFoods(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllLoggedFoodsEventImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllLoggedFoodsEventImplCopyWith<_$GetAllLoggedFoodsEventImpl>
      get copyWith => __$$GetAllLoggedFoodsEventImplCopyWithImpl<
          _$GetAllLoggedFoodsEventImpl>(this, _$identity);

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
      _$GetAllLoggedFoodsEventImpl;

  String get date;
  @JsonKey(ignore: true)
  _$$GetAllLoggedFoodsEventImplCopyWith<_$GetAllLoggedFoodsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetImmediateLoggedFoodsEventImplCopyWith<$Res> {
  factory _$$GetImmediateLoggedFoodsEventImplCopyWith(
          _$GetImmediateLoggedFoodsEventImpl value,
          $Res Function(_$GetImmediateLoggedFoodsEventImpl) then) =
      __$$GetImmediateLoggedFoodsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String date});
}

/// @nodoc
class __$$GetImmediateLoggedFoodsEventImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsEventCopyWithImpl<$Res,
        _$GetImmediateLoggedFoodsEventImpl>
    implements _$$GetImmediateLoggedFoodsEventImplCopyWith<$Res> {
  __$$GetImmediateLoggedFoodsEventImplCopyWithImpl(
      _$GetImmediateLoggedFoodsEventImpl _value,
      $Res Function(_$GetImmediateLoggedFoodsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$GetImmediateLoggedFoodsEventImpl(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetImmediateLoggedFoodsEventImpl
    implements GetImmediateLoggedFoodsEvent {
  const _$GetImmediateLoggedFoodsEventImpl(this.date);

  @override
  final String date;

  @override
  String toString() {
    return 'GetLoggedFoodsEvent.onGetImmediateLoggedFoods(date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetImmediateLoggedFoodsEventImpl &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetImmediateLoggedFoodsEventImplCopyWith<
          _$GetImmediateLoggedFoodsEventImpl>
      get copyWith => __$$GetImmediateLoggedFoodsEventImplCopyWithImpl<
          _$GetImmediateLoggedFoodsEventImpl>(this, _$identity);

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
      _$GetImmediateLoggedFoodsEventImpl;

  String get date;
  @JsonKey(ignore: true)
  _$$GetImmediateLoggedFoodsEventImplCopyWith<
          _$GetImmediateLoggedFoodsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'GetLoggedFoodsEvent.onReset()';
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
  const factory Reset() = _$ResetImpl;
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
abstract class _$$GetLoggedFoodsInitialStateImplCopyWith<$Res> {
  factory _$$GetLoggedFoodsInitialStateImplCopyWith(
          _$GetLoggedFoodsInitialStateImpl value,
          $Res Function(_$GetLoggedFoodsInitialStateImpl) then) =
      __$$GetLoggedFoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoggedFoodsInitialStateImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetLoggedFoodsInitialStateImpl>
    implements _$$GetLoggedFoodsInitialStateImplCopyWith<$Res> {
  __$$GetLoggedFoodsInitialStateImplCopyWithImpl(
      _$GetLoggedFoodsInitialStateImpl _value,
      $Res Function(_$GetLoggedFoodsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLoggedFoodsInitialStateImpl implements GetLoggedFoodsInitialState {
  const _$GetLoggedFoodsInitialStateImpl();

  @override
  String toString() {
    return 'GetLoggedFoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsInitialStateImpl);
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
  const factory GetLoggedFoodsInitialState() = _$GetLoggedFoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$GetLoggedFoodsLoadingStateImplCopyWith<$Res> {
  factory _$$GetLoggedFoodsLoadingStateImplCopyWith(
          _$GetLoggedFoodsLoadingStateImpl value,
          $Res Function(_$GetLoggedFoodsLoadingStateImpl) then) =
      __$$GetLoggedFoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLoggedFoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetLoggedFoodsLoadingStateImpl>
    implements _$$GetLoggedFoodsLoadingStateImplCopyWith<$Res> {
  __$$GetLoggedFoodsLoadingStateImplCopyWithImpl(
      _$GetLoggedFoodsLoadingStateImpl _value,
      $Res Function(_$GetLoggedFoodsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLoggedFoodsLoadingStateImpl implements GetLoggedFoodsLoadingState {
  const _$GetLoggedFoodsLoadingStateImpl();

  @override
  String toString() {
    return 'GetLoggedFoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsLoadingStateImpl);
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
  const factory GetLoggedFoodsLoadingState() = _$GetLoggedFoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetLoggedFoodsErrorStateImplCopyWith<$Res> {
  factory _$$GetLoggedFoodsErrorStateImplCopyWith(
          _$GetLoggedFoodsErrorStateImpl value,
          $Res Function(_$GetLoggedFoodsErrorStateImpl) then) =
      __$$GetLoggedFoodsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GetLoggedFoodsErrorStateImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetLoggedFoodsErrorStateImpl>
    implements _$$GetLoggedFoodsErrorStateImplCopyWith<$Res> {
  __$$GetLoggedFoodsErrorStateImplCopyWithImpl(
      _$GetLoggedFoodsErrorStateImpl _value,
      $Res Function(_$GetLoggedFoodsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GetLoggedFoodsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetLoggedFoodsErrorStateImpl implements GetLoggedFoodsErrorState {
  const _$GetLoggedFoodsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GetLoggedFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLoggedFoodsErrorStateImplCopyWith<_$GetLoggedFoodsErrorStateImpl>
      get copyWith => __$$GetLoggedFoodsErrorStateImplCopyWithImpl<
          _$GetLoggedFoodsErrorStateImpl>(this, _$identity);

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
      _$GetLoggedFoodsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$GetLoggedFoodsErrorStateImplCopyWith<_$GetLoggedFoodsErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLoggedFoodsLoadedStateImplCopyWith<$Res> {
  factory _$$GetLoggedFoodsLoadedStateImplCopyWith(
          _$GetLoggedFoodsLoadedStateImpl value,
          $Res Function(_$GetLoggedFoodsLoadedStateImpl) then) =
      __$$GetLoggedFoodsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoggedFoods loggedFoods});

  $LoggedFoodsCopyWith<$Res> get loggedFoods;
}

/// @nodoc
class __$$GetLoggedFoodsLoadedStateImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetLoggedFoodsLoadedStateImpl>
    implements _$$GetLoggedFoodsLoadedStateImplCopyWith<$Res> {
  __$$GetLoggedFoodsLoadedStateImplCopyWithImpl(
      _$GetLoggedFoodsLoadedStateImpl _value,
      $Res Function(_$GetLoggedFoodsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggedFoods = null,
  }) {
    return _then(_$GetLoggedFoodsLoadedStateImpl(
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

class _$GetLoggedFoodsLoadedStateImpl implements GetLoggedFoodsLoadedState {
  const _$GetLoggedFoodsLoadedStateImpl({required this.loggedFoods});

  @override
  final LoggedFoods loggedFoods;

  @override
  String toString() {
    return 'GetLoggedFoodsState.loaded(loggedFoods: $loggedFoods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetLoggedFoodsLoadedStateImpl &&
            (identical(other.loggedFoods, loggedFoods) ||
                other.loggedFoods == loggedFoods));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loggedFoods);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetLoggedFoodsLoadedStateImplCopyWith<_$GetLoggedFoodsLoadedStateImpl>
      get copyWith => __$$GetLoggedFoodsLoadedStateImplCopyWithImpl<
          _$GetLoggedFoodsLoadedStateImpl>(this, _$identity);

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
          {required final LoggedFoods loggedFoods}) =
      _$GetLoggedFoodsLoadedStateImpl;

  LoggedFoods get loggedFoods;
  @JsonKey(ignore: true)
  _$$GetLoggedFoodsLoadedStateImplCopyWith<_$GetLoggedFoodsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetImmediateLoggedFoodsStateImplCopyWith<$Res> {
  factory _$$GetImmediateLoggedFoodsStateImplCopyWith(
          _$GetImmediateLoggedFoodsStateImpl value,
          $Res Function(_$GetImmediateLoggedFoodsStateImpl) then) =
      __$$GetImmediateLoggedFoodsStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoggedFoods loggedFoods});

  $LoggedFoodsCopyWith<$Res> get loggedFoods;
}

/// @nodoc
class __$$GetImmediateLoggedFoodsStateImplCopyWithImpl<$Res>
    extends _$GetLoggedFoodsStateCopyWithImpl<$Res,
        _$GetImmediateLoggedFoodsStateImpl>
    implements _$$GetImmediateLoggedFoodsStateImplCopyWith<$Res> {
  __$$GetImmediateLoggedFoodsStateImplCopyWithImpl(
      _$GetImmediateLoggedFoodsStateImpl _value,
      $Res Function(_$GetImmediateLoggedFoodsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggedFoods = null,
  }) {
    return _then(_$GetImmediateLoggedFoodsStateImpl(
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

class _$GetImmediateLoggedFoodsStateImpl
    implements GetImmediateLoggedFoodsState {
  const _$GetImmediateLoggedFoodsStateImpl({required this.loggedFoods});

  @override
  final LoggedFoods loggedFoods;

  @override
  String toString() {
    return 'GetLoggedFoodsState.loadedImmediateResponse(loggedFoods: $loggedFoods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetImmediateLoggedFoodsStateImpl &&
            (identical(other.loggedFoods, loggedFoods) ||
                other.loggedFoods == loggedFoods));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loggedFoods);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetImmediateLoggedFoodsStateImplCopyWith<
          _$GetImmediateLoggedFoodsStateImpl>
      get copyWith => __$$GetImmediateLoggedFoodsStateImplCopyWithImpl<
          _$GetImmediateLoggedFoodsStateImpl>(this, _$identity);

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
      _$GetImmediateLoggedFoodsStateImpl;

  LoggedFoods get loggedFoods;
  @JsonKey(ignore: true)
  _$$GetImmediateLoggedFoodsStateImplCopyWith<
          _$GetImmediateLoggedFoodsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
