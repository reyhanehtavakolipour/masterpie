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
mixin _$UserPlanEvent {
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
abstract class $UserPlanEventCopyWith<$Res> {
  factory $UserPlanEventCopyWith(
          UserPlanEvent value, $Res Function(UserPlanEvent) then) =
      _$UserPlanEventCopyWithImpl<$Res, UserPlanEvent>;
}

/// @nodoc
class _$UserPlanEventCopyWithImpl<$Res, $Val extends UserPlanEvent>
    implements $UserPlanEventCopyWith<$Res> {
  _$UserPlanEventCopyWithImpl(this._value, this._then);

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
    extends _$UserPlanEventCopyWithImpl<$Res, _$UpdateUserPlanEventImpl>
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
    return 'UserPlanEvent.onUpdateUserPlan(plan: $plan)';
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

abstract class UpdateUserPlanEvent implements UserPlanEvent {
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
    extends _$UserPlanEventCopyWithImpl<$Res, _$GetUserPlanEventImpl>
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
    return 'UserPlanEvent.onGetUserPlan()';
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

abstract class GetUserPlanEvent implements UserPlanEvent {
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
    extends _$UserPlanEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'UserPlanEvent.onReset()';
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

abstract class Reset implements UserPlanEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$UserPlanState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserPlan userSubscriptionPlan) loaded,
    required TResult Function() updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(UserPlan userSubscriptionPlan)? loaded,
    TResult? Function()? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(UserPlan userSubscriptionPlan)? loaded,
    TResult Function()? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserPlanInitialState value) initial,
    required TResult Function(UserPlanLoadingState value) loading,
    required TResult Function(UserPlanErrorState value) error,
    required TResult Function(UserPlanLoadedState value) loaded,
    required TResult Function(UserPlanUpdatedState value) updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserPlanInitialState value)? initial,
    TResult? Function(UserPlanLoadingState value)? loading,
    TResult? Function(UserPlanErrorState value)? error,
    TResult? Function(UserPlanLoadedState value)? loaded,
    TResult? Function(UserPlanUpdatedState value)? updated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserPlanInitialState value)? initial,
    TResult Function(UserPlanLoadingState value)? loading,
    TResult Function(UserPlanErrorState value)? error,
    TResult Function(UserPlanLoadedState value)? loaded,
    TResult Function(UserPlanUpdatedState value)? updated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlanStateCopyWith<$Res> {
  factory $UserPlanStateCopyWith(
          UserPlanState value, $Res Function(UserPlanState) then) =
      _$UserPlanStateCopyWithImpl<$Res, UserPlanState>;
}

/// @nodoc
class _$UserPlanStateCopyWithImpl<$Res, $Val extends UserPlanState>
    implements $UserPlanStateCopyWith<$Res> {
  _$UserPlanStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UserPlanInitialStateImplCopyWith<$Res> {
  factory _$$UserPlanInitialStateImplCopyWith(_$UserPlanInitialStateImpl value,
          $Res Function(_$UserPlanInitialStateImpl) then) =
      __$$UserPlanInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserPlanInitialStateImplCopyWithImpl<$Res>
    extends _$UserPlanStateCopyWithImpl<$Res, _$UserPlanInitialStateImpl>
    implements _$$UserPlanInitialStateImplCopyWith<$Res> {
  __$$UserPlanInitialStateImplCopyWithImpl(_$UserPlanInitialStateImpl _value,
      $Res Function(_$UserPlanInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserPlanInitialStateImpl implements UserPlanInitialState {
  const _$UserPlanInitialStateImpl();

  @override
  String toString() {
    return 'UserPlanState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserPlan userSubscriptionPlan) loaded,
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
    TResult? Function(UserPlan userSubscriptionPlan)? loaded,
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
    TResult Function(UserPlan userSubscriptionPlan)? loaded,
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
    required TResult Function(UserPlanInitialState value) initial,
    required TResult Function(UserPlanLoadingState value) loading,
    required TResult Function(UserPlanErrorState value) error,
    required TResult Function(UserPlanLoadedState value) loaded,
    required TResult Function(UserPlanUpdatedState value) updated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserPlanInitialState value)? initial,
    TResult? Function(UserPlanLoadingState value)? loading,
    TResult? Function(UserPlanErrorState value)? error,
    TResult? Function(UserPlanLoadedState value)? loaded,
    TResult? Function(UserPlanUpdatedState value)? updated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserPlanInitialState value)? initial,
    TResult Function(UserPlanLoadingState value)? loading,
    TResult Function(UserPlanErrorState value)? error,
    TResult Function(UserPlanLoadedState value)? loaded,
    TResult Function(UserPlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class UserPlanInitialState implements UserPlanState {
  const factory UserPlanInitialState() = _$UserPlanInitialStateImpl;
}

/// @nodoc
abstract class _$$UserPlanLoadingStateImplCopyWith<$Res> {
  factory _$$UserPlanLoadingStateImplCopyWith(_$UserPlanLoadingStateImpl value,
          $Res Function(_$UserPlanLoadingStateImpl) then) =
      __$$UserPlanLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserPlanLoadingStateImplCopyWithImpl<$Res>
    extends _$UserPlanStateCopyWithImpl<$Res, _$UserPlanLoadingStateImpl>
    implements _$$UserPlanLoadingStateImplCopyWith<$Res> {
  __$$UserPlanLoadingStateImplCopyWithImpl(_$UserPlanLoadingStateImpl _value,
      $Res Function(_$UserPlanLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserPlanLoadingStateImpl implements UserPlanLoadingState {
  const _$UserPlanLoadingStateImpl();

  @override
  String toString() {
    return 'UserPlanState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserPlan userSubscriptionPlan) loaded,
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
    TResult? Function(UserPlan userSubscriptionPlan)? loaded,
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
    TResult Function(UserPlan userSubscriptionPlan)? loaded,
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
    required TResult Function(UserPlanInitialState value) initial,
    required TResult Function(UserPlanLoadingState value) loading,
    required TResult Function(UserPlanErrorState value) error,
    required TResult Function(UserPlanLoadedState value) loaded,
    required TResult Function(UserPlanUpdatedState value) updated,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserPlanInitialState value)? initial,
    TResult? Function(UserPlanLoadingState value)? loading,
    TResult? Function(UserPlanErrorState value)? error,
    TResult? Function(UserPlanLoadedState value)? loaded,
    TResult? Function(UserPlanUpdatedState value)? updated,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserPlanInitialState value)? initial,
    TResult Function(UserPlanLoadingState value)? loading,
    TResult Function(UserPlanErrorState value)? error,
    TResult Function(UserPlanLoadedState value)? loaded,
    TResult Function(UserPlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class UserPlanLoadingState implements UserPlanState {
  const factory UserPlanLoadingState() = _$UserPlanLoadingStateImpl;
}

/// @nodoc
abstract class _$$UserPlanErrorStateImplCopyWith<$Res> {
  factory _$$UserPlanErrorStateImplCopyWith(_$UserPlanErrorStateImpl value,
          $Res Function(_$UserPlanErrorStateImpl) then) =
      __$$UserPlanErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UserPlanErrorStateImplCopyWithImpl<$Res>
    extends _$UserPlanStateCopyWithImpl<$Res, _$UserPlanErrorStateImpl>
    implements _$$UserPlanErrorStateImplCopyWith<$Res> {
  __$$UserPlanErrorStateImplCopyWithImpl(_$UserPlanErrorStateImpl _value,
      $Res Function(_$UserPlanErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UserPlanErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserPlanErrorStateImpl implements UserPlanErrorState {
  const _$UserPlanErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'UserPlanState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPlanErrorStateImplCopyWith<_$UserPlanErrorStateImpl> get copyWith =>
      __$$UserPlanErrorStateImplCopyWithImpl<_$UserPlanErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserPlan userSubscriptionPlan) loaded,
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
    TResult? Function(UserPlan userSubscriptionPlan)? loaded,
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
    TResult Function(UserPlan userSubscriptionPlan)? loaded,
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
    required TResult Function(UserPlanInitialState value) initial,
    required TResult Function(UserPlanLoadingState value) loading,
    required TResult Function(UserPlanErrorState value) error,
    required TResult Function(UserPlanLoadedState value) loaded,
    required TResult Function(UserPlanUpdatedState value) updated,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserPlanInitialState value)? initial,
    TResult? Function(UserPlanLoadingState value)? loading,
    TResult? Function(UserPlanErrorState value)? error,
    TResult? Function(UserPlanLoadedState value)? loaded,
    TResult? Function(UserPlanUpdatedState value)? updated,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserPlanInitialState value)? initial,
    TResult Function(UserPlanLoadingState value)? loading,
    TResult Function(UserPlanErrorState value)? error,
    TResult Function(UserPlanLoadedState value)? loaded,
    TResult Function(UserPlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class UserPlanErrorState implements UserPlanState {
  const factory UserPlanErrorState(final String message) =
      _$UserPlanErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$UserPlanErrorStateImplCopyWith<_$UserPlanErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserPlanLoadedStateImplCopyWith<$Res> {
  factory _$$UserPlanLoadedStateImplCopyWith(_$UserPlanLoadedStateImpl value,
          $Res Function(_$UserPlanLoadedStateImpl) then) =
      __$$UserPlanLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserPlan userSubscriptionPlan});

  $UserPlanCopyWith<$Res> get userSubscriptionPlan;
}

/// @nodoc
class __$$UserPlanLoadedStateImplCopyWithImpl<$Res>
    extends _$UserPlanStateCopyWithImpl<$Res, _$UserPlanLoadedStateImpl>
    implements _$$UserPlanLoadedStateImplCopyWith<$Res> {
  __$$UserPlanLoadedStateImplCopyWithImpl(_$UserPlanLoadedStateImpl _value,
      $Res Function(_$UserPlanLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userSubscriptionPlan = null,
  }) {
    return _then(_$UserPlanLoadedStateImpl(
      null == userSubscriptionPlan
          ? _value.userSubscriptionPlan
          : userSubscriptionPlan // ignore: cast_nullable_to_non_nullable
              as UserPlan,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserPlanCopyWith<$Res> get userSubscriptionPlan {
    return $UserPlanCopyWith<$Res>(_value.userSubscriptionPlan, (value) {
      return _then(_value.copyWith(userSubscriptionPlan: value));
    });
  }
}

/// @nodoc

class _$UserPlanLoadedStateImpl implements UserPlanLoadedState {
  const _$UserPlanLoadedStateImpl(this.userSubscriptionPlan);

  @override
  final UserPlan userSubscriptionPlan;

  @override
  String toString() {
    return 'UserPlanState.loaded(userSubscriptionPlan: $userSubscriptionPlan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanLoadedStateImpl &&
            (identical(other.userSubscriptionPlan, userSubscriptionPlan) ||
                other.userSubscriptionPlan == userSubscriptionPlan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userSubscriptionPlan);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPlanLoadedStateImplCopyWith<_$UserPlanLoadedStateImpl> get copyWith =>
      __$$UserPlanLoadedStateImplCopyWithImpl<_$UserPlanLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserPlan userSubscriptionPlan) loaded,
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
    TResult? Function(UserPlan userSubscriptionPlan)? loaded,
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
    TResult Function(UserPlan userSubscriptionPlan)? loaded,
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
    required TResult Function(UserPlanInitialState value) initial,
    required TResult Function(UserPlanLoadingState value) loading,
    required TResult Function(UserPlanErrorState value) error,
    required TResult Function(UserPlanLoadedState value) loaded,
    required TResult Function(UserPlanUpdatedState value) updated,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserPlanInitialState value)? initial,
    TResult? Function(UserPlanLoadingState value)? loading,
    TResult? Function(UserPlanErrorState value)? error,
    TResult? Function(UserPlanLoadedState value)? loaded,
    TResult? Function(UserPlanUpdatedState value)? updated,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserPlanInitialState value)? initial,
    TResult Function(UserPlanLoadingState value)? loading,
    TResult Function(UserPlanErrorState value)? error,
    TResult Function(UserPlanLoadedState value)? loaded,
    TResult Function(UserPlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class UserPlanLoadedState implements UserPlanState {
  const factory UserPlanLoadedState(final UserPlan userSubscriptionPlan) =
      _$UserPlanLoadedStateImpl;

  UserPlan get userSubscriptionPlan;
  @JsonKey(ignore: true)
  _$$UserPlanLoadedStateImplCopyWith<_$UserPlanLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserPlanUpdatedStateImplCopyWith<$Res> {
  factory _$$UserPlanUpdatedStateImplCopyWith(_$UserPlanUpdatedStateImpl value,
          $Res Function(_$UserPlanUpdatedStateImpl) then) =
      __$$UserPlanUpdatedStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$UserPlanUpdatedStateImplCopyWithImpl<$Res>
    extends _$UserPlanStateCopyWithImpl<$Res, _$UserPlanUpdatedStateImpl>
    implements _$$UserPlanUpdatedStateImplCopyWith<$Res> {
  __$$UserPlanUpdatedStateImplCopyWithImpl(_$UserPlanUpdatedStateImpl _value,
      $Res Function(_$UserPlanUpdatedStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$UserPlanUpdatedStateImpl implements UserPlanUpdatedState {
  const _$UserPlanUpdatedStateImpl();

  @override
  String toString() {
    return 'UserPlanState.updated()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanUpdatedStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(UserPlan userSubscriptionPlan) loaded,
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
    TResult? Function(UserPlan userSubscriptionPlan)? loaded,
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
    TResult Function(UserPlan userSubscriptionPlan)? loaded,
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
    required TResult Function(UserPlanInitialState value) initial,
    required TResult Function(UserPlanLoadingState value) loading,
    required TResult Function(UserPlanErrorState value) error,
    required TResult Function(UserPlanLoadedState value) loaded,
    required TResult Function(UserPlanUpdatedState value) updated,
  }) {
    return updated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserPlanInitialState value)? initial,
    TResult? Function(UserPlanLoadingState value)? loading,
    TResult? Function(UserPlanErrorState value)? error,
    TResult? Function(UserPlanLoadedState value)? loaded,
    TResult? Function(UserPlanUpdatedState value)? updated,
  }) {
    return updated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserPlanInitialState value)? initial,
    TResult Function(UserPlanLoadingState value)? loading,
    TResult Function(UserPlanErrorState value)? error,
    TResult Function(UserPlanLoadedState value)? loaded,
    TResult Function(UserPlanUpdatedState value)? updated,
    required TResult orElse(),
  }) {
    if (updated != null) {
      return updated(this);
    }
    return orElse();
  }
}

abstract class UserPlanUpdatedState implements UserPlanState {
  const factory UserPlanUpdatedState() = _$UserPlanUpdatedStateImpl;
}
