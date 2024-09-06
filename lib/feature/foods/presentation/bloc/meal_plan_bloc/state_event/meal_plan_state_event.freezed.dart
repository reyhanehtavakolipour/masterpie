// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_plan_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MealPlanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MealPlan mealPlan) onSaveMealPlan,
    required TResult Function() onGetMealPlans,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult? Function()? onGetMealPlans,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult Function()? onGetMealPlans,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveMealPlan value) onSaveMealPlan,
    required TResult Function(GetMealPLans value) onGetMealPlans,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveMealPlan value)? onSaveMealPlan,
    TResult? Function(GetMealPLans value)? onGetMealPlans,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveMealPlan value)? onSaveMealPlan,
    TResult Function(GetMealPLans value)? onGetMealPlans,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanEventCopyWith<$Res> {
  factory $MealPlanEventCopyWith(
          MealPlanEvent value, $Res Function(MealPlanEvent) then) =
      _$MealPlanEventCopyWithImpl<$Res, MealPlanEvent>;
}

/// @nodoc
class _$MealPlanEventCopyWithImpl<$Res, $Val extends MealPlanEvent>
    implements $MealPlanEventCopyWith<$Res> {
  _$MealPlanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SaveMealPlanImplCopyWith<$Res> {
  factory _$$SaveMealPlanImplCopyWith(
          _$SaveMealPlanImpl value, $Res Function(_$SaveMealPlanImpl) then) =
      __$$SaveMealPlanImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MealPlan mealPlan});

  $MealPlanCopyWith<$Res> get mealPlan;
}

/// @nodoc
class __$$SaveMealPlanImplCopyWithImpl<$Res>
    extends _$MealPlanEventCopyWithImpl<$Res, _$SaveMealPlanImpl>
    implements _$$SaveMealPlanImplCopyWith<$Res> {
  __$$SaveMealPlanImplCopyWithImpl(
      _$SaveMealPlanImpl _value, $Res Function(_$SaveMealPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlan = null,
  }) {
    return _then(_$SaveMealPlanImpl(
      null == mealPlan
          ? _value.mealPlan
          : mealPlan // ignore: cast_nullable_to_non_nullable
              as MealPlan,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MealPlanCopyWith<$Res> get mealPlan {
    return $MealPlanCopyWith<$Res>(_value.mealPlan, (value) {
      return _then(_value.copyWith(mealPlan: value));
    });
  }
}

/// @nodoc

class _$SaveMealPlanImpl implements SaveMealPlan {
  const _$SaveMealPlanImpl(this.mealPlan);

  @override
  final MealPlan mealPlan;

  @override
  String toString() {
    return 'MealPlanEvent.onSaveMealPlan(mealPlan: $mealPlan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveMealPlanImpl &&
            (identical(other.mealPlan, mealPlan) ||
                other.mealPlan == mealPlan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mealPlan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveMealPlanImplCopyWith<_$SaveMealPlanImpl> get copyWith =>
      __$$SaveMealPlanImplCopyWithImpl<_$SaveMealPlanImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MealPlan mealPlan) onSaveMealPlan,
    required TResult Function() onGetMealPlans,
    required TResult Function() onReset,
  }) {
    return onSaveMealPlan(mealPlan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult? Function()? onGetMealPlans,
    TResult? Function()? onReset,
  }) {
    return onSaveMealPlan?.call(mealPlan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult Function()? onGetMealPlans,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onSaveMealPlan != null) {
      return onSaveMealPlan(mealPlan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveMealPlan value) onSaveMealPlan,
    required TResult Function(GetMealPLans value) onGetMealPlans,
    required TResult Function(Reset value) onReset,
  }) {
    return onSaveMealPlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveMealPlan value)? onSaveMealPlan,
    TResult? Function(GetMealPLans value)? onGetMealPlans,
    TResult? Function(Reset value)? onReset,
  }) {
    return onSaveMealPlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveMealPlan value)? onSaveMealPlan,
    TResult Function(GetMealPLans value)? onGetMealPlans,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onSaveMealPlan != null) {
      return onSaveMealPlan(this);
    }
    return orElse();
  }
}

abstract class SaveMealPlan implements MealPlanEvent {
  const factory SaveMealPlan(final MealPlan mealPlan) = _$SaveMealPlanImpl;

  MealPlan get mealPlan;
  @JsonKey(ignore: true)
  _$$SaveMealPlanImplCopyWith<_$SaveMealPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMealPLansImplCopyWith<$Res> {
  factory _$$GetMealPLansImplCopyWith(
          _$GetMealPLansImpl value, $Res Function(_$GetMealPLansImpl) then) =
      __$$GetMealPLansImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetMealPLansImplCopyWithImpl<$Res>
    extends _$MealPlanEventCopyWithImpl<$Res, _$GetMealPLansImpl>
    implements _$$GetMealPLansImplCopyWith<$Res> {
  __$$GetMealPLansImplCopyWithImpl(
      _$GetMealPLansImpl _value, $Res Function(_$GetMealPLansImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetMealPLansImpl implements GetMealPLans {
  const _$GetMealPLansImpl();

  @override
  String toString() {
    return 'MealPlanEvent.onGetMealPlans()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetMealPLansImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(MealPlan mealPlan) onSaveMealPlan,
    required TResult Function() onGetMealPlans,
    required TResult Function() onReset,
  }) {
    return onGetMealPlans();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult? Function()? onGetMealPlans,
    TResult? Function()? onReset,
  }) {
    return onGetMealPlans?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult Function()? onGetMealPlans,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetMealPlans != null) {
      return onGetMealPlans();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SaveMealPlan value) onSaveMealPlan,
    required TResult Function(GetMealPLans value) onGetMealPlans,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetMealPlans(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveMealPlan value)? onSaveMealPlan,
    TResult? Function(GetMealPLans value)? onGetMealPlans,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetMealPlans?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveMealPlan value)? onSaveMealPlan,
    TResult Function(GetMealPLans value)? onGetMealPlans,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetMealPlans != null) {
      return onGetMealPlans(this);
    }
    return orElse();
  }
}

abstract class GetMealPLans implements MealPlanEvent {
  const factory GetMealPLans() = _$GetMealPLansImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$MealPlanEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'MealPlanEvent.onReset()';
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
    required TResult Function(MealPlan mealPlan) onSaveMealPlan,
    required TResult Function() onGetMealPlans,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult? Function()? onGetMealPlans,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(MealPlan mealPlan)? onSaveMealPlan,
    TResult Function()? onGetMealPlans,
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
    required TResult Function(SaveMealPlan value) onSaveMealPlan,
    required TResult Function(GetMealPLans value) onGetMealPlans,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SaveMealPlan value)? onSaveMealPlan,
    TResult? Function(GetMealPLans value)? onGetMealPlans,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SaveMealPlan value)? onSaveMealPlan,
    TResult Function(GetMealPLans value)? onGetMealPlans,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements MealPlanEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$MealPlanState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
    required TResult Function(List<MealPlan> mealPlans) plansLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
    TResult? Function(List<MealPlan> mealPlans)? plansLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
    TResult Function(List<MealPlan> mealPlans)? plansLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealPlanInitialState value) initial,
    required TResult Function(MealPlanLoadingState value) loading,
    required TResult Function(MealPlanErrorState value) error,
    required TResult Function(MealPlanSavedState value) loaded,
    required TResult Function(MealPlansLoadedState value) plansLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealPlanInitialState value)? initial,
    TResult? Function(MealPlanLoadingState value)? loading,
    TResult? Function(MealPlanErrorState value)? error,
    TResult? Function(MealPlanSavedState value)? loaded,
    TResult? Function(MealPlansLoadedState value)? plansLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealPlanInitialState value)? initial,
    TResult Function(MealPlanLoadingState value)? loading,
    TResult Function(MealPlanErrorState value)? error,
    TResult Function(MealPlanSavedState value)? loaded,
    TResult Function(MealPlansLoadedState value)? plansLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanStateCopyWith<$Res> {
  factory $MealPlanStateCopyWith(
          MealPlanState value, $Res Function(MealPlanState) then) =
      _$MealPlanStateCopyWithImpl<$Res, MealPlanState>;
}

/// @nodoc
class _$MealPlanStateCopyWithImpl<$Res, $Val extends MealPlanState>
    implements $MealPlanStateCopyWith<$Res> {
  _$MealPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MealPlanInitialStateImplCopyWith<$Res> {
  factory _$$MealPlanInitialStateImplCopyWith(_$MealPlanInitialStateImpl value,
          $Res Function(_$MealPlanInitialStateImpl) then) =
      __$$MealPlanInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealPlanInitialStateImplCopyWithImpl<$Res>
    extends _$MealPlanStateCopyWithImpl<$Res, _$MealPlanInitialStateImpl>
    implements _$$MealPlanInitialStateImplCopyWith<$Res> {
  __$$MealPlanInitialStateImplCopyWithImpl(_$MealPlanInitialStateImpl _value,
      $Res Function(_$MealPlanInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MealPlanInitialStateImpl implements MealPlanInitialState {
  const _$MealPlanInitialStateImpl();

  @override
  String toString() {
    return 'MealPlanState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanInitialStateImpl);
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
    required TResult Function(List<MealPlan> mealPlans) plansLoaded,
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
    TResult? Function(List<MealPlan> mealPlans)? plansLoaded,
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
    TResult Function(List<MealPlan> mealPlans)? plansLoaded,
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
    required TResult Function(MealPlanInitialState value) initial,
    required TResult Function(MealPlanLoadingState value) loading,
    required TResult Function(MealPlanErrorState value) error,
    required TResult Function(MealPlanSavedState value) loaded,
    required TResult Function(MealPlansLoadedState value) plansLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealPlanInitialState value)? initial,
    TResult? Function(MealPlanLoadingState value)? loading,
    TResult? Function(MealPlanErrorState value)? error,
    TResult? Function(MealPlanSavedState value)? loaded,
    TResult? Function(MealPlansLoadedState value)? plansLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealPlanInitialState value)? initial,
    TResult Function(MealPlanLoadingState value)? loading,
    TResult Function(MealPlanErrorState value)? error,
    TResult Function(MealPlanSavedState value)? loaded,
    TResult Function(MealPlansLoadedState value)? plansLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MealPlanInitialState implements MealPlanState {
  const factory MealPlanInitialState() = _$MealPlanInitialStateImpl;
}

/// @nodoc
abstract class _$$MealPlanLoadingStateImplCopyWith<$Res> {
  factory _$$MealPlanLoadingStateImplCopyWith(_$MealPlanLoadingStateImpl value,
          $Res Function(_$MealPlanLoadingStateImpl) then) =
      __$$MealPlanLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealPlanLoadingStateImplCopyWithImpl<$Res>
    extends _$MealPlanStateCopyWithImpl<$Res, _$MealPlanLoadingStateImpl>
    implements _$$MealPlanLoadingStateImplCopyWith<$Res> {
  __$$MealPlanLoadingStateImplCopyWithImpl(_$MealPlanLoadingStateImpl _value,
      $Res Function(_$MealPlanLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MealPlanLoadingStateImpl implements MealPlanLoadingState {
  const _$MealPlanLoadingStateImpl();

  @override
  String toString() {
    return 'MealPlanState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanLoadingStateImpl);
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
    required TResult Function(List<MealPlan> mealPlans) plansLoaded,
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
    TResult? Function(List<MealPlan> mealPlans)? plansLoaded,
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
    TResult Function(List<MealPlan> mealPlans)? plansLoaded,
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
    required TResult Function(MealPlanInitialState value) initial,
    required TResult Function(MealPlanLoadingState value) loading,
    required TResult Function(MealPlanErrorState value) error,
    required TResult Function(MealPlanSavedState value) loaded,
    required TResult Function(MealPlansLoadedState value) plansLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealPlanInitialState value)? initial,
    TResult? Function(MealPlanLoadingState value)? loading,
    TResult? Function(MealPlanErrorState value)? error,
    TResult? Function(MealPlanSavedState value)? loaded,
    TResult? Function(MealPlansLoadedState value)? plansLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealPlanInitialState value)? initial,
    TResult Function(MealPlanLoadingState value)? loading,
    TResult Function(MealPlanErrorState value)? error,
    TResult Function(MealPlanSavedState value)? loaded,
    TResult Function(MealPlansLoadedState value)? plansLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MealPlanLoadingState implements MealPlanState {
  const factory MealPlanLoadingState() = _$MealPlanLoadingStateImpl;
}

/// @nodoc
abstract class _$$MealPlanErrorStateImplCopyWith<$Res> {
  factory _$$MealPlanErrorStateImplCopyWith(_$MealPlanErrorStateImpl value,
          $Res Function(_$MealPlanErrorStateImpl) then) =
      __$$MealPlanErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MealPlanErrorStateImplCopyWithImpl<$Res>
    extends _$MealPlanStateCopyWithImpl<$Res, _$MealPlanErrorStateImpl>
    implements _$$MealPlanErrorStateImplCopyWith<$Res> {
  __$$MealPlanErrorStateImplCopyWithImpl(_$MealPlanErrorStateImpl _value,
      $Res Function(_$MealPlanErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MealPlanErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MealPlanErrorStateImpl implements MealPlanErrorState {
  const _$MealPlanErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MealPlanState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanErrorStateImplCopyWith<_$MealPlanErrorStateImpl> get copyWith =>
      __$$MealPlanErrorStateImplCopyWithImpl<_$MealPlanErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
    required TResult Function(List<MealPlan> mealPlans) plansLoaded,
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
    TResult? Function(List<MealPlan> mealPlans)? plansLoaded,
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
    TResult Function(List<MealPlan> mealPlans)? plansLoaded,
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
    required TResult Function(MealPlanInitialState value) initial,
    required TResult Function(MealPlanLoadingState value) loading,
    required TResult Function(MealPlanErrorState value) error,
    required TResult Function(MealPlanSavedState value) loaded,
    required TResult Function(MealPlansLoadedState value) plansLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealPlanInitialState value)? initial,
    TResult? Function(MealPlanLoadingState value)? loading,
    TResult? Function(MealPlanErrorState value)? error,
    TResult? Function(MealPlanSavedState value)? loaded,
    TResult? Function(MealPlansLoadedState value)? plansLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealPlanInitialState value)? initial,
    TResult Function(MealPlanLoadingState value)? loading,
    TResult Function(MealPlanErrorState value)? error,
    TResult Function(MealPlanSavedState value)? loaded,
    TResult Function(MealPlansLoadedState value)? plansLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MealPlanErrorState implements MealPlanState {
  const factory MealPlanErrorState(final String message) =
      _$MealPlanErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$MealPlanErrorStateImplCopyWith<_$MealPlanErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MealPlanSavedStateImplCopyWith<$Res> {
  factory _$$MealPlanSavedStateImplCopyWith(_$MealPlanSavedStateImpl value,
          $Res Function(_$MealPlanSavedStateImpl) then) =
      __$$MealPlanSavedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MealPlanSavedStateImplCopyWithImpl<$Res>
    extends _$MealPlanStateCopyWithImpl<$Res, _$MealPlanSavedStateImpl>
    implements _$$MealPlanSavedStateImplCopyWith<$Res> {
  __$$MealPlanSavedStateImplCopyWithImpl(_$MealPlanSavedStateImpl _value,
      $Res Function(_$MealPlanSavedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MealPlanSavedStateImpl implements MealPlanSavedState {
  const _$MealPlanSavedStateImpl();

  @override
  String toString() {
    return 'MealPlanState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MealPlanSavedStateImpl);
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
    required TResult Function(List<MealPlan> mealPlans) plansLoaded,
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
    TResult? Function(List<MealPlan> mealPlans)? plansLoaded,
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
    TResult Function(List<MealPlan> mealPlans)? plansLoaded,
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
    required TResult Function(MealPlanInitialState value) initial,
    required TResult Function(MealPlanLoadingState value) loading,
    required TResult Function(MealPlanErrorState value) error,
    required TResult Function(MealPlanSavedState value) loaded,
    required TResult Function(MealPlansLoadedState value) plansLoaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealPlanInitialState value)? initial,
    TResult? Function(MealPlanLoadingState value)? loading,
    TResult? Function(MealPlanErrorState value)? error,
    TResult? Function(MealPlanSavedState value)? loaded,
    TResult? Function(MealPlansLoadedState value)? plansLoaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealPlanInitialState value)? initial,
    TResult Function(MealPlanLoadingState value)? loading,
    TResult Function(MealPlanErrorState value)? error,
    TResult Function(MealPlanSavedState value)? loaded,
    TResult Function(MealPlansLoadedState value)? plansLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MealPlanSavedState implements MealPlanState {
  const factory MealPlanSavedState() = _$MealPlanSavedStateImpl;
}

/// @nodoc
abstract class _$$MealPlansLoadedStateImplCopyWith<$Res> {
  factory _$$MealPlansLoadedStateImplCopyWith(_$MealPlansLoadedStateImpl value,
          $Res Function(_$MealPlansLoadedStateImpl) then) =
      __$$MealPlansLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MealPlan> mealPlans});
}

/// @nodoc
class __$$MealPlansLoadedStateImplCopyWithImpl<$Res>
    extends _$MealPlanStateCopyWithImpl<$Res, _$MealPlansLoadedStateImpl>
    implements _$$MealPlansLoadedStateImplCopyWith<$Res> {
  __$$MealPlansLoadedStateImplCopyWithImpl(_$MealPlansLoadedStateImpl _value,
      $Res Function(_$MealPlansLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlans = null,
  }) {
    return _then(_$MealPlansLoadedStateImpl(
      null == mealPlans
          ? _value._mealPlans
          : mealPlans // ignore: cast_nullable_to_non_nullable
              as List<MealPlan>,
    ));
  }
}

/// @nodoc

class _$MealPlansLoadedStateImpl implements MealPlansLoadedState {
  const _$MealPlansLoadedStateImpl(final List<MealPlan> mealPlans)
      : _mealPlans = mealPlans;

  final List<MealPlan> _mealPlans;
  @override
  List<MealPlan> get mealPlans {
    if (_mealPlans is EqualUnmodifiableListView) return _mealPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mealPlans);
  }

  @override
  String toString() {
    return 'MealPlanState.plansLoaded(mealPlans: $mealPlans)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlansLoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._mealPlans, _mealPlans));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_mealPlans));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlansLoadedStateImplCopyWith<_$MealPlansLoadedStateImpl>
      get copyWith =>
          __$$MealPlansLoadedStateImplCopyWithImpl<_$MealPlansLoadedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() loaded,
    required TResult Function(List<MealPlan> mealPlans) plansLoaded,
  }) {
    return plansLoaded(mealPlans);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? loaded,
    TResult? Function(List<MealPlan> mealPlans)? plansLoaded,
  }) {
    return plansLoaded?.call(mealPlans);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? loaded,
    TResult Function(List<MealPlan> mealPlans)? plansLoaded,
    required TResult orElse(),
  }) {
    if (plansLoaded != null) {
      return plansLoaded(mealPlans);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MealPlanInitialState value) initial,
    required TResult Function(MealPlanLoadingState value) loading,
    required TResult Function(MealPlanErrorState value) error,
    required TResult Function(MealPlanSavedState value) loaded,
    required TResult Function(MealPlansLoadedState value) plansLoaded,
  }) {
    return plansLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MealPlanInitialState value)? initial,
    TResult? Function(MealPlanLoadingState value)? loading,
    TResult? Function(MealPlanErrorState value)? error,
    TResult? Function(MealPlanSavedState value)? loaded,
    TResult? Function(MealPlansLoadedState value)? plansLoaded,
  }) {
    return plansLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MealPlanInitialState value)? initial,
    TResult Function(MealPlanLoadingState value)? loading,
    TResult Function(MealPlanErrorState value)? error,
    TResult Function(MealPlanSavedState value)? loaded,
    TResult Function(MealPlansLoadedState value)? plansLoaded,
    required TResult orElse(),
  }) {
    if (plansLoaded != null) {
      return plansLoaded(this);
    }
    return orElse();
  }
}

abstract class MealPlansLoadedState implements MealPlanState {
  const factory MealPlansLoadedState(final List<MealPlan> mealPlans) =
      _$MealPlansLoadedStateImpl;

  List<MealPlan> get mealPlans;
  @JsonKey(ignore: true)
  _$$MealPlansLoadedStateImplCopyWith<_$MealPlansLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
