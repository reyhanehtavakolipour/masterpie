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
abstract class _$$LogAllFoodsEventImplCopyWith<$Res> {
  factory _$$LogAllFoodsEventImplCopyWith(_$LogAllFoodsEventImpl value,
          $Res Function(_$LogAllFoodsEventImpl) then) =
      __$$LogAllFoodsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$LogAllFoodsEventImplCopyWithImpl<$Res>
    extends _$LogFoodsEventCopyWithImpl<$Res, _$LogAllFoodsEventImpl>
    implements _$$LogAllFoodsEventImplCopyWith<$Res> {
  __$$LogAllFoodsEventImplCopyWithImpl(_$LogAllFoodsEventImpl _value,
      $Res Function(_$LogAllFoodsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$LogAllFoodsEventImpl(
      null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$LogAllFoodsEventImpl implements LogAllFoodsEvent {
  const _$LogAllFoodsEventImpl(final List<Food> foods) : _foods = foods;

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogAllFoodsEventImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogAllFoodsEventImplCopyWith<_$LogAllFoodsEventImpl> get copyWith =>
      __$$LogAllFoodsEventImplCopyWithImpl<_$LogAllFoodsEventImpl>(
          this, _$identity);

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
  const factory LogAllFoodsEvent(final List<Food> foods) =
      _$LogAllFoodsEventImpl;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$LogAllFoodsEventImplCopyWith<_$LogAllFoodsEventImpl> get copyWith =>
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
    extends _$LogFoodsEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'LogFoodsEvent.onReset()';
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
  const factory Reset() = _$ResetImpl;
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
abstract class _$$LogFoodsInitialStateImplCopyWith<$Res> {
  factory _$$LogFoodsInitialStateImplCopyWith(_$LogFoodsInitialStateImpl value,
          $Res Function(_$LogFoodsInitialStateImpl) then) =
      __$$LogFoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogFoodsInitialStateImplCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsInitialStateImpl>
    implements _$$LogFoodsInitialStateImplCopyWith<$Res> {
  __$$LogFoodsInitialStateImplCopyWithImpl(_$LogFoodsInitialStateImpl _value,
      $Res Function(_$LogFoodsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogFoodsInitialStateImpl implements LogFoodsInitialState {
  const _$LogFoodsInitialStateImpl();

  @override
  String toString() {
    return 'LogFoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFoodsInitialStateImpl);
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
  const factory LogFoodsInitialState() = _$LogFoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$LogFoodsLoadingStateImplCopyWith<$Res> {
  factory _$$LogFoodsLoadingStateImplCopyWith(_$LogFoodsLoadingStateImpl value,
          $Res Function(_$LogFoodsLoadingStateImpl) then) =
      __$$LogFoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogFoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsLoadingStateImpl>
    implements _$$LogFoodsLoadingStateImplCopyWith<$Res> {
  __$$LogFoodsLoadingStateImplCopyWithImpl(_$LogFoodsLoadingStateImpl _value,
      $Res Function(_$LogFoodsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogFoodsLoadingStateImpl implements LogFoodsLoadingState {
  const _$LogFoodsLoadingStateImpl();

  @override
  String toString() {
    return 'LogFoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFoodsLoadingStateImpl);
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
  const factory LogFoodsLoadingState() = _$LogFoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$LogFoodsErrorStateImplCopyWith<$Res> {
  factory _$$LogFoodsErrorStateImplCopyWith(_$LogFoodsErrorStateImpl value,
          $Res Function(_$LogFoodsErrorStateImpl) then) =
      __$$LogFoodsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$LogFoodsErrorStateImplCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsErrorStateImpl>
    implements _$$LogFoodsErrorStateImplCopyWith<$Res> {
  __$$LogFoodsErrorStateImplCopyWithImpl(_$LogFoodsErrorStateImpl _value,
      $Res Function(_$LogFoodsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$LogFoodsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LogFoodsErrorStateImpl implements LogFoodsErrorState {
  const _$LogFoodsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'LogFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFoodsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LogFoodsErrorStateImplCopyWith<_$LogFoodsErrorStateImpl> get copyWith =>
      __$$LogFoodsErrorStateImplCopyWithImpl<_$LogFoodsErrorStateImpl>(
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
  const factory LogFoodsErrorState(final String message) =
      _$LogFoodsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$LogFoodsErrorStateImplCopyWith<_$LogFoodsErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LogFoodsLoadedStateImplCopyWith<$Res> {
  factory _$$LogFoodsLoadedStateImplCopyWith(_$LogFoodsLoadedStateImpl value,
          $Res Function(_$LogFoodsLoadedStateImpl) then) =
      __$$LogFoodsLoadedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogFoodsLoadedStateImplCopyWithImpl<$Res>
    extends _$LogFoodsStateCopyWithImpl<$Res, _$LogFoodsLoadedStateImpl>
    implements _$$LogFoodsLoadedStateImplCopyWith<$Res> {
  __$$LogFoodsLoadedStateImplCopyWithImpl(_$LogFoodsLoadedStateImpl _value,
      $Res Function(_$LogFoodsLoadedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogFoodsLoadedStateImpl implements LogFoodsLoadedState {
  const _$LogFoodsLoadedStateImpl();

  @override
  String toString() {
    return 'LogFoodsState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogFoodsLoadedStateImpl);
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
  const factory LogFoodsLoadedState() = _$LogFoodsLoadedStateImpl;
}
