// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String plan) onUpdateUserPlan,
    required TResult Function() onGetUserPlan,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String plan)? onUpdateUserPlan,
    TResult? Function()? onGetUserPlan,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plan)? onUpdateUserPlan,
    TResult Function()? onGetUserPlan,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserPlanEvent value) onUpdateUserPlan,
    required TResult Function(GetUserPlanEvent value) onGetUserPlan,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult? Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanEventCopyWith<$Res> {
  factory $PlanEventCopyWith(PlanEvent value, $Res Function(PlanEvent) then) =
      _$PlanEventCopyWithImpl<$Res, PlanEvent>;
}

/// @nodoc
class _$PlanEventCopyWithImpl<$Res, $Val extends PlanEvent>
    implements $PlanEventCopyWith<$Res> {
  _$PlanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UpdateUserPlanEventCopyWith<$Res> {
  factory _$$UpdateUserPlanEventCopyWith(_$UpdateUserPlanEvent value,
          $Res Function(_$UpdateUserPlanEvent) then) =
      __$$UpdateUserPlanEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String plan});
}

/// @nodoc
class __$$UpdateUserPlanEventCopyWithImpl<$Res>
    extends _$PlanEventCopyWithImpl<$Res, _$UpdateUserPlanEvent>
    implements _$$UpdateUserPlanEventCopyWith<$Res> {
  __$$UpdateUserPlanEventCopyWithImpl(
      _$UpdateUserPlanEvent _value, $Res Function(_$UpdateUserPlanEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
  }) {
    return _then(_$UpdateUserPlanEvent(
      null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateUserPlanEvent implements UpdateUserPlanEvent {
  const _$UpdateUserPlanEvent(this.plan);

  @override
  final String plan;

  @override
  String toString() {
    return 'PlanEvent.onUpdateUserPlan(plan: $plan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserPlanEvent &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserPlanEventCopyWith<_$UpdateUserPlanEvent> get copyWith =>
      __$$UpdateUserPlanEventCopyWithImpl<_$UpdateUserPlanEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String plan) onUpdateUserPlan,
    required TResult Function() onGetUserPlan,
    required TResult Function() onReset,
  }) {
    return onUpdateUserPlan(plan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String plan)? onUpdateUserPlan,
    TResult? Function()? onGetUserPlan,
    TResult? Function()? onReset,
  }) {
    return onUpdateUserPlan?.call(plan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plan)? onUpdateUserPlan,
    TResult Function()? onGetUserPlan,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onUpdateUserPlan != null) {
      return onUpdateUserPlan(plan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserPlanEvent value) onUpdateUserPlan,
    required TResult Function(GetUserPlanEvent value) onGetUserPlan,
    required TResult Function(Reset value) onReset,
  }) {
    return onUpdateUserPlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult? Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult? Function(Reset value)? onReset,
  }) {
    return onUpdateUserPlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onUpdateUserPlan != null) {
      return onUpdateUserPlan(this);
    }
    return orElse();
  }
}

abstract class UpdateUserPlanEvent implements PlanEvent {
  const factory UpdateUserPlanEvent(final String plan) = _$UpdateUserPlanEvent;

  String get plan;
  @JsonKey(ignore: true)
  _$$UpdateUserPlanEventCopyWith<_$UpdateUserPlanEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserPlanEventCopyWith<$Res> {
  factory _$$GetUserPlanEventCopyWith(
          _$GetUserPlanEvent value, $Res Function(_$GetUserPlanEvent) then) =
      __$$GetUserPlanEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserPlanEventCopyWithImpl<$Res>
    extends _$PlanEventCopyWithImpl<$Res, _$GetUserPlanEvent>
    implements _$$GetUserPlanEventCopyWith<$Res> {
  __$$GetUserPlanEventCopyWithImpl(
      _$GetUserPlanEvent _value, $Res Function(_$GetUserPlanEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserPlanEvent implements GetUserPlanEvent {
  const _$GetUserPlanEvent();

  @override
  String toString() {
    return 'PlanEvent.onGetUserPlan()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserPlanEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String plan) onUpdateUserPlan,
    required TResult Function() onGetUserPlan,
    required TResult Function() onReset,
  }) {
    return onGetUserPlan();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String plan)? onUpdateUserPlan,
    TResult? Function()? onGetUserPlan,
    TResult? Function()? onReset,
  }) {
    return onGetUserPlan?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plan)? onUpdateUserPlan,
    TResult Function()? onGetUserPlan,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetUserPlan != null) {
      return onGetUserPlan();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UpdateUserPlanEvent value) onUpdateUserPlan,
    required TResult Function(GetUserPlanEvent value) onGetUserPlan,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetUserPlan(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult? Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetUserPlan?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetUserPlan != null) {
      return onGetUserPlan(this);
    }
    return orElse();
  }
}

abstract class GetUserPlanEvent implements PlanEvent {
  const factory GetUserPlanEvent() = _$GetUserPlanEvent;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res> extends _$PlanEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'PlanEvent.onReset()';
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
    required TResult Function(String plan) onUpdateUserPlan,
    required TResult Function() onGetUserPlan,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String plan)? onUpdateUserPlan,
    TResult? Function()? onGetUserPlan,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String plan)? onUpdateUserPlan,
    TResult Function()? onGetUserPlan,
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
    required TResult Function(UpdateUserPlanEvent value) onUpdateUserPlan,
    required TResult Function(GetUserPlanEvent value) onGetUserPlan,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult? Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UpdateUserPlanEvent value)? onUpdateUserPlan,
    TResult Function(GetUserPlanEvent value)? onGetUserPlan,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements PlanEvent {
  const factory Reset() = _$Reset;
}

/// @nodoc
mixin _$PlanState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserSubscriptionPlan userSubscriptionPlan) loaded,
    required TResult Function() updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult? Function()? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlanInitialState value) initial,
    required TResult Function(PlanLoadingState value) loading,
    required TResult Function(PlanErrorState value) error,
    required TResult Function(PlanLoadedState value) loaded,
    required TResult Function(PlanUpdatedState value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlanInitialState value)? initial,
    TResult? Function(PlanLoadingState value)? loading,
    TResult? Function(PlanErrorState value)? error,
    TResult? Function(PlanLoadedState value)? loaded,
    TResult? Function(PlanUpdatedState value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlanInitialState value)? initial,
    TResult Function(PlanLoadingState value)? loading,
    TResult Function(PlanErrorState value)? error,
    TResult Function(PlanLoadedState value)? loaded,
    TResult Function(PlanUpdatedState value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanStateCopyWith<$Res> {
  factory $PlanStateCopyWith(PlanState value, $Res Function(PlanState) then) =
      _$PlanStateCopyWithImpl<$Res, PlanState>;
}

/// @nodoc
class _$PlanStateCopyWithImpl<$Res, $Val extends PlanState>
    implements $PlanStateCopyWith<$Res> {
  _$PlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$PlanInitialStateCopyWith<$Res> {
  factory _$$PlanInitialStateCopyWith(
          _$PlanInitialState value, $Res Function(_$PlanInitialState) then) =
      __$$PlanInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlanInitialStateCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanInitialState>
    implements _$$PlanInitialStateCopyWith<$Res> {
  __$$PlanInitialStateCopyWithImpl(
      _$PlanInitialState _value, $Res Function(_$PlanInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlanInitialState implements PlanInitialState {
  const _$PlanInitialState();

  @override
  String toString() {
    return 'PlanState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlanInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserSubscriptionPlan userSubscriptionPlan) loaded,
    required TResult Function() updated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult? Function()? updated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult Function()? updated,
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
    required TResult Function(PlanInitialState value) initial,
    required TResult Function(PlanLoadingState value) loading,
    required TResult Function(PlanErrorState value) error,
    required TResult Function(PlanLoadedState value) loaded,
    required TResult Function(PlanUpdatedState value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlanInitialState value)? initial,
    TResult? Function(PlanLoadingState value)? loading,
    TResult? Function(PlanErrorState value)? error,
    TResult? Function(PlanLoadedState value)? loaded,
    TResult? Function(PlanUpdatedState value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlanInitialState value)? initial,
    TResult Function(PlanLoadingState value)? loading,
    TResult Function(PlanErrorState value)? error,
    TResult Function(PlanLoadedState value)? loaded,
    TResult Function(PlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class PlanInitialState implements PlanState {
  const factory PlanInitialState() = _$PlanInitialState;
}

/// @nodoc
abstract class _$$PlanLoadingStateCopyWith<$Res> {
  factory _$$PlanLoadingStateCopyWith(
          _$PlanLoadingState value, $Res Function(_$PlanLoadingState) then) =
      __$$PlanLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlanLoadingStateCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanLoadingState>
    implements _$$PlanLoadingStateCopyWith<$Res> {
  __$$PlanLoadingStateCopyWithImpl(
      _$PlanLoadingState _value, $Res Function(_$PlanLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlanLoadingState implements PlanLoadingState {
  const _$PlanLoadingState();

  @override
  String toString() {
    return 'PlanState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlanLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserSubscriptionPlan userSubscriptionPlan) loaded,
    required TResult Function() updated,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult? Function()? updated,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult Function()? updated,
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
    required TResult Function(PlanInitialState value) initial,
    required TResult Function(PlanLoadingState value) loading,
    required TResult Function(PlanErrorState value) error,
    required TResult Function(PlanLoadedState value) loaded,
    required TResult Function(PlanUpdatedState value) updated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlanInitialState value)? initial,
    TResult? Function(PlanLoadingState value)? loading,
    TResult? Function(PlanErrorState value)? error,
    TResult? Function(PlanLoadedState value)? loaded,
    TResult? Function(PlanUpdatedState value)? updated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlanInitialState value)? initial,
    TResult Function(PlanLoadingState value)? loading,
    TResult Function(PlanErrorState value)? error,
    TResult Function(PlanLoadedState value)? loaded,
    TResult Function(PlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PlanLoadingState implements PlanState {
  const factory PlanLoadingState() = _$PlanLoadingState;
}

/// @nodoc
abstract class _$$PlanErrorStateCopyWith<$Res> {
  factory _$$PlanErrorStateCopyWith(
          _$PlanErrorState value, $Res Function(_$PlanErrorState) then) =
      __$$PlanErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PlanErrorStateCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanErrorState>
    implements _$$PlanErrorStateCopyWith<$Res> {
  __$$PlanErrorStateCopyWithImpl(
      _$PlanErrorState _value, $Res Function(_$PlanErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PlanErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlanErrorState implements PlanErrorState {
  const _$PlanErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PlanState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanErrorStateCopyWith<_$PlanErrorState> get copyWith =>
      __$$PlanErrorStateCopyWithImpl<_$PlanErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserSubscriptionPlan userSubscriptionPlan) loaded,
    required TResult Function() updated,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult? Function()? updated,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult Function()? updated,
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
    required TResult Function(PlanInitialState value) initial,
    required TResult Function(PlanLoadingState value) loading,
    required TResult Function(PlanErrorState value) error,
    required TResult Function(PlanLoadedState value) loaded,
    required TResult Function(PlanUpdatedState value) updated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlanInitialState value)? initial,
    TResult? Function(PlanLoadingState value)? loading,
    TResult? Function(PlanErrorState value)? error,
    TResult? Function(PlanLoadedState value)? loaded,
    TResult? Function(PlanUpdatedState value)? updated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlanInitialState value)? initial,
    TResult Function(PlanLoadingState value)? loading,
    TResult Function(PlanErrorState value)? error,
    TResult Function(PlanLoadedState value)? loaded,
    TResult Function(PlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PlanErrorState implements PlanState {
  const factory PlanErrorState(final String message) = _$PlanErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$PlanErrorStateCopyWith<_$PlanErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlanLoadedStateCopyWith<$Res> {
  factory _$$PlanLoadedStateCopyWith(
          _$PlanLoadedState value, $Res Function(_$PlanLoadedState) then) =
      __$$PlanLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSubscriptionPlan userSubscriptionPlan});

  $UserSubscriptionPlanCopyWith<$Res> get userSubscriptionPlan;
}

/// @nodoc
class __$$PlanLoadedStateCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanLoadedState>
    implements _$$PlanLoadedStateCopyWith<$Res> {
  __$$PlanLoadedStateCopyWithImpl(
      _$PlanLoadedState _value, $Res Function(_$PlanLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSubscriptionPlan = null,
  }) {
    return _then(_$PlanLoadedState(
      null == userSubscriptionPlan
          ? _value.userSubscriptionPlan
          : userSubscriptionPlan // ignore: cast_nullable_to_non_nullable
              as UserSubscriptionPlan,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserSubscriptionPlanCopyWith<$Res> get userSubscriptionPlan {
    return $UserSubscriptionPlanCopyWith<$Res>(_value.userSubscriptionPlan,
        (value) {
      return _then(_value.copyWith(userSubscriptionPlan: value));
    });
  }
}

/// @nodoc

class _$PlanLoadedState implements PlanLoadedState {
  const _$PlanLoadedState(this.userSubscriptionPlan);

  @override
  final UserSubscriptionPlan userSubscriptionPlan;

  @override
  String toString() {
    return 'PlanState.loaded(userSubscriptionPlan: $userSubscriptionPlan)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanLoadedState &&
            (identical(other.userSubscriptionPlan, userSubscriptionPlan) ||
                other.userSubscriptionPlan == userSubscriptionPlan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userSubscriptionPlan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanLoadedStateCopyWith<_$PlanLoadedState> get copyWith =>
      __$$PlanLoadedStateCopyWithImpl<_$PlanLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserSubscriptionPlan userSubscriptionPlan) loaded,
    required TResult Function() updated,
  }) {
    return loaded(userSubscriptionPlan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult? Function()? updated,
  }) {
    return loaded?.call(userSubscriptionPlan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(userSubscriptionPlan);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlanInitialState value) initial,
    required TResult Function(PlanLoadingState value) loading,
    required TResult Function(PlanErrorState value) error,
    required TResult Function(PlanLoadedState value) loaded,
    required TResult Function(PlanUpdatedState value) updated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlanInitialState value)? initial,
    TResult? Function(PlanLoadingState value)? loading,
    TResult? Function(PlanErrorState value)? error,
    TResult? Function(PlanLoadedState value)? loaded,
    TResult? Function(PlanUpdatedState value)? updated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlanInitialState value)? initial,
    TResult Function(PlanLoadingState value)? loading,
    TResult Function(PlanErrorState value)? error,
    TResult Function(PlanLoadedState value)? loaded,
    TResult Function(PlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PlanLoadedState implements PlanState {
  const factory PlanLoadedState(
      final UserSubscriptionPlan userSubscriptionPlan) = _$PlanLoadedState;

  UserSubscriptionPlan get userSubscriptionPlan;
  @JsonKey(ignore: true)
  _$$PlanLoadedStateCopyWith<_$PlanLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlanUpdatedStateCopyWith<$Res> {
  factory _$$PlanUpdatedStateCopyWith(
          _$PlanUpdatedState value, $Res Function(_$PlanUpdatedState) then) =
      __$$PlanUpdatedStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlanUpdatedStateCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanUpdatedState>
    implements _$$PlanUpdatedStateCopyWith<$Res> {
  __$$PlanUpdatedStateCopyWithImpl(
      _$PlanUpdatedState _value, $Res Function(_$PlanUpdatedState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlanUpdatedState implements PlanUpdatedState {
  const _$PlanUpdatedState();

  @override
  String toString() {
    return 'PlanState.updated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlanUpdatedState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserSubscriptionPlan userSubscriptionPlan) loaded,
    required TResult Function() updated,
  }) {
    return updated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult? Function()? updated,
  }) {
    return updated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserSubscriptionPlan userSubscriptionPlan)? loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PlanInitialState value) initial,
    required TResult Function(PlanLoadingState value) loading,
    required TResult Function(PlanErrorState value) error,
    required TResult Function(PlanLoadedState value) loaded,
    required TResult Function(PlanUpdatedState value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(PlanInitialState value)? initial,
    TResult? Function(PlanLoadingState value)? loading,
    TResult? Function(PlanErrorState value)? error,
    TResult? Function(PlanLoadedState value)? loaded,
    TResult? Function(PlanUpdatedState value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PlanInitialState value)? initial,
    TResult Function(PlanLoadingState value)? loading,
    TResult Function(PlanErrorState value)? error,
    TResult Function(PlanLoadedState value)? loaded,
    TResult Function(PlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class PlanUpdatedState implements PlanState {
  const factory PlanUpdatedState() = _$PlanUpdatedState;
}
