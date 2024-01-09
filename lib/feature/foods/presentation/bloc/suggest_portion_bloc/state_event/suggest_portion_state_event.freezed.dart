// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggest_portion_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestFoodsPortionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onReset,
    required TResult Function(
            List<Food> foods,
            List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange,
            List<String> restriction)
        onSuggestFoodsPortion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onReset,
    TResult? Function(List<Food> foods, List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange, List<String> restriction)?
        onSuggestFoodsPortion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onReset,
    TResult Function(List<Food> foods, List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange, List<String> restriction)?
        onSuggestFoodsPortion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Reset value) onReset,
    required TResult Function(SuggestPortionsEvent value) onSuggestFoodsPortion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Reset value)? onReset,
    TResult? Function(SuggestPortionsEvent value)? onSuggestFoodsPortion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Reset value)? onReset,
    TResult Function(SuggestPortionsEvent value)? onSuggestFoodsPortion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestFoodsPortionEventCopyWith<$Res> {
  factory $SuggestFoodsPortionEventCopyWith(SuggestFoodsPortionEvent value,
          $Res Function(SuggestFoodsPortionEvent) then) =
      _$SuggestFoodsPortionEventCopyWithImpl<$Res, SuggestFoodsPortionEvent>;
}

/// @nodoc
class _$SuggestFoodsPortionEventCopyWithImpl<$Res,
        $Val extends SuggestFoodsPortionEvent>
    implements $SuggestFoodsPortionEventCopyWith<$Res> {
  _$SuggestFoodsPortionEventCopyWithImpl(this._value, this._then);

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
    extends _$SuggestFoodsPortionEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'SuggestFoodsPortionEvent.onReset()';
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
    required TResult Function(
            List<Food> foods,
            List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange,
            List<String> restriction)
        onSuggestFoodsPortion,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onReset,
    TResult? Function(List<Food> foods, List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange, List<String> restriction)?
        onSuggestFoodsPortion,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onReset,
    TResult Function(List<Food> foods, List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange, List<String> restriction)?
        onSuggestFoodsPortion,
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
    required TResult Function(SuggestPortionsEvent value) onSuggestFoodsPortion,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Reset value)? onReset,
    TResult? Function(SuggestPortionsEvent value)? onSuggestFoodsPortion,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Reset value)? onReset,
    TResult Function(SuggestPortionsEvent value)? onSuggestFoodsPortion,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements SuggestFoodsPortionEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
abstract class _$$SuggestPortionsEventImplCopyWith<$Res> {
  factory _$$SuggestPortionsEventImplCopyWith(_$SuggestPortionsEventImpl value,
          $Res Function(_$SuggestPortionsEventImpl) then) =
      __$$SuggestPortionsEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<Food> foods,
      List<List<double>> servingsRange,
      List<List<double>> macroGoalsRange,
      List<String> restriction});
}

/// @nodoc
class __$$SuggestPortionsEventImplCopyWithImpl<$Res>
    extends _$SuggestFoodsPortionEventCopyWithImpl<$Res,
        _$SuggestPortionsEventImpl>
    implements _$$SuggestPortionsEventImplCopyWith<$Res> {
  __$$SuggestPortionsEventImplCopyWithImpl(_$SuggestPortionsEventImpl _value,
      $Res Function(_$SuggestPortionsEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? servingsRange = null,
    Object? macroGoalsRange = null,
    Object? restriction = null,
  }) {
    return _then(_$SuggestPortionsEventImpl(
      null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      null == servingsRange
          ? _value._servingsRange
          : servingsRange // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      null == macroGoalsRange
          ? _value._macroGoalsRange
          : macroGoalsRange // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      null == restriction
          ? _value._restriction
          : restriction // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$SuggestPortionsEventImpl implements SuggestPortionsEvent {
  const _$SuggestPortionsEventImpl(
      final List<Food> foods,
      final List<List<double>> servingsRange,
      final List<List<double>> macroGoalsRange,
      final List<String> restriction)
      : _foods = foods,
        _servingsRange = servingsRange,
        _macroGoalsRange = macroGoalsRange,
        _restriction = restriction;

  final List<Food> _foods;
  @override
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<List<double>> _servingsRange;
  @override
  List<List<double>> get servingsRange {
    if (_servingsRange is EqualUnmodifiableListView) return _servingsRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servingsRange);
  }

  final List<List<double>> _macroGoalsRange;
  @override
  List<List<double>> get macroGoalsRange {
    if (_macroGoalsRange is EqualUnmodifiableListView) return _macroGoalsRange;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_macroGoalsRange);
  }

  final List<String> _restriction;
  @override
  List<String> get restriction {
    if (_restriction is EqualUnmodifiableListView) return _restriction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restriction);
  }

  @override
  String toString() {
    return 'SuggestFoodsPortionEvent.onSuggestFoodsPortion(foods: $foods, servingsRange: $servingsRange, macroGoalsRange: $macroGoalsRange, restriction: $restriction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestPortionsEventImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality()
                .equals(other._servingsRange, _servingsRange) &&
            const DeepCollectionEquality()
                .equals(other._macroGoalsRange, _macroGoalsRange) &&
            const DeepCollectionEquality()
                .equals(other._restriction, _restriction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foods),
      const DeepCollectionEquality().hash(_servingsRange),
      const DeepCollectionEquality().hash(_macroGoalsRange),
      const DeepCollectionEquality().hash(_restriction));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestPortionsEventImplCopyWith<_$SuggestPortionsEventImpl>
      get copyWith =>
          __$$SuggestPortionsEventImplCopyWithImpl<_$SuggestPortionsEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onReset,
    required TResult Function(
            List<Food> foods,
            List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange,
            List<String> restriction)
        onSuggestFoodsPortion,
  }) {
    return onSuggestFoodsPortion(
        foods, servingsRange, macroGoalsRange, restriction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onReset,
    TResult? Function(List<Food> foods, List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange, List<String> restriction)?
        onSuggestFoodsPortion,
  }) {
    return onSuggestFoodsPortion?.call(
        foods, servingsRange, macroGoalsRange, restriction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onReset,
    TResult Function(List<Food> foods, List<List<double>> servingsRange,
            List<List<double>> macroGoalsRange, List<String> restriction)?
        onSuggestFoodsPortion,
    required TResult orElse(),
  }) {
    if (onSuggestFoodsPortion != null) {
      return onSuggestFoodsPortion(
          foods, servingsRange, macroGoalsRange, restriction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Reset value) onReset,
    required TResult Function(SuggestPortionsEvent value) onSuggestFoodsPortion,
  }) {
    return onSuggestFoodsPortion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Reset value)? onReset,
    TResult? Function(SuggestPortionsEvent value)? onSuggestFoodsPortion,
  }) {
    return onSuggestFoodsPortion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Reset value)? onReset,
    TResult Function(SuggestPortionsEvent value)? onSuggestFoodsPortion,
    required TResult orElse(),
  }) {
    if (onSuggestFoodsPortion != null) {
      return onSuggestFoodsPortion(this);
    }
    return orElse();
  }
}

abstract class SuggestPortionsEvent implements SuggestFoodsPortionEvent {
  const factory SuggestPortionsEvent(
      final List<Food> foods,
      final List<List<double>> servingsRange,
      final List<List<double>> macroGoalsRange,
      final List<String> restriction) = _$SuggestPortionsEventImpl;

  List<Food> get foods;
  List<List<double>> get servingsRange;
  List<List<double>> get macroGoalsRange;
  List<String> get restriction;
  @JsonKey(ignore: true)
  _$$SuggestPortionsEventImplCopyWith<_$SuggestPortionsEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SuggestFoodsPortionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(
            List<SuggestedFoodsPortion> suggestedFoodsPortions)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuggestFoodsPortionInitialState value) initial,
    required TResult Function(SuggestFoodsPortionLoadingState value) loading,
    required TResult Function(SuggestFoodsPortionErrorState value) error,
    required TResult Function(SuggestFoodsPortionLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodsPortionInitialState value)? initial,
    TResult? Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult? Function(SuggestFoodsPortionErrorState value)? error,
    TResult? Function(SuggestFoodsPortionLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodsPortionInitialState value)? initial,
    TResult Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult Function(SuggestFoodsPortionErrorState value)? error,
    TResult Function(SuggestFoodsPortionLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestFoodsPortionStateCopyWith<$Res> {
  factory $SuggestFoodsPortionStateCopyWith(SuggestFoodsPortionState value,
          $Res Function(SuggestFoodsPortionState) then) =
      _$SuggestFoodsPortionStateCopyWithImpl<$Res, SuggestFoodsPortionState>;
}

/// @nodoc
class _$SuggestFoodsPortionStateCopyWithImpl<$Res,
        $Val extends SuggestFoodsPortionState>
    implements $SuggestFoodsPortionStateCopyWith<$Res> {
  _$SuggestFoodsPortionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SuggestFoodsPortionInitialStateImplCopyWith<$Res> {
  factory _$$SuggestFoodsPortionInitialStateImplCopyWith(
          _$SuggestFoodsPortionInitialStateImpl value,
          $Res Function(_$SuggestFoodsPortionInitialStateImpl) then) =
      __$$SuggestFoodsPortionInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuggestFoodsPortionInitialStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodsPortionStateCopyWithImpl<$Res,
        _$SuggestFoodsPortionInitialStateImpl>
    implements _$$SuggestFoodsPortionInitialStateImplCopyWith<$Res> {
  __$$SuggestFoodsPortionInitialStateImplCopyWithImpl(
      _$SuggestFoodsPortionInitialStateImpl _value,
      $Res Function(_$SuggestFoodsPortionInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuggestFoodsPortionInitialStateImpl
    implements SuggestFoodsPortionInitialState {
  const _$SuggestFoodsPortionInitialStateImpl();

  @override
  String toString() {
    return 'SuggestFoodsPortionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodsPortionInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(
            List<SuggestedFoodsPortion> suggestedFoodsPortions)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
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
    required TResult Function(SuggestFoodsPortionInitialState value) initial,
    required TResult Function(SuggestFoodsPortionLoadingState value) loading,
    required TResult Function(SuggestFoodsPortionErrorState value) error,
    required TResult Function(SuggestFoodsPortionLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodsPortionInitialState value)? initial,
    TResult? Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult? Function(SuggestFoodsPortionErrorState value)? error,
    TResult? Function(SuggestFoodsPortionLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodsPortionInitialState value)? initial,
    TResult Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult Function(SuggestFoodsPortionErrorState value)? error,
    TResult Function(SuggestFoodsPortionLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodsPortionInitialState
    implements SuggestFoodsPortionState {
  const factory SuggestFoodsPortionInitialState() =
      _$SuggestFoodsPortionInitialStateImpl;
}

/// @nodoc
abstract class _$$SuggestFoodsPortionLoadingStateImplCopyWith<$Res> {
  factory _$$SuggestFoodsPortionLoadingStateImplCopyWith(
          _$SuggestFoodsPortionLoadingStateImpl value,
          $Res Function(_$SuggestFoodsPortionLoadingStateImpl) then) =
      __$$SuggestFoodsPortionLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuggestFoodsPortionLoadingStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodsPortionStateCopyWithImpl<$Res,
        _$SuggestFoodsPortionLoadingStateImpl>
    implements _$$SuggestFoodsPortionLoadingStateImplCopyWith<$Res> {
  __$$SuggestFoodsPortionLoadingStateImplCopyWithImpl(
      _$SuggestFoodsPortionLoadingStateImpl _value,
      $Res Function(_$SuggestFoodsPortionLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuggestFoodsPortionLoadingStateImpl
    implements SuggestFoodsPortionLoadingState {
  const _$SuggestFoodsPortionLoadingStateImpl();

  @override
  String toString() {
    return 'SuggestFoodsPortionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodsPortionLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(
            List<SuggestedFoodsPortion> suggestedFoodsPortions)
        loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
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
    required TResult Function(SuggestFoodsPortionInitialState value) initial,
    required TResult Function(SuggestFoodsPortionLoadingState value) loading,
    required TResult Function(SuggestFoodsPortionErrorState value) error,
    required TResult Function(SuggestFoodsPortionLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodsPortionInitialState value)? initial,
    TResult? Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult? Function(SuggestFoodsPortionErrorState value)? error,
    TResult? Function(SuggestFoodsPortionLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodsPortionInitialState value)? initial,
    TResult Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult Function(SuggestFoodsPortionErrorState value)? error,
    TResult Function(SuggestFoodsPortionLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodsPortionLoadingState
    implements SuggestFoodsPortionState {
  const factory SuggestFoodsPortionLoadingState() =
      _$SuggestFoodsPortionLoadingStateImpl;
}

/// @nodoc
abstract class _$$SuggestFoodsPortionErrorStateImplCopyWith<$Res> {
  factory _$$SuggestFoodsPortionErrorStateImplCopyWith(
          _$SuggestFoodsPortionErrorStateImpl value,
          $Res Function(_$SuggestFoodsPortionErrorStateImpl) then) =
      __$$SuggestFoodsPortionErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SuggestFoodsPortionErrorStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodsPortionStateCopyWithImpl<$Res,
        _$SuggestFoodsPortionErrorStateImpl>
    implements _$$SuggestFoodsPortionErrorStateImplCopyWith<$Res> {
  __$$SuggestFoodsPortionErrorStateImplCopyWithImpl(
      _$SuggestFoodsPortionErrorStateImpl _value,
      $Res Function(_$SuggestFoodsPortionErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SuggestFoodsPortionErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuggestFoodsPortionErrorStateImpl
    implements SuggestFoodsPortionErrorState {
  const _$SuggestFoodsPortionErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SuggestFoodsPortionState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodsPortionErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestFoodsPortionErrorStateImplCopyWith<
          _$SuggestFoodsPortionErrorStateImpl>
      get copyWith => __$$SuggestFoodsPortionErrorStateImplCopyWithImpl<
          _$SuggestFoodsPortionErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(
            List<SuggestedFoodsPortion> suggestedFoodsPortions)
        loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
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
    required TResult Function(SuggestFoodsPortionInitialState value) initial,
    required TResult Function(SuggestFoodsPortionLoadingState value) loading,
    required TResult Function(SuggestFoodsPortionErrorState value) error,
    required TResult Function(SuggestFoodsPortionLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodsPortionInitialState value)? initial,
    TResult? Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult? Function(SuggestFoodsPortionErrorState value)? error,
    TResult? Function(SuggestFoodsPortionLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodsPortionInitialState value)? initial,
    TResult Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult Function(SuggestFoodsPortionErrorState value)? error,
    TResult Function(SuggestFoodsPortionLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodsPortionErrorState
    implements SuggestFoodsPortionState {
  const factory SuggestFoodsPortionErrorState(final String message) =
      _$SuggestFoodsPortionErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SuggestFoodsPortionErrorStateImplCopyWith<
          _$SuggestFoodsPortionErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuggestFoodsPortionLoadedStateImplCopyWith<$Res> {
  factory _$$SuggestFoodsPortionLoadedStateImplCopyWith(
          _$SuggestFoodsPortionLoadedStateImpl value,
          $Res Function(_$SuggestFoodsPortionLoadedStateImpl) then) =
      __$$SuggestFoodsPortionLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SuggestedFoodsPortion> suggestedFoodsPortions});
}

/// @nodoc
class __$$SuggestFoodsPortionLoadedStateImplCopyWithImpl<$Res>
    extends _$SuggestFoodsPortionStateCopyWithImpl<$Res,
        _$SuggestFoodsPortionLoadedStateImpl>
    implements _$$SuggestFoodsPortionLoadedStateImplCopyWith<$Res> {
  __$$SuggestFoodsPortionLoadedStateImplCopyWithImpl(
      _$SuggestFoodsPortionLoadedStateImpl _value,
      $Res Function(_$SuggestFoodsPortionLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestedFoodsPortions = null,
  }) {
    return _then(_$SuggestFoodsPortionLoadedStateImpl(
      suggestedFoodsPortions: null == suggestedFoodsPortions
          ? _value._suggestedFoodsPortions
          : suggestedFoodsPortions // ignore: cast_nullable_to_non_nullable
              as List<SuggestedFoodsPortion>,
    ));
  }
}

/// @nodoc

class _$SuggestFoodsPortionLoadedStateImpl
    implements SuggestFoodsPortionLoadedState {
  const _$SuggestFoodsPortionLoadedStateImpl(
      {required final List<SuggestedFoodsPortion> suggestedFoodsPortions})
      : _suggestedFoodsPortions = suggestedFoodsPortions;

  final List<SuggestedFoodsPortion> _suggestedFoodsPortions;
  @override
  List<SuggestedFoodsPortion> get suggestedFoodsPortions {
    if (_suggestedFoodsPortions is EqualUnmodifiableListView)
      return _suggestedFoodsPortions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestedFoodsPortions);
  }

  @override
  String toString() {
    return 'SuggestFoodsPortionState.loaded(suggestedFoodsPortions: $suggestedFoodsPortions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestFoodsPortionLoadedStateImpl &&
            const DeepCollectionEquality().equals(
                other._suggestedFoodsPortions, _suggestedFoodsPortions));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_suggestedFoodsPortions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestFoodsPortionLoadedStateImplCopyWith<
          _$SuggestFoodsPortionLoadedStateImpl>
      get copyWith => __$$SuggestFoodsPortionLoadedStateImplCopyWithImpl<
          _$SuggestFoodsPortionLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(
            List<SuggestedFoodsPortion> suggestedFoodsPortions)
        loaded,
  }) {
    return loaded(suggestedFoodsPortions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
  }) {
    return loaded?.call(suggestedFoodsPortions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SuggestedFoodsPortion> suggestedFoodsPortions)?
        loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(suggestedFoodsPortions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SuggestFoodsPortionInitialState value) initial,
    required TResult Function(SuggestFoodsPortionLoadingState value) loading,
    required TResult Function(SuggestFoodsPortionErrorState value) error,
    required TResult Function(SuggestFoodsPortionLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SuggestFoodsPortionInitialState value)? initial,
    TResult? Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult? Function(SuggestFoodsPortionErrorState value)? error,
    TResult? Function(SuggestFoodsPortionLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SuggestFoodsPortionInitialState value)? initial,
    TResult Function(SuggestFoodsPortionLoadingState value)? loading,
    TResult Function(SuggestFoodsPortionErrorState value)? error,
    TResult Function(SuggestFoodsPortionLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SuggestFoodsPortionLoadedState
    implements SuggestFoodsPortionState {
  const factory SuggestFoodsPortionLoadedState(
          {required final List<SuggestedFoodsPortion> suggestedFoodsPortions}) =
      _$SuggestFoodsPortionLoadedStateImpl;

  List<SuggestedFoodsPortion> get suggestedFoodsPortions;
  @JsonKey(ignore: true)
  _$$SuggestFoodsPortionLoadedStateImplCopyWith<
          _$SuggestFoodsPortionLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
