// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPlan {
  String get id => throw _privateConstructorUsedError;
  bool get isAutoPaymentOn => throw _privateConstructorUsedError;
  String get customerId => throw _privateConstructorUsedError;
  SubscriptionPlan? get subscriptionPlan => throw _privateConstructorUsedError;
  int get favoriteFoodLeft => throw _privateConstructorUsedError;
  int get suggestFoodRequestsLeft => throw _privateConstructorUsedError;
  int get foodPortionRequestsLeft => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPlanCopyWith<UserPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlanCopyWith<$Res> {
  factory $UserPlanCopyWith(UserPlan value, $Res Function(UserPlan) then) =
      _$UserPlanCopyWithImpl<$Res, UserPlan>;
  @useResult
  $Res call(
      {String id,
      bool isAutoPaymentOn,
      String customerId,
      SubscriptionPlan? subscriptionPlan,
      int favoriteFoodLeft,
      int suggestFoodRequestsLeft,
      int foodPortionRequestsLeft});

  $SubscriptionPlanCopyWith<$Res>? get subscriptionPlan;
}

/// @nodoc
class _$UserPlanCopyWithImpl<$Res, $Val extends UserPlan>
    implements $UserPlanCopyWith<$Res> {
  _$UserPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isAutoPaymentOn = null,
    Object? customerId = null,
    Object? subscriptionPlan = freezed,
    Object? favoriteFoodLeft = null,
    Object? suggestFoodRequestsLeft = null,
    Object? foodPortionRequestsLeft = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAutoPaymentOn: null == isAutoPaymentOn
          ? _value.isAutoPaymentOn
          : isAutoPaymentOn // ignore: cast_nullable_to_non_nullable
              as bool,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlan?,
      favoriteFoodLeft: null == favoriteFoodLeft
          ? _value.favoriteFoodLeft
          : favoriteFoodLeft // ignore: cast_nullable_to_non_nullable
              as int,
      suggestFoodRequestsLeft: null == suggestFoodRequestsLeft
          ? _value.suggestFoodRequestsLeft
          : suggestFoodRequestsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      foodPortionRequestsLeft: null == foodPortionRequestsLeft
          ? _value.foodPortionRequestsLeft
          : foodPortionRequestsLeft // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionPlanCopyWith<$Res>? get subscriptionPlan {
    if (_value.subscriptionPlan == null) {
      return null;
    }

    return $SubscriptionPlanCopyWith<$Res>(_value.subscriptionPlan!, (value) {
      return _then(_value.copyWith(subscriptionPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPlanImplCopyWith<$Res>
    implements $UserPlanCopyWith<$Res> {
  factory _$$UserPlanImplCopyWith(
          _$UserPlanImpl value, $Res Function(_$UserPlanImpl) then) =
      __$$UserPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isAutoPaymentOn,
      String customerId,
      SubscriptionPlan? subscriptionPlan,
      int favoriteFoodLeft,
      int suggestFoodRequestsLeft,
      int foodPortionRequestsLeft});

  @override
  $SubscriptionPlanCopyWith<$Res>? get subscriptionPlan;
}

/// @nodoc
class __$$UserPlanImplCopyWithImpl<$Res>
    extends _$UserPlanCopyWithImpl<$Res, _$UserPlanImpl>
    implements _$$UserPlanImplCopyWith<$Res> {
  __$$UserPlanImplCopyWithImpl(
      _$UserPlanImpl _value, $Res Function(_$UserPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isAutoPaymentOn = null,
    Object? customerId = null,
    Object? subscriptionPlan = freezed,
    Object? favoriteFoodLeft = null,
    Object? suggestFoodRequestsLeft = null,
    Object? foodPortionRequestsLeft = null,
  }) {
    return _then(_$UserPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAutoPaymentOn: null == isAutoPaymentOn
          ? _value.isAutoPaymentOn
          : isAutoPaymentOn // ignore: cast_nullable_to_non_nullable
              as bool,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlan?,
      favoriteFoodLeft: null == favoriteFoodLeft
          ? _value.favoriteFoodLeft
          : favoriteFoodLeft // ignore: cast_nullable_to_non_nullable
              as int,
      suggestFoodRequestsLeft: null == suggestFoodRequestsLeft
          ? _value.suggestFoodRequestsLeft
          : suggestFoodRequestsLeft // ignore: cast_nullable_to_non_nullable
              as int,
      foodPortionRequestsLeft: null == foodPortionRequestsLeft
          ? _value.foodPortionRequestsLeft
          : foodPortionRequestsLeft // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UserPlanImpl implements _UserPlan {
  _$UserPlanImpl(
      {this.id = '',
      this.isAutoPaymentOn = true,
      this.customerId = '',
      this.subscriptionPlan = null,
      this.favoriteFoodLeft = 0,
      this.suggestFoodRequestsLeft = 0,
      this.foodPortionRequestsLeft = 0});

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final bool isAutoPaymentOn;
  @override
  @JsonKey()
  final String customerId;
  @override
  @JsonKey()
  final SubscriptionPlan? subscriptionPlan;
  @override
  @JsonKey()
  final int favoriteFoodLeft;
  @override
  @JsonKey()
  final int suggestFoodRequestsLeft;
  @override
  @JsonKey()
  final int foodPortionRequestsLeft;

  @override
  String toString() {
    return 'UserPlan(id: $id, isAutoPaymentOn: $isAutoPaymentOn, customerId: $customerId, subscriptionPlan: $subscriptionPlan, favoriteFoodLeft: $favoriteFoodLeft, suggestFoodRequestsLeft: $suggestFoodRequestsLeft, foodPortionRequestsLeft: $foodPortionRequestsLeft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAutoPaymentOn, isAutoPaymentOn) ||
                other.isAutoPaymentOn == isAutoPaymentOn) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.subscriptionPlan, subscriptionPlan) ||
                other.subscriptionPlan == subscriptionPlan) &&
            (identical(other.favoriteFoodLeft, favoriteFoodLeft) ||
                other.favoriteFoodLeft == favoriteFoodLeft) &&
            (identical(
                    other.suggestFoodRequestsLeft, suggestFoodRequestsLeft) ||
                other.suggestFoodRequestsLeft == suggestFoodRequestsLeft) &&
            (identical(
                    other.foodPortionRequestsLeft, foodPortionRequestsLeft) ||
                other.foodPortionRequestsLeft == foodPortionRequestsLeft));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      isAutoPaymentOn,
      customerId,
      subscriptionPlan,
      favoriteFoodLeft,
      suggestFoodRequestsLeft,
      foodPortionRequestsLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPlanImplCopyWith<_$UserPlanImpl> get copyWith =>
      __$$UserPlanImplCopyWithImpl<_$UserPlanImpl>(this, _$identity);
}

abstract class _UserPlan implements UserPlan {
  factory _UserPlan(
      {final String id,
      final bool isAutoPaymentOn,
      final String customerId,
      final SubscriptionPlan? subscriptionPlan,
      final int favoriteFoodLeft,
      final int suggestFoodRequestsLeft,
      final int foodPortionRequestsLeft}) = _$UserPlanImpl;

  @override
  String get id;
  @override
  bool get isAutoPaymentOn;
  @override
  String get customerId;
  @override
  SubscriptionPlan? get subscriptionPlan;
  @override
  int get favoriteFoodLeft;
  @override
  int get suggestFoodRequestsLeft;
  @override
  int get foodPortionRequestsLeft;
  @override
  @JsonKey(ignore: true)
  _$$UserPlanImplCopyWith<_$UserPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
