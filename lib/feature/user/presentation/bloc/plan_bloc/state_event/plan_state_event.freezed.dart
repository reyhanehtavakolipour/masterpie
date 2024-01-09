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
abstract class _$$UpdateUserPlanEventImplCopyWith<$Res> {
  factory _$$UpdateUserPlanEventImplCopyWith(_$UpdateUserPlanEventImpl value,
          $Res Function(_$UpdateUserPlanEventImpl) then) =
      __$$UpdateUserPlanEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String plan});
}

/// @nodoc
class __$$UpdateUserPlanEventImplCopyWithImpl<$Res>
    extends _$PlanEventCopyWithImpl<$Res, _$UpdateUserPlanEventImpl>
    implements _$$UpdateUserPlanEventImplCopyWith<$Res> {
  __$$UpdateUserPlanEventImplCopyWithImpl(_$UpdateUserPlanEventImpl _value,
      $Res Function(_$UpdateUserPlanEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? plan = null,
  }) {
    return _then(_$UpdateUserPlanEventImpl(
      null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdateUserPlanEventImpl implements UpdateUserPlanEvent {
  const _$UpdateUserPlanEventImpl(this.plan);

  @override
  final String plan;

  @override
  String toString() {
    return 'PlanEvent.onUpdateUserPlan(plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateUserPlanEventImpl &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, plan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateUserPlanEventImplCopyWith<_$UpdateUserPlanEventImpl> get copyWith =>
      __$$UpdateUserPlanEventImplCopyWithImpl<_$UpdateUserPlanEventImpl>(
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
  const factory UpdateUserPlanEvent(final String plan) =
      _$UpdateUserPlanEventImpl;

  String get plan;
  @JsonKey(ignore: true)
  _$$UpdateUserPlanEventImplCopyWith<_$UpdateUserPlanEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetUserPlanEventImplCopyWith<$Res> {
  factory _$$GetUserPlanEventImplCopyWith(_$GetUserPlanEventImpl value,
          $Res Function(_$GetUserPlanEventImpl) then) =
      __$$GetUserPlanEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUserPlanEventImplCopyWithImpl<$Res>
    extends _$PlanEventCopyWithImpl<$Res, _$GetUserPlanEventImpl>
    implements _$$GetUserPlanEventImplCopyWith<$Res> {
  __$$GetUserPlanEventImplCopyWithImpl(_$GetUserPlanEventImpl _value,
      $Res Function(_$GetUserPlanEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUserPlanEventImpl implements GetUserPlanEvent {
  const _$GetUserPlanEventImpl();

  @override
  String toString() {
    return 'PlanEvent.onGetUserPlan()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUserPlanEventImpl);
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
  const factory GetUserPlanEvent() = _$GetUserPlanEventImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$PlanEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'PlanEvent.onReset()';
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
  const factory Reset() = _$ResetImpl;
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
abstract class _$$PlanInitialStateImplCopyWith<$Res> {
  factory _$$PlanInitialStateImplCopyWith(_$PlanInitialStateImpl value,
          $Res Function(_$PlanInitialStateImpl) then) =
      __$$PlanInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlanInitialStateImplCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanInitialStateImpl>
    implements _$$PlanInitialStateImplCopyWith<$Res> {
  __$$PlanInitialStateImplCopyWithImpl(_$PlanInitialStateImpl _value,
      $Res Function(_$PlanInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlanInitialStateImpl implements PlanInitialState {
  const _$PlanInitialStateImpl();

  @override
  String toString() {
    return 'PlanState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlanInitialStateImpl);
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
  const factory PlanInitialState() = _$PlanInitialStateImpl;
}

/// @nodoc
abstract class _$$PlanLoadingStateImplCopyWith<$Res> {
  factory _$$PlanLoadingStateImplCopyWith(_$PlanLoadingStateImpl value,
          $Res Function(_$PlanLoadingStateImpl) then) =
      __$$PlanLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlanLoadingStateImplCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanLoadingStateImpl>
    implements _$$PlanLoadingStateImplCopyWith<$Res> {
  __$$PlanLoadingStateImplCopyWithImpl(_$PlanLoadingStateImpl _value,
      $Res Function(_$PlanLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlanLoadingStateImpl implements PlanLoadingState {
  const _$PlanLoadingStateImpl();

  @override
  String toString() {
    return 'PlanState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlanLoadingStateImpl);
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
  const factory PlanLoadingState() = _$PlanLoadingStateImpl;
}

/// @nodoc
abstract class _$$PlanErrorStateImplCopyWith<$Res> {
  factory _$$PlanErrorStateImplCopyWith(_$PlanErrorStateImpl value,
          $Res Function(_$PlanErrorStateImpl) then) =
      __$$PlanErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$PlanErrorStateImplCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanErrorStateImpl>
    implements _$$PlanErrorStateImplCopyWith<$Res> {
  __$$PlanErrorStateImplCopyWithImpl(
      _$PlanErrorStateImpl _value, $Res Function(_$PlanErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$PlanErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlanErrorStateImpl implements PlanErrorState {
  const _$PlanErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'PlanState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanErrorStateImplCopyWith<_$PlanErrorStateImpl> get copyWith =>
      __$$PlanErrorStateImplCopyWithImpl<_$PlanErrorStateImpl>(
          this, _$identity);

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
  const factory PlanErrorState(final String message) = _$PlanErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$PlanErrorStateImplCopyWith<_$PlanErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlanLoadedStateImplCopyWith<$Res> {
  factory _$$PlanLoadedStateImplCopyWith(_$PlanLoadedStateImpl value,
          $Res Function(_$PlanLoadedStateImpl) then) =
      __$$PlanLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserSubscriptionPlan userSubscriptionPlan});

  $UserSubscriptionPlanCopyWith<$Res> get userSubscriptionPlan;
}

/// @nodoc
class __$$PlanLoadedStateImplCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanLoadedStateImpl>
    implements _$$PlanLoadedStateImplCopyWith<$Res> {
  __$$PlanLoadedStateImplCopyWithImpl(
      _$PlanLoadedStateImpl _value, $Res Function(_$PlanLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSubscriptionPlan = null,
  }) {
    return _then(_$PlanLoadedStateImpl(
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

class _$PlanLoadedStateImpl implements PlanLoadedState {
  const _$PlanLoadedStateImpl(this.userSubscriptionPlan);

  @override
  final UserSubscriptionPlan userSubscriptionPlan;

  @override
  String toString() {
    return 'PlanState.loaded(userSubscriptionPlan: $userSubscriptionPlan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanLoadedStateImpl &&
            (identical(other.userSubscriptionPlan, userSubscriptionPlan) ||
                other.userSubscriptionPlan == userSubscriptionPlan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userSubscriptionPlan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanLoadedStateImplCopyWith<_$PlanLoadedStateImpl> get copyWith =>
      __$$PlanLoadedStateImplCopyWithImpl<_$PlanLoadedStateImpl>(
          this, _$identity);

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
      final UserSubscriptionPlan userSubscriptionPlan) = _$PlanLoadedStateImpl;

  UserSubscriptionPlan get userSubscriptionPlan;
  @JsonKey(ignore: true)
  _$$PlanLoadedStateImplCopyWith<_$PlanLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlanUpdatedStateImplCopyWith<$Res> {
  factory _$$PlanUpdatedStateImplCopyWith(_$PlanUpdatedStateImpl value,
          $Res Function(_$PlanUpdatedStateImpl) then) =
      __$$PlanUpdatedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlanUpdatedStateImplCopyWithImpl<$Res>
    extends _$PlanStateCopyWithImpl<$Res, _$PlanUpdatedStateImpl>
    implements _$$PlanUpdatedStateImplCopyWith<$Res> {
  __$$PlanUpdatedStateImplCopyWithImpl(_$PlanUpdatedStateImpl _value,
      $Res Function(_$PlanUpdatedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PlanUpdatedStateImpl implements PlanUpdatedState {
  const _$PlanUpdatedStateImpl();

  @override
  String toString() {
    return 'PlanState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlanUpdatedStateImpl);
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
  const factory PlanUpdatedState() = _$PlanUpdatedStateImpl;
}
