// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_plan_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NewPlanInfo {
  List<SubscriptionPlan> get subscriptionPlans =>
      throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NewPlanInfoCopyWith<NewPlanInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPlanInfoCopyWith<$Res> {
  factory $NewPlanInfoCopyWith(
          NewPlanInfo value, $Res Function(NewPlanInfo) then) =
      _$NewPlanInfoCopyWithImpl<$Res, NewPlanInfo>;
  @useResult
  $Res call({List<SubscriptionPlan> subscriptionPlans, String customerId});
}

/// @nodoc
class _$NewPlanInfoCopyWithImpl<$Res, $Val extends NewPlanInfo>
    implements $NewPlanInfoCopyWith<$Res> {
  _$NewPlanInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionPlans = null,
    Object? customerId = null,
  }) {
    return _then(_value.copyWith(
      subscriptionPlans: null == subscriptionPlans
          ? _value.subscriptionPlans
          : subscriptionPlans // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPlan>,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewPlanInfoImplCopyWith<$Res>
    implements $NewPlanInfoCopyWith<$Res> {
  factory _$$NewPlanInfoImplCopyWith(
          _$NewPlanInfoImpl value, $Res Function(_$NewPlanInfoImpl) then) =
      __$$NewPlanInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<SubscriptionPlan> subscriptionPlans, String customerId});
}

/// @nodoc
class __$$NewPlanInfoImplCopyWithImpl<$Res>
    extends _$NewPlanInfoCopyWithImpl<$Res, _$NewPlanInfoImpl>
    implements _$$NewPlanInfoImplCopyWith<$Res> {
  __$$NewPlanInfoImplCopyWithImpl(
      _$NewPlanInfoImpl _value, $Res Function(_$NewPlanInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionPlans = null,
    Object? customerId = null,
  }) {
    return _then(_$NewPlanInfoImpl(
      subscriptionPlans: null == subscriptionPlans
          ? _value._subscriptionPlans
          : subscriptionPlans // ignore: cast_nullable_to_non_nullable
              as List<SubscriptionPlan>,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NewPlanInfoImpl implements _NewPlanInfo {
  _$NewPlanInfoImpl(
      {final List<SubscriptionPlan> subscriptionPlans = const [],
      this.customerId = ''})
      : _subscriptionPlans = subscriptionPlans;

  final List<SubscriptionPlan> _subscriptionPlans;
  @override
  @JsonKey()
  List<SubscriptionPlan> get subscriptionPlans {
    if (_subscriptionPlans is EqualUnmodifiableListView)
      return _subscriptionPlans;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subscriptionPlans);
  }

  @override
  @JsonKey()
  final String customerId;

  @override
  String toString() {
    return 'NewPlanInfo(subscriptionPlans: $subscriptionPlans, customerId: $customerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewPlanInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._subscriptionPlans, _subscriptionPlans) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_subscriptionPlans), customerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewPlanInfoImplCopyWith<_$NewPlanInfoImpl> get copyWith =>
      __$$NewPlanInfoImplCopyWithImpl<_$NewPlanInfoImpl>(this, _$identity);
}

abstract class _NewPlanInfo implements NewPlanInfo {
  factory _NewPlanInfo(
      {final List<SubscriptionPlan> subscriptionPlans,
      final String customerId}) = _$NewPlanInfoImpl;

  @override
  List<SubscriptionPlan> get subscriptionPlans;
  @override
  String get customerId;
  @override
  @JsonKey(ignore: true)
  _$$NewPlanInfoImplCopyWith<_$NewPlanInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
