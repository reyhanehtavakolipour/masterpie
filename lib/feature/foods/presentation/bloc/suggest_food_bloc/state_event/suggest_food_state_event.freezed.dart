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
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$SuggestFoodEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'SuggestFoodEvent.onReset()';
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
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$SuggestMealEventImplCopyWith<$Res> {
  factory _$$SuggestMealEventImplCopyWith(_$SuggestMealEventImpl value,
          $Res Function(_$SuggestMealEventImpl) then) =
      __$$SuggestMealEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<String>? ingredientsIncluded,
      List<String>? allergies,
      String? nationality,
      String? diet});
}

/// @nodoc
class __$$SuggestMealEventImplCopyWithImpl<$Res>
    extends _$SuggestFoodEventCopyWithImpl<$Res, _$SuggestMealEventImpl>
    implements _$$SuggestMealEventImplCopyWith<$Res> {
  __$$SuggestMealEventImplCopyWithImpl(_$SuggestMealEventImpl _value,
      $Res Function(_$SuggestMealEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ingredientsIncluded = freezed,
    Object? allergies = freezed,
    Object? nationality = freezed,
    Object? diet = freezed,
  }) {
    return _then(_$SuggestMealEventImpl(
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

class _$SuggestMealEventImpl implements SuggestMealEvent {
  const _$SuggestMealEventImpl(final List<String>? ingredientsIncluded,
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestMealEventImpl &&
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
  _$$SuggestMealEventImplCopyWith<_$SuggestMealEventImpl> get copyWith =>
      __$$SuggestMealEventImplCopyWithImpl<_$SuggestMealEventImpl>(
          this, _$identity);

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
      final String? diet) = _$SuggestMealEventImpl;

  List<String>? get ingredientsIncluded;
  List<String>? get allergies;
  String? get nationality;
  String? get diet;
  @JsonKey(ignore: true)
  _$$SuggestMealEventImplCopyWith<_$SuggestMealEventImpl> get copyWith =>
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
abstract class _$$SuggestFoodStateInitialStateImplCopyWith<$Res> {
  factory _$$SuggestFoodStateInitialStateImplCopyWith(
          _$SuggestFoodStateInitialStateImpl value,
          $Res Function(_$SuggestFoodStateInitialStateImpl) then) =
      __$$SuggestFoodStateInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuggestFoodStateInitialStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res,
        _$SuggestFoodStateInitialStateImpl>
    implements _$$SuggestFoodStateInitialStateImplCopyWith<$Res> {
  __$$SuggestFoodStateInitialStateImplCopyWithImpl(
      _$SuggestFoodStateInitialStateImpl _value,
      $Res Function(_$SuggestFoodStateInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuggestFoodStateInitialStateImpl
    implements SuggestFoodStateInitialState {
  const _$SuggestFoodStateInitialStateImpl();

  @override
  String toString() {
    return 'SuggestFoodState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateInitialStateImpl);
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
  const factory SuggestFoodStateInitialState() =
      _$SuggestFoodStateInitialStateImpl;
}

/// @nodoc
abstract class _$$SuggestFoodStateLoadingStateImplCopyWith<$Res> {
  factory _$$SuggestFoodStateLoadingStateImplCopyWith(
          _$SuggestFoodStateLoadingStateImpl value,
          $Res Function(_$SuggestFoodStateLoadingStateImpl) then) =
      __$$SuggestFoodStateLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuggestFoodStateLoadingStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res,
        _$SuggestFoodStateLoadingStateImpl>
    implements _$$SuggestFoodStateLoadingStateImplCopyWith<$Res> {
  __$$SuggestFoodStateLoadingStateImplCopyWithImpl(
      _$SuggestFoodStateLoadingStateImpl _value,
      $Res Function(_$SuggestFoodStateLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuggestFoodStateLoadingStateImpl
    implements SuggestFoodStateLoadingState {
  const _$SuggestFoodStateLoadingStateImpl();

  @override
  String toString() {
    return 'SuggestFoodState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateLoadingStateImpl);
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
  const factory SuggestFoodStateLoadingState() =
      _$SuggestFoodStateLoadingStateImpl;
}

/// @nodoc
abstract class _$$SuggestFoodStateErrorStateImplCopyWith<$Res> {
  factory _$$SuggestFoodStateErrorStateImplCopyWith(
          _$SuggestFoodStateErrorStateImpl value,
          $Res Function(_$SuggestFoodStateErrorStateImpl) then) =
      __$$SuggestFoodStateErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuggestFoodStateErrorStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res,
        _$SuggestFoodStateErrorStateImpl>
    implements _$$SuggestFoodStateErrorStateImplCopyWith<$Res> {
  __$$SuggestFoodStateErrorStateImplCopyWithImpl(
      _$SuggestFoodStateErrorStateImpl _value,
      $Res Function(_$SuggestFoodStateErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuggestFoodStateErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuggestFoodStateErrorStateImpl implements SuggestFoodStateErrorState {
  const _$SuggestFoodStateErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SuggestFoodState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestFoodStateErrorStateImplCopyWith<_$SuggestFoodStateErrorStateImpl>
      get copyWith => __$$SuggestFoodStateErrorStateImplCopyWithImpl<
          _$SuggestFoodStateErrorStateImpl>(this, _$identity);

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
      _$SuggestFoodStateErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SuggestFoodStateErrorStateImplCopyWith<_$SuggestFoodStateErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuggestFoodStateLoadedStateImplCopyWith<$Res> {
  factory _$$SuggestFoodStateLoadedStateImplCopyWith(
          _$SuggestFoodStateLoadedStateImpl value,
          $Res Function(_$SuggestFoodStateLoadedStateImpl) then) =
      __$$SuggestFoodStateLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$SuggestFoodStateLoadedStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodStateCopyWithImpl<$Res,
        _$SuggestFoodStateLoadedStateImpl>
    implements _$$SuggestFoodStateLoadedStateImplCopyWith<$Res> {
  __$$SuggestFoodStateLoadedStateImplCopyWithImpl(
      _$SuggestFoodStateLoadedStateImpl _value,
      $Res Function(_$SuggestFoodStateLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$SuggestFoodStateLoadedStateImpl(
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

class _$SuggestFoodStateLoadedStateImpl implements SuggestFoodStateLoadedState {
  const _$SuggestFoodStateLoadedStateImpl({required this.food});

  @override
  final Food food;

  @override
  String toString() {
    return 'SuggestFoodState.loaded(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodStateLoadedStateImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestFoodStateLoadedStateImplCopyWith<_$SuggestFoodStateLoadedStateImpl>
      get copyWith => __$$SuggestFoodStateLoadedStateImplCopyWithImpl<
          _$SuggestFoodStateLoadedStateImpl>(this, _$identity);

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
      _$SuggestFoodStateLoadedStateImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$SuggestFoodStateLoadedStateImplCopyWith<_$SuggestFoodStateLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
