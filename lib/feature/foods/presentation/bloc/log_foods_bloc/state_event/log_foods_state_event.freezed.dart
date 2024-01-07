// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_foods_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LogFoodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Food> foods) onLogFoods,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Food> foods)? onLogFoods,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Food> foods)? onLogFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogAllFoodsEvent value) onLogFoods,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogAllFoodsEvent value)? onLogFoods,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogAllFoodsEvent value)? onLogFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogFoodsEventCopyWith<$Res> {
  factory $LogFoodsEventCopyWith(
          LogFoodsEvent value, $Res Function(LogFoodsEvent) then) =
      _$LogFoodsEventCopyWithImpl<$Res, LogFoodsEvent>;
}

/// @nodoc
class _$LogFoodsEventCopyWithImpl<$Res, $Val extends LogFoodsEvent>
    implements $LogFoodsEventCopyWith<$Res> {
  _$LogFoodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogAllFoodsEventCopyWith<$Res> {
  factory _$$LogAllFoodsEventCopyWith(
          _$LogAllFoodsEvent value, $Res Function(_$LogAllFoodsEvent) then) =
      __$$LogAllFoodsEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$LogAllFoodsEventCopyWithImpl<$Res>
    extends _$LogFoodsEventCopyWithImpl<$Res, _$LogAllFoodsEvent>
    implements _$$LogAllFoodsEventCopyWith<$Res> {
  __$$LogAllFoodsEventCopyWithImpl(
      _$LogAllFoodsEvent _value, $Res Function(_$LogAllFoodsEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$LogAllFoodsEvent(
      null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$LogAllFoodsEvent implements LogAllFoodsEvent {
  const _$LogAllFoodsEvent(final List<Food> foods) : _foods = foods;

  final List<Food> _foods;
  @override
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  String toString() {
    return 'LogFoodsEvent.onLogFoods(foods: $foods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogAllFoodsEvent &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogAllFoodsEventCopyWith<_$LogAllFoodsEvent> get copyWith =>
      __$$LogAllFoodsEventCopyWithImpl<_$LogAllFoodsEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Food> foods) onLogFoods,
    required TResult Function() onReset,
  }) {
    return onLogFoods(foods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Food> foods)? onLogFoods,
    TResult? Function()? onReset,
  }) {
    return onLogFoods?.call(foods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Food> foods)? onLogFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onLogFoods != null) {
      return onLogFoods(foods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LogAllFoodsEvent value) onLogFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onLogFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogAllFoodsEvent value)? onLogFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onLogFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogAllFoodsEvent value)? onLogFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onLogFoods != null) {
      return onLogFoods(this);
    }
    return orElse();
  }
}

abstract class LogAllFoodsEvent implements LogFoodsEvent {
  const factory LogAllFoodsEvent(final List<Food> foods) = _$LogAllFoodsEvent;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$LogAllFoodsEventCopyWith<_$LogAllFoodsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$LogFoodsEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'LogFoodsEvent.onReset()';
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
    required TResult Function(List<Food> foods) onLogFoods,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Food> foods)? onLogFoods,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Food> foods)? onLogFoods,
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
    required TResult Function(LogAllFoodsEvent value) onLogFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogAllFoodsEvent value)? onLogFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogAllFoodsEvent value)? onLogFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements LogFoodsEvent {
  const factory Reset() = _$Reset;
}

/// @nodoc
mixin _$LogFoodsState {
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
    required TResult Function(LogFoodsInitialState value) initial,
    required TResult Function(LogFoodsLoadingState value) loading,
    required TResult Function(LogFoodsErrorState value) error,
    required TResult Function(LogFoodsLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogFoodsInitialState value)? initial,
    TResult? Function(LogFoodsLoadingState value)? loading,
    TResult? Function(LogFoodsErrorState value)? error,
    TResult? Function(LogFoodsLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogFoodsInitialState value)? initial,
    TResult Function(LogFoodsLoadingState value)? loading,
    TResult Function(LogFoodsErrorState value)? error,
    TResult Function(LogFoodsLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogFoodsStateCopyWith<$Res> {
  factory $LogFoodsStateCopyWith(
          LogFoodsState value, $Res Function(LogFoodsState) then) =
      _$LogFoodsStateCopyWithImpl<$Res, LogFoodsState>;
}

/// @nodoc
class _$LogFoodsStateCopyWithImpl<$Res, $Val extends LogFoodsState>
    implements $LogFoodsStateCopyWith<$Res> {
  _$LogFoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LogFoodsInitialStateCopyWith<$Res> {
  factory _$$LogFoodsInitialStateCopyWith(_$LogFoodsInitialState value,
          $Res Function(_$LogFoodsInitialState) then) =
      __$$LogFoodsInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogFoodsInitialStateCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsInitialState>
    implements _$$LogFoodsInitialStateCopyWith<$Res> {
  __$$LogFoodsInitialStateCopyWithImpl(_$LogFoodsInitialState _value,
      $Res Function(_$LogFoodsInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogFoodsInitialState implements LogFoodsInitialState {
  const _$LogFoodsInitialState();

  @override
  String toString() {
    return 'LogFoodsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogFoodsInitialState);
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
    required TResult Function(LogFoodsInitialState value) initial,
    required TResult Function(LogFoodsLoadingState value) loading,
    required TResult Function(LogFoodsErrorState value) error,
    required TResult Function(LogFoodsLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogFoodsInitialState value)? initial,
    TResult? Function(LogFoodsLoadingState value)? loading,
    TResult? Function(LogFoodsErrorState value)? error,
    TResult? Function(LogFoodsLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogFoodsInitialState value)? initial,
    TResult Function(LogFoodsLoadingState value)? loading,
    TResult Function(LogFoodsErrorState value)? error,
    TResult Function(LogFoodsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class LogFoodsInitialState implements LogFoodsState {
  const factory LogFoodsInitialState() = _$LogFoodsInitialState;
}

/// @nodoc
abstract class _$$LogFoodsLoadingStateCopyWith<$Res> {
  factory _$$LogFoodsLoadingStateCopyWith(_$LogFoodsLoadingState value,
          $Res Function(_$LogFoodsLoadingState) then) =
      __$$LogFoodsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogFoodsLoadingStateCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsLoadingState>
    implements _$$LogFoodsLoadingStateCopyWith<$Res> {
  __$$LogFoodsLoadingStateCopyWithImpl(_$LogFoodsLoadingState _value,
      $Res Function(_$LogFoodsLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogFoodsLoadingState implements LogFoodsLoadingState {
  const _$LogFoodsLoadingState();

  @override
  String toString() {
    return 'LogFoodsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogFoodsLoadingState);
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
    required TResult Function(LogFoodsInitialState value) initial,
    required TResult Function(LogFoodsLoadingState value) loading,
    required TResult Function(LogFoodsErrorState value) error,
    required TResult Function(LogFoodsLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogFoodsInitialState value)? initial,
    TResult? Function(LogFoodsLoadingState value)? loading,
    TResult? Function(LogFoodsErrorState value)? error,
    TResult? Function(LogFoodsLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogFoodsInitialState value)? initial,
    TResult Function(LogFoodsLoadingState value)? loading,
    TResult Function(LogFoodsErrorState value)? error,
    TResult Function(LogFoodsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LogFoodsLoadingState implements LogFoodsState {
  const factory LogFoodsLoadingState() = _$LogFoodsLoadingState;
}

/// @nodoc
abstract class _$$LogFoodsErrorStateCopyWith<$Res> {
  factory _$$LogFoodsErrorStateCopyWith(_$LogFoodsErrorState value,
          $Res Function(_$LogFoodsErrorState) then) =
      __$$LogFoodsErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LogFoodsErrorStateCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsErrorState>
    implements _$$LogFoodsErrorStateCopyWith<$Res> {
  __$$LogFoodsErrorStateCopyWithImpl(
      _$LogFoodsErrorState _value, $Res Function(_$LogFoodsErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LogFoodsErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogFoodsErrorState implements LogFoodsErrorState {
  const _$LogFoodsErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LogFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFoodsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogFoodsErrorStateCopyWith<_$LogFoodsErrorState> get copyWith =>
      __$$LogFoodsErrorStateCopyWithImpl<_$LogFoodsErrorState>(
          this, _$identity);

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
    required TResult Function(LogFoodsInitialState value) initial,
    required TResult Function(LogFoodsLoadingState value) loading,
    required TResult Function(LogFoodsErrorState value) error,
    required TResult Function(LogFoodsLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogFoodsInitialState value)? initial,
    TResult? Function(LogFoodsLoadingState value)? loading,
    TResult? Function(LogFoodsErrorState value)? error,
    TResult? Function(LogFoodsLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogFoodsInitialState value)? initial,
    TResult Function(LogFoodsLoadingState value)? loading,
    TResult Function(LogFoodsErrorState value)? error,
    TResult Function(LogFoodsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class LogFoodsErrorState implements LogFoodsState {
  const factory LogFoodsErrorState(final String message) = _$LogFoodsErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$LogFoodsErrorStateCopyWith<_$LogFoodsErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogFoodsLoadedStateCopyWith<$Res> {
  factory _$$LogFoodsLoadedStateCopyWith(_$LogFoodsLoadedState value,
          $Res Function(_$LogFoodsLoadedState) then) =
      __$$LogFoodsLoadedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogFoodsLoadedStateCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsLoadedState>
    implements _$$LogFoodsLoadedStateCopyWith<$Res> {
  __$$LogFoodsLoadedStateCopyWithImpl(
      _$LogFoodsLoadedState _value, $Res Function(_$LogFoodsLoadedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogFoodsLoadedState implements LogFoodsLoadedState {
  const _$LogFoodsLoadedState();

  @override
  String toString() {
    return 'LogFoodsState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogFoodsLoadedState);
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
    required TResult Function(LogFoodsInitialState value) initial,
    required TResult Function(LogFoodsLoadingState value) loading,
    required TResult Function(LogFoodsErrorState value) error,
    required TResult Function(LogFoodsLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LogFoodsInitialState value)? initial,
    TResult? Function(LogFoodsLoadingState value)? loading,
    TResult? Function(LogFoodsErrorState value)? error,
    TResult? Function(LogFoodsLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LogFoodsInitialState value)? initial,
    TResult Function(LogFoodsLoadingState value)? loading,
    TResult Function(LogFoodsErrorState value)? error,
    TResult Function(LogFoodsLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LogFoodsLoadedState implements LogFoodsState {
  const factory LogFoodsLoadedState() = _$LogFoodsLoadedState;
}
