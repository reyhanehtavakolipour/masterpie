// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_plans_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubscriptionPlanEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetPlans,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetPlans,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetPlans,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllPlansEvent value) onGetPlans,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllPlansEvent value)? onGetPlans,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllPlansEvent value)? onGetPlans,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPlanEventCopyWith<$Res> {
  factory $SubscriptionPlanEventCopyWith(SubscriptionPlanEvent value,
          $Res Function(SubscriptionPlanEvent) then) =
      _$SubscriptionPlanEventCopyWithImpl<$Res, SubscriptionPlanEvent>;
}

/// @nodoc
class _$SubscriptionPlanEventCopyWithImpl<$Res,
        $Val extends SubscriptionPlanEvent>
    implements $SubscriptionPlanEventCopyWith<$Res> {
  _$SubscriptionPlanEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllPlansEventImplCopyWith<$Res> {
  factory _$$GetAllPlansEventImplCopyWith(_$GetAllPlansEventImpl value,
          $Res Function(_$GetAllPlansEventImpl) then) =
      __$$GetAllPlansEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllPlansEventImplCopyWithImpl<$Res>
    extends _$SubscriptionPlanEventCopyWithImpl<$Res, _$GetAllPlansEventImpl>
    implements _$$GetAllPlansEventImplCopyWith<$Res> {
  __$$GetAllPlansEventImplCopyWithImpl(_$GetAllPlansEventImpl _value,
      $Res Function(_$GetAllPlansEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllPlansEventImpl implements GetAllPlansEvent {
  const _$GetAllPlansEventImpl();

  @override
  String toString() {
    return 'SubscriptionPlanEvent.onGetPlans()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAllPlansEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onGetPlans,
    required TResult Function() onReset,
  }) {
    return onGetPlans();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetPlans,
    TResult? Function()? onReset,
  }) {
    return onGetPlans?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetPlans,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetPlans != null) {
      return onGetPlans();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetAllPlansEvent value) onGetPlans,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetPlans(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllPlansEvent value)? onGetPlans,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetPlans?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllPlansEvent value)? onGetPlans,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetPlans != null) {
      return onGetPlans(this);
    }
    return orElse();
  }
}

abstract class GetAllPlansEvent implements SubscriptionPlanEvent {
  const factory GetAllPlansEvent() = _$GetAllPlansEventImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$SubscriptionPlanEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'SubscriptionPlanEvent.onReset()';
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
    required TResult Function() onGetPlans,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onGetPlans,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onGetPlans,
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
    required TResult Function(GetAllPlansEvent value) onGetPlans,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetAllPlansEvent value)? onGetPlans,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetAllPlansEvent value)? onGetPlans,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements SubscriptionPlanEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$SubscriptionPlansState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<SubscriptionPlan> subscriptions) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SubscriptionPlan> subscriptions)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SubscriptionPlan> subscriptions)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubscriptionPlansInitialState value) initial,
    required TResult Function(SubscriptionPlansLoadingState value) loading,
    required TResult Function(SubscriptionPlansErrorState value) error,
    required TResult Function(SubscriptionPlansLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubscriptionPlansInitialState value)? initial,
    TResult? Function(SubscriptionPlansLoadingState value)? loading,
    TResult? Function(SubscriptionPlansErrorState value)? error,
    TResult? Function(SubscriptionPlansLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansInitialState value)? initial,
    TResult Function(SubscriptionPlansLoadingState value)? loading,
    TResult Function(SubscriptionPlansErrorState value)? error,
    TResult Function(SubscriptionPlansLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPlansStateCopyWith<$Res> {
  factory $SubscriptionPlansStateCopyWith(SubscriptionPlansState value,
          $Res Function(SubscriptionPlansState) then) =
      _$SubscriptionPlansStateCopyWithImpl<$Res, SubscriptionPlansState>;
}

/// @nodoc
class _$SubscriptionPlansStateCopyWithImpl<$Res,
        $Val extends SubscriptionPlansState>
    implements $SubscriptionPlansStateCopyWith<$Res> {
  _$SubscriptionPlansStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SubscriptionPlansInitialStateImplCopyWith<$Res> {
  factory _$$SubscriptionPlansInitialStateImplCopyWith(
          _$SubscriptionPlansInitialStateImpl value,
          $Res Function(_$SubscriptionPlansInitialStateImpl) then) =
      __$$SubscriptionPlansInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubscriptionPlansInitialStateImplCopyWithImpl<$Res>
    extends _$SubscriptionPlansStateCopyWithImpl<$Res,
        _$SubscriptionPlansInitialStateImpl>
    implements _$$SubscriptionPlansInitialStateImplCopyWith<$Res> {
  __$$SubscriptionPlansInitialStateImplCopyWithImpl(
      _$SubscriptionPlansInitialStateImpl _value,
      $Res Function(_$SubscriptionPlansInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubscriptionPlansInitialStateImpl
    implements SubscriptionPlansInitialState {
  const _$SubscriptionPlansInitialStateImpl();

  @override
  String toString() {
    return 'SubscriptionPlansState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPlansInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<SubscriptionPlan> subscriptions) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SubscriptionPlan> subscriptions)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SubscriptionPlan> subscriptions)? loaded,
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
    required TResult Function(SubscriptionPlansInitialState value) initial,
    required TResult Function(SubscriptionPlansLoadingState value) loading,
    required TResult Function(SubscriptionPlansErrorState value) error,
    required TResult Function(SubscriptionPlansLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubscriptionPlansInitialState value)? initial,
    TResult? Function(SubscriptionPlansLoadingState value)? loading,
    TResult? Function(SubscriptionPlansErrorState value)? error,
    TResult? Function(SubscriptionPlansLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansInitialState value)? initial,
    TResult Function(SubscriptionPlansLoadingState value)? loading,
    TResult Function(SubscriptionPlansErrorState value)? error,
    TResult Function(SubscriptionPlansLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansInitialState implements SubscriptionPlansState {
  const factory SubscriptionPlansInitialState() =
      _$SubscriptionPlansInitialStateImpl;
}

/// @nodoc
abstract class _$$SubscriptionPlansLoadingStateImplCopyWith<$Res> {
  factory _$$SubscriptionPlansLoadingStateImplCopyWith(
          _$SubscriptionPlansLoadingStateImpl value,
          $Res Function(_$SubscriptionPlansLoadingStateImpl) then) =
      __$$SubscriptionPlansLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubscriptionPlansLoadingStateImplCopyWithImpl<$Res>
    extends _$SubscriptionPlansStateCopyWithImpl<$Res,
        _$SubscriptionPlansLoadingStateImpl>
    implements _$$SubscriptionPlansLoadingStateImplCopyWith<$Res> {
  __$$SubscriptionPlansLoadingStateImplCopyWithImpl(
      _$SubscriptionPlansLoadingStateImpl _value,
      $Res Function(_$SubscriptionPlansLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubscriptionPlansLoadingStateImpl
    implements SubscriptionPlansLoadingState {
  const _$SubscriptionPlansLoadingStateImpl();

  @override
  String toString() {
    return 'SubscriptionPlansState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPlansLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<SubscriptionPlan> subscriptions) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SubscriptionPlan> subscriptions)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SubscriptionPlan> subscriptions)? loaded,
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
    required TResult Function(SubscriptionPlansInitialState value) initial,
    required TResult Function(SubscriptionPlansLoadingState value) loading,
    required TResult Function(SubscriptionPlansErrorState value) error,
    required TResult Function(SubscriptionPlansLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubscriptionPlansInitialState value)? initial,
    TResult? Function(SubscriptionPlansLoadingState value)? loading,
    TResult? Function(SubscriptionPlansErrorState value)? error,
    TResult? Function(SubscriptionPlansLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansInitialState value)? initial,
    TResult Function(SubscriptionPlansLoadingState value)? loading,
    TResult Function(SubscriptionPlansErrorState value)? error,
    TResult Function(SubscriptionPlansLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansLoadingState implements SubscriptionPlansState {
  const factory SubscriptionPlansLoadingState() =
      _$SubscriptionPlansLoadingStateImpl;
}

/// @nodoc
abstract class _$$SubscriptionPlansErrorStateImplCopyWith<$Res> {
  factory _$$SubscriptionPlansErrorStateImplCopyWith(
          _$SubscriptionPlansErrorStateImpl value,
          $Res Function(_$SubscriptionPlansErrorStateImpl) then) =
      __$$SubscriptionPlansErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SubscriptionPlansErrorStateImplCopyWithImpl<$Res>
    extends _$SubscriptionPlansStateCopyWithImpl<$Res,
        _$SubscriptionPlansErrorStateImpl>
    implements _$$SubscriptionPlansErrorStateImplCopyWith<$Res> {
  __$$SubscriptionPlansErrorStateImplCopyWithImpl(
      _$SubscriptionPlansErrorStateImpl _value,
      $Res Function(_$SubscriptionPlansErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$SubscriptionPlansErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SubscriptionPlansErrorStateImpl implements SubscriptionPlansErrorState {
  const _$SubscriptionPlansErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SubscriptionPlansState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPlansErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPlansErrorStateImplCopyWith<_$SubscriptionPlansErrorStateImpl>
      get copyWith => __$$SubscriptionPlansErrorStateImplCopyWithImpl<
          _$SubscriptionPlansErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<SubscriptionPlan> subscriptions) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SubscriptionPlan> subscriptions)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SubscriptionPlan> subscriptions)? loaded,
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
    required TResult Function(SubscriptionPlansInitialState value) initial,
    required TResult Function(SubscriptionPlansLoadingState value) loading,
    required TResult Function(SubscriptionPlansErrorState value) error,
    required TResult Function(SubscriptionPlansLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubscriptionPlansInitialState value)? initial,
    TResult? Function(SubscriptionPlansLoadingState value)? loading,
    TResult? Function(SubscriptionPlansErrorState value)? error,
    TResult? Function(SubscriptionPlansLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansInitialState value)? initial,
    TResult Function(SubscriptionPlansLoadingState value)? loading,
    TResult Function(SubscriptionPlansErrorState value)? error,
    TResult Function(SubscriptionPlansLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansErrorState implements SubscriptionPlansState {
  const factory SubscriptionPlansErrorState(final String message) =
      _$SubscriptionPlansErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$SubscriptionPlansErrorStateImplCopyWith<_$SubscriptionPlansErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubscriptionPlansLoadedStateImplCopyWith<$Res> {
  factory _$$SubscriptionPlansLoadedStateImplCopyWith(
          _$SubscriptionPlansLoadedStateImpl value,
          $Res Function(_$SubscriptionPlansLoadedStateImpl) then) =
      __$$SubscriptionPlansLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SubscriptionPlan> subscriptions});
}

/// @nodoc
class __$$SubscriptionPlansLoadedStateImplCopyWithImpl<$Res>
    extends _$SubscriptionPlansStateCopyWithImpl<$Res,
        _$SubscriptionPlansLoadedStateImpl>
    implements _$$SubscriptionPlansLoadedStateImplCopyWith<$Res> {
  __$$SubscriptionPlansLoadedStateImplCopyWithImpl(
      _$SubscriptionPlansLoadedStateImpl _value,
      $Res Function(_$SubscriptionPlansLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptions = null,
  }) {
    return _then(_$SubscriptionPlansLoadedStateImpl(
      null == subscriptions
          ? _value._subscriptions
          : subscriptions // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPlan>,
    ));
  }
}

/// @nodoc

class _$SubscriptionPlansLoadedStateImpl
    implements SubscriptionPlansLoadedState {
  const _$SubscriptionPlansLoadedStateImpl(
      final List<SubscriptionPlan> subscriptions)
      : _subscriptions = subscriptions;

  final List<SubscriptionPlan> _subscriptions;
  @override
  List<SubscriptionPlan> get subscriptions {
    if (_subscriptions is EqualUnmodifiableListView) return _subscriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptions);
  }

  @override
  String toString() {
    return 'SubscriptionPlansState.loaded(subscriptions: $subscriptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPlansLoadedStateImpl &&
            const DeepCollectionEquality()
                .equals(other._subscriptions, _subscriptions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_subscriptions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPlansLoadedStateImplCopyWith<
          _$SubscriptionPlansLoadedStateImpl>
      get copyWith => __$$SubscriptionPlansLoadedStateImplCopyWithImpl<
          _$SubscriptionPlansLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<SubscriptionPlan> subscriptions) loaded,
  }) {
    return loaded(subscriptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<SubscriptionPlan> subscriptions)? loaded,
  }) {
    return loaded?.call(subscriptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<SubscriptionPlan> subscriptions)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(subscriptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SubscriptionPlansInitialState value) initial,
    required TResult Function(SubscriptionPlansLoadingState value) loading,
    required TResult Function(SubscriptionPlansErrorState value) error,
    required TResult Function(SubscriptionPlansLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SubscriptionPlansInitialState value)? initial,
    TResult? Function(SubscriptionPlansLoadingState value)? loading,
    TResult? Function(SubscriptionPlansErrorState value)? error,
    TResult? Function(SubscriptionPlansLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SubscriptionPlansInitialState value)? initial,
    TResult Function(SubscriptionPlansLoadingState value)? loading,
    TResult Function(SubscriptionPlansErrorState value)? error,
    TResult Function(SubscriptionPlansLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SubscriptionPlansLoadedState implements SubscriptionPlansState {
  const factory SubscriptionPlansLoadedState(
          final List<SubscriptionPlan> subscriptions) =
      _$SubscriptionPlansLoadedStateImpl;

  List<SubscriptionPlan> get subscriptions;
  @JsonKey(ignore: true)
  _$$SubscriptionPlansLoadedStateImplCopyWith<
          _$SubscriptionPlansLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
