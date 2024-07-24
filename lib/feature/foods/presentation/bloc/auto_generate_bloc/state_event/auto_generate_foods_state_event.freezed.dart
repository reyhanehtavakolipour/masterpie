// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auto_generate_foods_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AutoGenerateFoodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, int index, bool isMainDish)
        onAutoGenerateFood,
    required TResult Function() onAutoGenerateFoodsForDay,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult? Function()? onAutoGenerateFoodsForDay,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult Function()? onAutoGenerateFoodsForDay,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutoGenerateFood value) onAutoGenerateFood,
    required TResult Function(AutoGenerateFoodsForDay value)
        onAutoGenerateFoodsForDay,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult? Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoGenerateFoodsEventCopyWith<$Res> {
  factory $AutoGenerateFoodsEventCopyWith(AutoGenerateFoodsEvent value,
          $Res Function(AutoGenerateFoodsEvent) then) =
      _$AutoGenerateFoodsEventCopyWithImpl<$Res, AutoGenerateFoodsEvent>;
}

/// @nodoc
class _$AutoGenerateFoodsEventCopyWithImpl<$Res,
        $Val extends AutoGenerateFoodsEvent>
    implements $AutoGenerateFoodsEventCopyWith<$Res> {
  _$AutoGenerateFoodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AutoGenerateFoodImplCopyWith<$Res> {
  factory _$$AutoGenerateFoodImplCopyWith(_$AutoGenerateFoodImpl value,
          $Res Function(_$AutoGenerateFoodImpl) then) =
      __$$AutoGenerateFoodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String type, int index, bool isMainDish});
}

/// @nodoc
class __$$AutoGenerateFoodImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsEventCopyWithImpl<$Res, _$AutoGenerateFoodImpl>
    implements _$$AutoGenerateFoodImplCopyWith<$Res> {
  __$$AutoGenerateFoodImplCopyWithImpl(_$AutoGenerateFoodImpl _value,
      $Res Function(_$AutoGenerateFoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? index = null,
    Object? isMainDish = null,
  }) {
    return _then(_$AutoGenerateFoodImpl(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      null == isMainDish
          ? _value.isMainDish
          : isMainDish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AutoGenerateFoodImpl implements AutoGenerateFood {
  const _$AutoGenerateFoodImpl(this.type, this.index, this.isMainDish);

  @override
  final String type;
  @override
  final int index;
  @override
  final bool isMainDish;

  @override
  String toString() {
    return 'AutoGenerateFoodsEvent.onAutoGenerateFood(type: $type, index: $index, isMainDish: $isMainDish)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoGenerateFoodImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isMainDish, isMainDish) ||
                other.isMainDish == isMainDish));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, index, isMainDish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoGenerateFoodImplCopyWith<_$AutoGenerateFoodImpl> get copyWith =>
      __$$AutoGenerateFoodImplCopyWithImpl<_$AutoGenerateFoodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, int index, bool isMainDish)
        onAutoGenerateFood,
    required TResult Function() onAutoGenerateFoodsForDay,
    required TResult Function() onReset,
  }) {
    return onAutoGenerateFood(type, index, isMainDish);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult? Function()? onAutoGenerateFoodsForDay,
    TResult? Function()? onReset,
  }) {
    return onAutoGenerateFood?.call(type, index, isMainDish);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult Function()? onAutoGenerateFoodsForDay,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onAutoGenerateFood != null) {
      return onAutoGenerateFood(type, index, isMainDish);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutoGenerateFood value) onAutoGenerateFood,
    required TResult Function(AutoGenerateFoodsForDay value)
        onAutoGenerateFoodsForDay,
    required TResult Function(Reset value) onReset,
  }) {
    return onAutoGenerateFood(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult? Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult? Function(Reset value)? onReset,
  }) {
    return onAutoGenerateFood?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onAutoGenerateFood != null) {
      return onAutoGenerateFood(this);
    }
    return orElse();
  }
}

abstract class AutoGenerateFood implements AutoGenerateFoodsEvent {
  const factory AutoGenerateFood(
          final String type, final int index, final bool isMainDish) =
      _$AutoGenerateFoodImpl;

  String get type;
  int get index;
  bool get isMainDish;
  @JsonKey(ignore: true)
  _$$AutoGenerateFoodImplCopyWith<_$AutoGenerateFoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoGenerateFoodsForDayImplCopyWith<$Res> {
  factory _$$AutoGenerateFoodsForDayImplCopyWith(
          _$AutoGenerateFoodsForDayImpl value,
          $Res Function(_$AutoGenerateFoodsForDayImpl) then) =
      __$$AutoGenerateFoodsForDayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AutoGenerateFoodsForDayImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsEventCopyWithImpl<$Res,
        _$AutoGenerateFoodsForDayImpl>
    implements _$$AutoGenerateFoodsForDayImplCopyWith<$Res> {
  __$$AutoGenerateFoodsForDayImplCopyWithImpl(
      _$AutoGenerateFoodsForDayImpl _value,
      $Res Function(_$AutoGenerateFoodsForDayImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AutoGenerateFoodsForDayImpl implements AutoGenerateFoodsForDay {
  const _$AutoGenerateFoodsForDayImpl();

  @override
  String toString() {
    return 'AutoGenerateFoodsEvent.onAutoGenerateFoodsForDay()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoGenerateFoodsForDayImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String type, int index, bool isMainDish)
        onAutoGenerateFood,
    required TResult Function() onAutoGenerateFoodsForDay,
    required TResult Function() onReset,
  }) {
    return onAutoGenerateFoodsForDay();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult? Function()? onAutoGenerateFoodsForDay,
    TResult? Function()? onReset,
  }) {
    return onAutoGenerateFoodsForDay?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult Function()? onAutoGenerateFoodsForDay,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onAutoGenerateFoodsForDay != null) {
      return onAutoGenerateFoodsForDay();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutoGenerateFood value) onAutoGenerateFood,
    required TResult Function(AutoGenerateFoodsForDay value)
        onAutoGenerateFoodsForDay,
    required TResult Function(Reset value) onReset,
  }) {
    return onAutoGenerateFoodsForDay(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult? Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult? Function(Reset value)? onReset,
  }) {
    return onAutoGenerateFoodsForDay?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onAutoGenerateFoodsForDay != null) {
      return onAutoGenerateFoodsForDay(this);
    }
    return orElse();
  }
}

abstract class AutoGenerateFoodsForDay implements AutoGenerateFoodsEvent {
  const factory AutoGenerateFoodsForDay() = _$AutoGenerateFoodsForDayImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'AutoGenerateFoodsEvent.onReset()';
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
    required TResult Function(String type, int index, bool isMainDish)
        onAutoGenerateFood,
    required TResult Function() onAutoGenerateFoodsForDay,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult? Function()? onAutoGenerateFoodsForDay,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String type, int index, bool isMainDish)?
        onAutoGenerateFood,
    TResult Function()? onAutoGenerateFoodsForDay,
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
    required TResult Function(AutoGenerateFood value) onAutoGenerateFood,
    required TResult Function(AutoGenerateFoodsForDay value)
        onAutoGenerateFoodsForDay,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult? Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFood value)? onAutoGenerateFood,
    TResult Function(AutoGenerateFoodsForDay value)? onAutoGenerateFoodsForDay,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements AutoGenerateFoodsEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$AutoGenerateFoodsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) foodsLoaded,
    required TResult Function(
            Food food, String type, int index, bool isMainDish)
        foodLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? foodsLoaded,
    TResult? Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? foodsLoaded,
    TResult Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutoGenerateFoodsInitialState value) initial,
    required TResult Function(AutoGenerateFoodsLoadingState value) loading,
    required TResult Function(AutoGenerateFoodsErrorState value) error,
    required TResult Function(AutoGenerateFoodsForDayLoadedState value)
        foodsLoaded,
    required TResult Function(AutoGenerateFoodLoadedState value) foodLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFoodsInitialState value)? initial,
    TResult? Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult? Function(AutoGenerateFoodsErrorState value)? error,
    TResult? Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult? Function(AutoGenerateFoodLoadedState value)? foodLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFoodsInitialState value)? initial,
    TResult Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult Function(AutoGenerateFoodsErrorState value)? error,
    TResult Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult Function(AutoGenerateFoodLoadedState value)? foodLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AutoGenerateFoodsStateCopyWith<$Res> {
  factory $AutoGenerateFoodsStateCopyWith(AutoGenerateFoodsState value,
          $Res Function(AutoGenerateFoodsState) then) =
      _$AutoGenerateFoodsStateCopyWithImpl<$Res, AutoGenerateFoodsState>;
}

/// @nodoc
class _$AutoGenerateFoodsStateCopyWithImpl<$Res,
        $Val extends AutoGenerateFoodsState>
    implements $AutoGenerateFoodsStateCopyWith<$Res> {
  _$AutoGenerateFoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AutoGenerateFoodsInitialStateImplCopyWith<$Res> {
  factory _$$AutoGenerateFoodsInitialStateImplCopyWith(
          _$AutoGenerateFoodsInitialStateImpl value,
          $Res Function(_$AutoGenerateFoodsInitialStateImpl) then) =
      __$$AutoGenerateFoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AutoGenerateFoodsInitialStateImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsStateCopyWithImpl<$Res,
        _$AutoGenerateFoodsInitialStateImpl>
    implements _$$AutoGenerateFoodsInitialStateImplCopyWith<$Res> {
  __$$AutoGenerateFoodsInitialStateImplCopyWithImpl(
      _$AutoGenerateFoodsInitialStateImpl _value,
      $Res Function(_$AutoGenerateFoodsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AutoGenerateFoodsInitialStateImpl
    implements AutoGenerateFoodsInitialState {
  const _$AutoGenerateFoodsInitialStateImpl();

  @override
  String toString() {
    return 'AutoGenerateFoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoGenerateFoodsInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) foodsLoaded,
    required TResult Function(
            Food food, String type, int index, bool isMainDish)
        foodLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? foodsLoaded,
    TResult? Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? foodsLoaded,
    TResult Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
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
    required TResult Function(AutoGenerateFoodsInitialState value) initial,
    required TResult Function(AutoGenerateFoodsLoadingState value) loading,
    required TResult Function(AutoGenerateFoodsErrorState value) error,
    required TResult Function(AutoGenerateFoodsForDayLoadedState value)
        foodsLoaded,
    required TResult Function(AutoGenerateFoodLoadedState value) foodLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFoodsInitialState value)? initial,
    TResult? Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult? Function(AutoGenerateFoodsErrorState value)? error,
    TResult? Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult? Function(AutoGenerateFoodLoadedState value)? foodLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFoodsInitialState value)? initial,
    TResult Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult Function(AutoGenerateFoodsErrorState value)? error,
    TResult Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult Function(AutoGenerateFoodLoadedState value)? foodLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AutoGenerateFoodsInitialState implements AutoGenerateFoodsState {
  const factory AutoGenerateFoodsInitialState() =
      _$AutoGenerateFoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$AutoGenerateFoodsLoadingStateImplCopyWith<$Res> {
  factory _$$AutoGenerateFoodsLoadingStateImplCopyWith(
          _$AutoGenerateFoodsLoadingStateImpl value,
          $Res Function(_$AutoGenerateFoodsLoadingStateImpl) then) =
      __$$AutoGenerateFoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AutoGenerateFoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsStateCopyWithImpl<$Res,
        _$AutoGenerateFoodsLoadingStateImpl>
    implements _$$AutoGenerateFoodsLoadingStateImplCopyWith<$Res> {
  __$$AutoGenerateFoodsLoadingStateImplCopyWithImpl(
      _$AutoGenerateFoodsLoadingStateImpl _value,
      $Res Function(_$AutoGenerateFoodsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AutoGenerateFoodsLoadingStateImpl
    implements AutoGenerateFoodsLoadingState {
  const _$AutoGenerateFoodsLoadingStateImpl();

  @override
  String toString() {
    return 'AutoGenerateFoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoGenerateFoodsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) foodsLoaded,
    required TResult Function(
            Food food, String type, int index, bool isMainDish)
        foodLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? foodsLoaded,
    TResult? Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? foodsLoaded,
    TResult Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
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
    required TResult Function(AutoGenerateFoodsInitialState value) initial,
    required TResult Function(AutoGenerateFoodsLoadingState value) loading,
    required TResult Function(AutoGenerateFoodsErrorState value) error,
    required TResult Function(AutoGenerateFoodsForDayLoadedState value)
        foodsLoaded,
    required TResult Function(AutoGenerateFoodLoadedState value) foodLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFoodsInitialState value)? initial,
    TResult? Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult? Function(AutoGenerateFoodsErrorState value)? error,
    TResult? Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult? Function(AutoGenerateFoodLoadedState value)? foodLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFoodsInitialState value)? initial,
    TResult Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult Function(AutoGenerateFoodsErrorState value)? error,
    TResult Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult Function(AutoGenerateFoodLoadedState value)? foodLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AutoGenerateFoodsLoadingState implements AutoGenerateFoodsState {
  const factory AutoGenerateFoodsLoadingState() =
      _$AutoGenerateFoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$AutoGenerateFoodsErrorStateImplCopyWith<$Res> {
  factory _$$AutoGenerateFoodsErrorStateImplCopyWith(
          _$AutoGenerateFoodsErrorStateImpl value,
          $Res Function(_$AutoGenerateFoodsErrorStateImpl) then) =
      __$$AutoGenerateFoodsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AutoGenerateFoodsErrorStateImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsStateCopyWithImpl<$Res,
        _$AutoGenerateFoodsErrorStateImpl>
    implements _$$AutoGenerateFoodsErrorStateImplCopyWith<$Res> {
  __$$AutoGenerateFoodsErrorStateImplCopyWithImpl(
      _$AutoGenerateFoodsErrorStateImpl _value,
      $Res Function(_$AutoGenerateFoodsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AutoGenerateFoodsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AutoGenerateFoodsErrorStateImpl implements AutoGenerateFoodsErrorState {
  const _$AutoGenerateFoodsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AutoGenerateFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoGenerateFoodsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoGenerateFoodsErrorStateImplCopyWith<_$AutoGenerateFoodsErrorStateImpl>
      get copyWith => __$$AutoGenerateFoodsErrorStateImplCopyWithImpl<
          _$AutoGenerateFoodsErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) foodsLoaded,
    required TResult Function(
            Food food, String type, int index, bool isMainDish)
        foodLoaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? foodsLoaded,
    TResult? Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? foodsLoaded,
    TResult Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
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
    required TResult Function(AutoGenerateFoodsInitialState value) initial,
    required TResult Function(AutoGenerateFoodsLoadingState value) loading,
    required TResult Function(AutoGenerateFoodsErrorState value) error,
    required TResult Function(AutoGenerateFoodsForDayLoadedState value)
        foodsLoaded,
    required TResult Function(AutoGenerateFoodLoadedState value) foodLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFoodsInitialState value)? initial,
    TResult? Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult? Function(AutoGenerateFoodsErrorState value)? error,
    TResult? Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult? Function(AutoGenerateFoodLoadedState value)? foodLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFoodsInitialState value)? initial,
    TResult Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult Function(AutoGenerateFoodsErrorState value)? error,
    TResult Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult Function(AutoGenerateFoodLoadedState value)? foodLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AutoGenerateFoodsErrorState implements AutoGenerateFoodsState {
  const factory AutoGenerateFoodsErrorState(final String message) =
      _$AutoGenerateFoodsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AutoGenerateFoodsErrorStateImplCopyWith<_$AutoGenerateFoodsErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoGenerateFoodsForDayLoadedStateImplCopyWith<$Res> {
  factory _$$AutoGenerateFoodsForDayLoadedStateImplCopyWith(
          _$AutoGenerateFoodsForDayLoadedStateImpl value,
          $Res Function(_$AutoGenerateFoodsForDayLoadedStateImpl) then) =
      __$$AutoGenerateFoodsForDayLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$AutoGenerateFoodsForDayLoadedStateImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsStateCopyWithImpl<$Res,
        _$AutoGenerateFoodsForDayLoadedStateImpl>
    implements _$$AutoGenerateFoodsForDayLoadedStateImplCopyWith<$Res> {
  __$$AutoGenerateFoodsForDayLoadedStateImplCopyWithImpl(
      _$AutoGenerateFoodsForDayLoadedStateImpl _value,
      $Res Function(_$AutoGenerateFoodsForDayLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$AutoGenerateFoodsForDayLoadedStateImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$AutoGenerateFoodsForDayLoadedStateImpl
    implements AutoGenerateFoodsForDayLoadedState {
  const _$AutoGenerateFoodsForDayLoadedStateImpl(
      {required final List<Food> foods})
      : _foods = foods;

  final List<Food> _foods;
  @override
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  String toString() {
    return 'AutoGenerateFoodsState.foodsLoaded(foods: $foods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoGenerateFoodsForDayLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoGenerateFoodsForDayLoadedStateImplCopyWith<
          _$AutoGenerateFoodsForDayLoadedStateImpl>
      get copyWith => __$$AutoGenerateFoodsForDayLoadedStateImplCopyWithImpl<
          _$AutoGenerateFoodsForDayLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) foodsLoaded,
    required TResult Function(
            Food food, String type, int index, bool isMainDish)
        foodLoaded,
  }) {
    return foodsLoaded(foods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? foodsLoaded,
    TResult? Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
  }) {
    return foodsLoaded?.call(foods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? foodsLoaded,
    TResult Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
    required TResult orElse(),
  }) {
    if (foodsLoaded != null) {
      return foodsLoaded(foods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutoGenerateFoodsInitialState value) initial,
    required TResult Function(AutoGenerateFoodsLoadingState value) loading,
    required TResult Function(AutoGenerateFoodsErrorState value) error,
    required TResult Function(AutoGenerateFoodsForDayLoadedState value)
        foodsLoaded,
    required TResult Function(AutoGenerateFoodLoadedState value) foodLoaded,
  }) {
    return foodsLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFoodsInitialState value)? initial,
    TResult? Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult? Function(AutoGenerateFoodsErrorState value)? error,
    TResult? Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult? Function(AutoGenerateFoodLoadedState value)? foodLoaded,
  }) {
    return foodsLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFoodsInitialState value)? initial,
    TResult Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult Function(AutoGenerateFoodsErrorState value)? error,
    TResult Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult Function(AutoGenerateFoodLoadedState value)? foodLoaded,
    required TResult orElse(),
  }) {
    if (foodsLoaded != null) {
      return foodsLoaded(this);
    }
    return orElse();
  }
}

abstract class AutoGenerateFoodsForDayLoadedState
    implements AutoGenerateFoodsState {
  const factory AutoGenerateFoodsForDayLoadedState(
          {required final List<Food> foods}) =
      _$AutoGenerateFoodsForDayLoadedStateImpl;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$AutoGenerateFoodsForDayLoadedStateImplCopyWith<
          _$AutoGenerateFoodsForDayLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AutoGenerateFoodLoadedStateImplCopyWith<$Res> {
  factory _$$AutoGenerateFoodLoadedStateImplCopyWith(
          _$AutoGenerateFoodLoadedStateImpl value,
          $Res Function(_$AutoGenerateFoodLoadedStateImpl) then) =
      __$$AutoGenerateFoodLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food, String type, int index, bool isMainDish});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AutoGenerateFoodLoadedStateImplCopyWithImpl<$Res>
    extends _$AutoGenerateFoodsStateCopyWithImpl<$Res,
        _$AutoGenerateFoodLoadedStateImpl>
    implements _$$AutoGenerateFoodLoadedStateImplCopyWith<$Res> {
  __$$AutoGenerateFoodLoadedStateImplCopyWithImpl(
      _$AutoGenerateFoodLoadedStateImpl _value,
      $Res Function(_$AutoGenerateFoodLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
    Object? type = null,
    Object? index = null,
    Object? isMainDish = null,
  }) {
    return _then(_$AutoGenerateFoodLoadedStateImpl(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      isMainDish: null == isMainDish
          ? _value.isMainDish
          : isMainDish // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FoodCopyWith<$Res> get food {
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc

class _$AutoGenerateFoodLoadedStateImpl implements AutoGenerateFoodLoadedState {
  const _$AutoGenerateFoodLoadedStateImpl(
      {required this.food,
      required this.type,
      required this.index,
      required this.isMainDish});

  @override
  final Food food;
  @override
  final String type;
  @override
  final int index;
  @override
  final bool isMainDish;

  @override
  String toString() {
    return 'AutoGenerateFoodsState.foodLoaded(food: $food, type: $type, index: $index, isMainDish: $isMainDish)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AutoGenerateFoodLoadedStateImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.isMainDish, isMainDish) ||
                other.isMainDish == isMainDish));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food, type, index, isMainDish);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AutoGenerateFoodLoadedStateImplCopyWith<_$AutoGenerateFoodLoadedStateImpl>
      get copyWith => __$$AutoGenerateFoodLoadedStateImplCopyWithImpl<
          _$AutoGenerateFoodLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) foodsLoaded,
    required TResult Function(
            Food food, String type, int index, bool isMainDish)
        foodLoaded,
  }) {
    return foodLoaded(food, type, index, isMainDish);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? foodsLoaded,
    TResult? Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
  }) {
    return foodLoaded?.call(food, type, index, isMainDish);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? foodsLoaded,
    TResult Function(Food food, String type, int index, bool isMainDish)?
        foodLoaded,
    required TResult orElse(),
  }) {
    if (foodLoaded != null) {
      return foodLoaded(food, type, index, isMainDish);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AutoGenerateFoodsInitialState value) initial,
    required TResult Function(AutoGenerateFoodsLoadingState value) loading,
    required TResult Function(AutoGenerateFoodsErrorState value) error,
    required TResult Function(AutoGenerateFoodsForDayLoadedState value)
        foodsLoaded,
    required TResult Function(AutoGenerateFoodLoadedState value) foodLoaded,
  }) {
    return foodLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AutoGenerateFoodsInitialState value)? initial,
    TResult? Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult? Function(AutoGenerateFoodsErrorState value)? error,
    TResult? Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult? Function(AutoGenerateFoodLoadedState value)? foodLoaded,
  }) {
    return foodLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AutoGenerateFoodsInitialState value)? initial,
    TResult Function(AutoGenerateFoodsLoadingState value)? loading,
    TResult Function(AutoGenerateFoodsErrorState value)? error,
    TResult Function(AutoGenerateFoodsForDayLoadedState value)? foodsLoaded,
    TResult Function(AutoGenerateFoodLoadedState value)? foodLoaded,
    required TResult orElse(),
  }) {
    if (foodLoaded != null) {
      return foodLoaded(this);
    }
    return orElse();
  }
}

abstract class AutoGenerateFoodLoadedState implements AutoGenerateFoodsState {
  const factory AutoGenerateFoodLoadedState(
      {required final Food food,
      required final String type,
      required final int index,
      required final bool isMainDish}) = _$AutoGenerateFoodLoadedStateImpl;

  Food get food;
  String get type;
  int get index;
  bool get isMainDish;
  @JsonKey(ignore: true)
  _$$AutoGenerateFoodLoadedStateImplCopyWith<_$AutoGenerateFoodLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
