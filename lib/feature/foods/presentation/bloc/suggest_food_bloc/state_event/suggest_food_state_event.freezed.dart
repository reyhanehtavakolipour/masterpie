// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggest_food_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestFoodEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onReset,
    required TResult Function(List<String>? ingredientsIncluded,
            List<String>? allergies, String? nationality, String? diet)
        onSuggestFood,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onReset,
    TResult? Function(List<String>? ingredientsIncluded,
            List<String>? allergies, String? nationality, String? diet)?
        onSuggestFood,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onReset,
    TResult Function(List<String>? ingredientsIncluded, List<String>? allergies,
            String? nationality, String? diet)?
        onSuggestFood,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Reset value) onReset,
    required TResult Function(SuggestMealEvent value) onSuggestFood,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Reset value)? onReset,
    TResult? Function(SuggestMealEvent value)? onSuggestFood,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Reset value)? onReset,
    TResult Function(SuggestMealEvent value)? onSuggestFood,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestFoodEventCopyWith<$Res> {
  factory $SuggestFoodEventCopyWith(
          SuggestFoodEvent value, $Res Function(SuggestFoodEvent) then) =
      _$SuggestFoodEventCopyWithImpl<$Res, SuggestFoodEvent>;
}

/// @nodoc
class _$SuggestFoodEventCopyWithImpl<$Res, $Val extends SuggestFoodEvent>
    implements $SuggestFoodEventCopyWith<$Res> {
  _$SuggestFoodEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$SuggestFoodEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'SuggestFoodEvent.onReset()';
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
    required TResult Function() onReset,
    required TResult Function(List<String>? ingredientsIncluded,
            List<String>? allergies, String? nationality, String? diet)
        onSuggestFood,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onReset,
    TResult? Function(List<String>? ingredientsIncluded,
            List<String>? allergies, String? nationality, String? diet)?
        onSuggestFood,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onReset,
    TResult Function(List<String>? ingredientsIncluded, List<String>? allergies,
            String? nationality, String? diet)?
        onSuggestFood,
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
    required TResult Function(Reset value) onReset,
    required TResult Function(SuggestMealEvent value) onSuggestFood,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Reset value)? onReset,
    TResult? Function(SuggestMealEvent value)? onSuggestFood,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Reset value)? onReset,
    TResult Function(SuggestMealEvent value)? onSuggestFood,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements SuggestFoodEvent {
  const factory Reset() = _$Reset;
}

/// @nodoc
abstract class _$$SuggestMealEventCopyWith<$Res> {
  factory _$$SuggestMealEventCopyWith(
          _$SuggestMealEvent value, $Res Function(_$SuggestMealEvent) then) =
      __$$SuggestMealEventCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String>? ingredientsIncluded,
      List<String>? allergies,
      String? nationality,
      String? diet});
}

/// @nodoc
class __$$SuggestMealEventCopyWithImpl<$Res>
    extends _$SuggestFoodEventCopyWithImpl<$Res, _$SuggestMealEvent>
    implements _$$SuggestMealEventCopyWith<$Res> {
  __$$SuggestMealEventCopyWithImpl(
      _$SuggestMealEvent _value, $Res Function(_$SuggestMealEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientsIncluded = freezed,
    Object? allergies = freezed,
    Object? nationality = freezed,
    Object? diet = freezed,
  }) {
    return _then(_$SuggestMealEvent(
      freezed == ingredientsIncluded
          ? _value._ingredientsIncluded
          : ingredientsIncluded // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freezed == allergies
          ? _value._allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      freezed == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == diet
          ? _value.diet
          : diet // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SuggestMealEvent implements SuggestMealEvent {
  const _$SuggestMealEvent(final List<String>? ingredientsIncluded,
      final List<String>? allergies, this.nationality, this.diet)
      : _ingredientsIncluded = ingredientsIncluded,
        _allergies = allergies;

  final List<String>? _ingredientsIncluded;
  @override
  List<String>? get ingredientsIncluded {
    final value = _ingredientsIncluded;
    if (value == null) return null;
    if (_ingredientsIncluded is EqualUnmodifiableListView)
      return _ingredientsIncluded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _allergies;
  @override
  List<String>? get allergies {
    final value = _allergies;
    if (value == null) return null;
    if (_allergies is EqualUnmodifiableListView) return _allergies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? nationality;
  @override
  final String? diet;

  @override
  String toString() {
    return 'SuggestFoodEvent.onSuggestFood(ingredientsIncluded: $ingredientsIncluded, allergies: $allergies, nationality: $nationality, diet: $diet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestMealEvent &&
            const DeepCollectionEquality()
                .equals(other._ingredientsIncluded, _ingredientsIncluded) &&
            const DeepCollectionEquality()
                .equals(other._allergies, _allergies) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.diet, diet) || other.diet == diet));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_ingredientsIncluded),
      const DeepCollectionEquality().hash(_allergies),
      nationality,
      diet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestMealEventCopyWith<_$SuggestMealEvent> get copyWith =>
      __$$SuggestMealEventCopyWithImpl<_$SuggestMealEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onReset,
    required TResult Function(List<String>? ingredientsIncluded,
            List<String>? allergies, String? nationality, String? diet)
        onSuggestFood,
  }) {
    return onSuggestFood(ingredientsIncluded, allergies, nationality, diet);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onReset,
    TResult? Function(List<String>? ingredientsIncluded,
            List<String>? allergies, String? nationality, String? diet)?
        onSuggestFood,
  }) {
    return onSuggestFood?.call(
        ingredientsIncluded, allergies, nationality, diet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onReset,
    TResult Function(List<String>? ingredientsIncluded, List<String>? allergies,
            String? nationality, String? diet)?
        onSuggestFood,
    required TResult orElse(),
  }) {
    if (onSuggestFood != null) {
      return onSuggestFood(ingredientsIncluded, allergies, nationality, diet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Reset value) onReset,
    required TResult Function(SuggestMealEvent value) onSuggestFood,
  }) {
    return onSuggestFood(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Reset value)? onReset,
    TResult? Function(SuggestMealEvent value)? onSuggestFood,
  }) {
    return onSuggestFood?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Reset value)? onReset,
    TResult Function(SuggestMealEvent value)? onSuggestFood,
    required TResult orElse(),
  }) {
    if (onSuggestFood != null) {
      return onSuggestFood(this);
    }
    return orElse();
  }
}

abstract class SuggestMealEvent implements SuggestFoodEvent {
  const factory SuggestMealEvent(
      final List<String>? ingredientsIncluded,
      final List<String>? allergies,
      final String? nationality,
      final String? diet) = _$SuggestMealEvent;

  List<String>? get ingredientsIncluded;
  List<String>? get allergies;
  String? get nationality;
  String? get diet;
  @JsonKey(ignore: true)
  _$$SuggestMealEventCopyWith<_$SuggestMealEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SuggestFoodState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuggestFoodStateInitialState value) initial,
    required TResult Function(SuggestFoodStateLoadingState value) loading,
    required TResult Function(SuggestFoodStateErrorState value) error,
    required TResult Function(SuggestFoodStateLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodStateInitialState value)? initial,
    TResult? Function(SuggestFoodStateLoadingState value)? loading,
    TResult? Function(SuggestFoodStateErrorState value)? error,
    TResult? Function(SuggestFoodStateLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodStateInitialState value)? initial,
    TResult Function(SuggestFoodStateLoadingState value)? loading,
    TResult Function(SuggestFoodStateErrorState value)? error,
    TResult Function(SuggestFoodStateLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestFoodStateCopyWith<$Res> {
  factory $SuggestFoodStateCopyWith(
          SuggestFoodState value, $Res Function(SuggestFoodState) then) =
      _$SuggestFoodStateCopyWithImpl<$Res, SuggestFoodState>;
}

/// @nodoc
class _$SuggestFoodStateCopyWithImpl<$Res, $Val extends SuggestFoodState>
    implements $SuggestFoodStateCopyWith<$Res> {
  _$SuggestFoodStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuggestFoodStateInitialStateCopyWith<$Res> {
  factory _$$SuggestFoodStateInitialStateCopyWith(
          _$SuggestFoodStateInitialState value,
          $Res Function(_$SuggestFoodStateInitialState) then) =
      __$$SuggestFoodStateInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuggestFoodStateInitialStateCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res, _$SuggestFoodStateInitialState>
    implements _$$SuggestFoodStateInitialStateCopyWith<$Res> {
  __$$SuggestFoodStateInitialStateCopyWithImpl(
      _$SuggestFoodStateInitialState _value,
      $Res Function(_$SuggestFoodStateInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuggestFoodStateInitialState implements SuggestFoodStateInitialState {
  const _$SuggestFoodStateInitialState();

  @override
  String toString() {
    return 'SuggestFoodState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
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
    required TResult Function(SuggestFoodStateInitialState value) initial,
    required TResult Function(SuggestFoodStateLoadingState value) loading,
    required TResult Function(SuggestFoodStateErrorState value) error,
    required TResult Function(SuggestFoodStateLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodStateInitialState value)? initial,
    TResult? Function(SuggestFoodStateLoadingState value)? loading,
    TResult? Function(SuggestFoodStateErrorState value)? error,
    TResult? Function(SuggestFoodStateLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodStateInitialState value)? initial,
    TResult Function(SuggestFoodStateLoadingState value)? loading,
    TResult Function(SuggestFoodStateErrorState value)? error,
    TResult Function(SuggestFoodStateLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodStateInitialState implements SuggestFoodState {
  const factory SuggestFoodStateInitialState() = _$SuggestFoodStateInitialState;
}

/// @nodoc
abstract class _$$SuggestFoodStateLoadingStateCopyWith<$Res> {
  factory _$$SuggestFoodStateLoadingStateCopyWith(
          _$SuggestFoodStateLoadingState value,
          $Res Function(_$SuggestFoodStateLoadingState) then) =
      __$$SuggestFoodStateLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuggestFoodStateLoadingStateCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res, _$SuggestFoodStateLoadingState>
    implements _$$SuggestFoodStateLoadingStateCopyWith<$Res> {
  __$$SuggestFoodStateLoadingStateCopyWithImpl(
      _$SuggestFoodStateLoadingState _value,
      $Res Function(_$SuggestFoodStateLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuggestFoodStateLoadingState implements SuggestFoodStateLoadingState {
  const _$SuggestFoodStateLoadingState();

  @override
  String toString() {
    return 'SuggestFoodState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
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
    required TResult Function(SuggestFoodStateInitialState value) initial,
    required TResult Function(SuggestFoodStateLoadingState value) loading,
    required TResult Function(SuggestFoodStateErrorState value) error,
    required TResult Function(SuggestFoodStateLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodStateInitialState value)? initial,
    TResult? Function(SuggestFoodStateLoadingState value)? loading,
    TResult? Function(SuggestFoodStateErrorState value)? error,
    TResult? Function(SuggestFoodStateLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodStateInitialState value)? initial,
    TResult Function(SuggestFoodStateLoadingState value)? loading,
    TResult Function(SuggestFoodStateErrorState value)? error,
    TResult Function(SuggestFoodStateLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodStateLoadingState implements SuggestFoodState {
  const factory SuggestFoodStateLoadingState() = _$SuggestFoodStateLoadingState;
}

/// @nodoc
abstract class _$$SuggestFoodStateErrorStateCopyWith<$Res> {
  factory _$$SuggestFoodStateErrorStateCopyWith(
          _$SuggestFoodStateErrorState value,
          $Res Function(_$SuggestFoodStateErrorState) then) =
      __$$SuggestFoodStateErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuggestFoodStateErrorStateCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res, _$SuggestFoodStateErrorState>
    implements _$$SuggestFoodStateErrorStateCopyWith<$Res> {
  __$$SuggestFoodStateErrorStateCopyWithImpl(
      _$SuggestFoodStateErrorState _value,
      $Res Function(_$SuggestFoodStateErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuggestFoodStateErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuggestFoodStateErrorState implements SuggestFoodStateErrorState {
  const _$SuggestFoodStateErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SuggestFoodState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestFoodStateErrorStateCopyWith<_$SuggestFoodStateErrorState>
      get copyWith => __$$SuggestFoodStateErrorStateCopyWithImpl<
          _$SuggestFoodStateErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
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
    required TResult Function(SuggestFoodStateInitialState value) initial,
    required TResult Function(SuggestFoodStateLoadingState value) loading,
    required TResult Function(SuggestFoodStateErrorState value) error,
    required TResult Function(SuggestFoodStateLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodStateInitialState value)? initial,
    TResult? Function(SuggestFoodStateLoadingState value)? loading,
    TResult? Function(SuggestFoodStateErrorState value)? error,
    TResult? Function(SuggestFoodStateLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodStateInitialState value)? initial,
    TResult Function(SuggestFoodStateLoadingState value)? loading,
    TResult Function(SuggestFoodStateErrorState value)? error,
    TResult Function(SuggestFoodStateLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodStateErrorState implements SuggestFoodState {
  const factory SuggestFoodStateErrorState(final String message) =
      _$SuggestFoodStateErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$SuggestFoodStateErrorStateCopyWith<_$SuggestFoodStateErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuggestFoodStateLoadedStateCopyWith<$Res> {
  factory _$$SuggestFoodStateLoadedStateCopyWith(
          _$SuggestFoodStateLoadedState value,
          $Res Function(_$SuggestFoodStateLoadedState) then) =
      __$$SuggestFoodStateLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$SuggestFoodStateLoadedStateCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res, _$SuggestFoodStateLoadedState>
    implements _$$SuggestFoodStateLoadedStateCopyWith<$Res> {
  __$$SuggestFoodStateLoadedStateCopyWithImpl(
      _$SuggestFoodStateLoadedState _value,
      $Res Function(_$SuggestFoodStateLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$SuggestFoodStateLoadedState(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
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

class _$SuggestFoodStateLoadedState implements SuggestFoodStateLoadedState {
  const _$SuggestFoodStateLoadedState({required this.food});

  @override
  final Food food;

  @override
  String toString() {
    return 'SuggestFoodState.loaded(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateLoadedState &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestFoodStateLoadedStateCopyWith<_$SuggestFoodStateLoadedState>
      get copyWith => __$$SuggestFoodStateLoadedStateCopyWithImpl<
          _$SuggestFoodStateLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return loaded(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return loaded?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuggestFoodStateInitialState value) initial,
    required TResult Function(SuggestFoodStateLoadingState value) loading,
    required TResult Function(SuggestFoodStateErrorState value) error,
    required TResult Function(SuggestFoodStateLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodStateInitialState value)? initial,
    TResult? Function(SuggestFoodStateLoadingState value)? loading,
    TResult? Function(SuggestFoodStateErrorState value)? error,
    TResult? Function(SuggestFoodStateLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodStateInitialState value)? initial,
    TResult Function(SuggestFoodStateLoadingState value)? loading,
    TResult Function(SuggestFoodStateErrorState value)? error,
    TResult Function(SuggestFoodStateLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodStateLoadedState implements SuggestFoodState {
  const factory SuggestFoodStateLoadedState({required final Food food}) =
      _$SuggestFoodStateLoadedState;

  Food get food;
  @JsonKey(ignore: true)
  _$$SuggestFoodStateLoadedStateCopyWith<_$SuggestFoodStateLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}
