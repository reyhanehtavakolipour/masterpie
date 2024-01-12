// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_plan_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserPlanRemote {
  String get id => throw _privateConstructorUsedError;
  bool get isAutoPaymentOn => throw _privateConstructorUsedError;
  SubscriptionPlanRemote? get subscriptionPlan =>
      throw _privateConstructorUsedError;
  int get favoriteFoodLeft => throw _privateConstructorUsedError;
  int get suggestFoodRequestsLeft => throw _privateConstructorUsedError;
  int get foodPortionRequestsLeft => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserPlanRemoteCopyWith<UserPlanRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlanRemoteCopyWith<$Res> {
  factory $UserPlanRemoteCopyWith(
          UserPlanRemote value, $Res Function(UserPlanRemote) then) =
      _$UserPlanRemoteCopyWithImpl<$Res, UserPlanRemote>;
  @useResult
  $Res call(
      {String id,
      bool isAutoPaymentOn,
      SubscriptionPlanRemote? subscriptionPlan,
      int favoriteFoodLeft,
      int suggestFoodRequestsLeft,
      int foodPortionRequestsLeft});

  $SubscriptionPlanRemoteCopyWith<$Res>? get subscriptionPlan;
}

/// @nodoc
class _$UserPlanRemoteCopyWithImpl<$Res, $Val extends UserPlanRemote>
    implements $UserPlanRemoteCopyWith<$Res> {
  _$UserPlanRemoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isAutoPaymentOn = null,
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
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlanRemote?,
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
  $SubscriptionPlanRemoteCopyWith<$Res>? get subscriptionPlan {
    if (_value.subscriptionPlan == null) {
      return null;
    }

    return $SubscriptionPlanRemoteCopyWith<$Res>(_value.subscriptionPlan!,
        (value) {
      return _then(_value.copyWith(subscriptionPlan: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserPlanRemoteImplCopyWith<$Res>
    implements $UserPlanRemoteCopyWith<$Res> {
  factory _$$UserPlanRemoteImplCopyWith(_$UserPlanRemoteImpl value,
          $Res Function(_$UserPlanRemoteImpl) then) =
      __$$UserPlanRemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      bool isAutoPaymentOn,
      SubscriptionPlanRemote? subscriptionPlan,
      int favoriteFoodLeft,
      int suggestFoodRequestsLeft,
      int foodPortionRequestsLeft});

  @override
  $SubscriptionPlanRemoteCopyWith<$Res>? get subscriptionPlan;
}

/// @nodoc
class __$$UserPlanRemoteImplCopyWithImpl<$Res>
    extends _$UserPlanRemoteCopyWithImpl<$Res, _$UserPlanRemoteImpl>
    implements _$$UserPlanRemoteImplCopyWith<$Res> {
  __$$UserPlanRemoteImplCopyWithImpl(
      _$UserPlanRemoteImpl _value, $Res Function(_$UserPlanRemoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? isAutoPaymentOn = null,
    Object? subscriptionPlan = freezed,
    Object? favoriteFoodLeft = null,
    Object? suggestFoodRequestsLeft = null,
    Object? foodPortionRequestsLeft = null,
  }) {
    return _then(_$UserPlanRemoteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      isAutoPaymentOn: null == isAutoPaymentOn
          ? _value.isAutoPaymentOn
          : isAutoPaymentOn // ignore: cast_nullable_to_non_nullable
              as bool,
      subscriptionPlan: freezed == subscriptionPlan
          ? _value.subscriptionPlan
          : subscriptionPlan // ignore: cast_nullable_to_non_nullable
              as SubscriptionPlanRemote?,
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

class _$UserPlanRemoteImpl implements _UserPlanRemote {
  _$UserPlanRemoteImpl(
      {this.id = '',
      this.isAutoPaymentOn = true,
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
  final SubscriptionPlanRemote? subscriptionPlan;
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
    return 'UserPlanRemote(id: $id, isAutoPaymentOn: $isAutoPaymentOn, subscriptionPlan: $subscriptionPlan, favoriteFoodLeft: $favoriteFoodLeft, suggestFoodRequestsLeft: $suggestFoodRequestsLeft, foodPortionRequestsLeft: $foodPortionRequestsLeft)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlanRemoteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAutoPaymentOn, isAutoPaymentOn) ||
                other.isAutoPaymentOn == isAutoPaymentOn) &&
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
      subscriptionPlan,
      favoriteFoodLeft,
      suggestFoodRequestsLeft,
      foodPortionRequestsLeft);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPlanRemoteImplCopyWith<_$UserPlanRemoteImpl> get copyWith =>
      __$$UserPlanRemoteImplCopyWithImpl<_$UserPlanRemoteImpl>(
          this, _$identity);
}

abstract class _UserPlanRemote implements UserPlanRemote {
  factory _UserPlanRemote(
      {final String id,
      final bool isAutoPaymentOn,
      final SubscriptionPlanRemote? subscriptionPlan,
      final int favoriteFoodLeft,
      final int suggestFoodRequestsLeft,
      final int foodPortionRequestsLeft}) = _$UserPlanRemoteImpl;

  @override
  String get id;
  @override
  bool get isAutoPaymentOn;
  @override
  SubscriptionPlanRemote? get subscriptionPlan;
  @override
  int get favoriteFoodLeft;
  @override
  int get suggestFoodRequestsLeft;
  @override
  int get foodPortionRequestsLeft;
  @override
  @JsonKey(ignore: true)
  _$$UserPlanRemoteImplCopyWith<_$UserPlanRemoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
