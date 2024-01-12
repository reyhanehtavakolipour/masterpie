// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubscriptionPlan {
  String get id => throw _privateConstructorUsedError;
  String get plan => throw _privateConstructorUsedError;
  List<String> get intervals => throw _privateConstructorUsedError;
  List<int> get prices => throw _privateConstructorUsedError;
  int get favoriteFoodLimit => throw _privateConstructorUsedError;
  int get suggestFoodRequestsLimit => throw _privateConstructorUsedError;
  int get foodPortionRequestsLimit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionPlanCopyWith<SubscriptionPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionPlanCopyWith<$Res> {
  factory $SubscriptionPlanCopyWith(
          SubscriptionPlan value, $Res Function(SubscriptionPlan) then) =
      _$SubscriptionPlanCopyWithImpl<$Res, SubscriptionPlan>;
  @useResult
  $Res call(
      {String id,
      String plan,
      List<String> intervals,
      List<int> prices,
      int favoriteFoodLimit,
      int suggestFoodRequestsLimit,
      int foodPortionRequestsLimit});
}

/// @nodoc
class _$SubscriptionPlanCopyWithImpl<$Res, $Val extends SubscriptionPlan>
    implements $SubscriptionPlanCopyWith<$Res> {
  _$SubscriptionPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? plan = null,
    Object? intervals = null,
    Object? prices = null,
    Object? favoriteFoodLimit = null,
    Object? suggestFoodRequestsLimit = null,
    Object? foodPortionRequestsLimit = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      intervals: null == intervals
          ? _value.intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prices: null == prices
          ? _value.prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      favoriteFoodLimit: null == favoriteFoodLimit
          ? _value.favoriteFoodLimit
          : favoriteFoodLimit // ignore: cast_nullable_to_non_nullable
              as int,
      suggestFoodRequestsLimit: null == suggestFoodRequestsLimit
          ? _value.suggestFoodRequestsLimit
          : suggestFoodRequestsLimit // ignore: cast_nullable_to_non_nullable
              as int,
      foodPortionRequestsLimit: null == foodPortionRequestsLimit
          ? _value.foodPortionRequestsLimit
          : foodPortionRequestsLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionPlanImplCopyWith<$Res>
    implements $SubscriptionPlanCopyWith<$Res> {
  factory _$$SubscriptionPlanImplCopyWith(_$SubscriptionPlanImpl value,
          $Res Function(_$SubscriptionPlanImpl) then) =
      __$$SubscriptionPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String plan,
      List<String> intervals,
      List<int> prices,
      int favoriteFoodLimit,
      int suggestFoodRequestsLimit,
      int foodPortionRequestsLimit});
}

/// @nodoc
class __$$SubscriptionPlanImplCopyWithImpl<$Res>
    extends _$SubscriptionPlanCopyWithImpl<$Res, _$SubscriptionPlanImpl>
    implements _$$SubscriptionPlanImplCopyWith<$Res> {
  __$$SubscriptionPlanImplCopyWithImpl(_$SubscriptionPlanImpl _value,
      $Res Function(_$SubscriptionPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? plan = null,
    Object? intervals = null,
    Object? prices = null,
    Object? favoriteFoodLimit = null,
    Object? suggestFoodRequestsLimit = null,
    Object? foodPortionRequestsLimit = null,
  }) {
    return _then(_$SubscriptionPlanImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as String,
      intervals: null == intervals
          ? _value._intervals
          : intervals // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prices: null == prices
          ? _value._prices
          : prices // ignore: cast_nullable_to_non_nullable
              as List<int>,
      favoriteFoodLimit: null == favoriteFoodLimit
          ? _value.favoriteFoodLimit
          : favoriteFoodLimit // ignore: cast_nullable_to_non_nullable
              as int,
      suggestFoodRequestsLimit: null == suggestFoodRequestsLimit
          ? _value.suggestFoodRequestsLimit
          : suggestFoodRequestsLimit // ignore: cast_nullable_to_non_nullable
              as int,
      foodPortionRequestsLimit: null == foodPortionRequestsLimit
          ? _value.foodPortionRequestsLimit
          : foodPortionRequestsLimit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SubscriptionPlanImpl implements _SubscriptionPlan {
  _$SubscriptionPlanImpl(
      {this.id = '',
      this.plan = '',
      final List<String> intervals = const [],
      final List<int> prices = const [],
      this.favoriteFoodLimit = 0,
      this.suggestFoodRequestsLimit = 0,
      this.foodPortionRequestsLimit = 0})
      : _intervals = intervals,
        _prices = prices;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String plan;
  final List<String> _intervals;
  @override
  @JsonKey()
  List<String> get intervals {
    if (_intervals is EqualUnmodifiableListView) return _intervals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_intervals);
  }

  final List<int> _prices;
  @override
  @JsonKey()
  List<int> get prices {
    if (_prices is EqualUnmodifiableListView) return _prices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_prices);
  }

  @override
  @JsonKey()
  final int favoriteFoodLimit;
  @override
  @JsonKey()
  final int suggestFoodRequestsLimit;
  @override
  @JsonKey()
  final int foodPortionRequestsLimit;

  @override
  String toString() {
    return 'SubscriptionPlan(id: $id, plan: $plan, intervals: $intervals, prices: $prices, favoriteFoodLimit: $favoriteFoodLimit, suggestFoodRequestsLimit: $suggestFoodRequestsLimit, foodPortionRequestsLimit: $foodPortionRequestsLimit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionPlanImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.plan, plan) || other.plan == plan) &&
            const DeepCollectionEquality()
                .equals(other._intervals, _intervals) &&
            const DeepCollectionEquality().equals(other._prices, _prices) &&
            (identical(other.favoriteFoodLimit, favoriteFoodLimit) ||
                other.favoriteFoodLimit == favoriteFoodLimit) &&
            (identical(
                    other.suggestFoodRequestsLimit, suggestFoodRequestsLimit) ||
                other.suggestFoodRequestsLimit == suggestFoodRequestsLimit) &&
            (identical(
                    other.foodPortionRequestsLimit, foodPortionRequestsLimit) ||
                other.foodPortionRequestsLimit == foodPortionRequestsLimit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      plan,
      const DeepCollectionEquality().hash(_intervals),
      const DeepCollectionEquality().hash(_prices),
      favoriteFoodLimit,
      suggestFoodRequestsLimit,
      foodPortionRequestsLimit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionPlanImplCopyWith<_$SubscriptionPlanImpl> get copyWith =>
      __$$SubscriptionPlanImplCopyWithImpl<_$SubscriptionPlanImpl>(
          this, _$identity);
}

abstract class _SubscriptionPlan implements SubscriptionPlan {
  factory _SubscriptionPlan(
      {final String id,
      final String plan,
      final List<String> intervals,
      final List<int> prices,
      final int favoriteFoodLimit,
      final int suggestFoodRequestsLimit,
      final int foodPortionRequestsLimit}) = _$SubscriptionPlanImpl;

  @override
  String get id;
  @override
  String get plan;
  @override
  List<String> get intervals;
  @override
  List<int> get prices;
  @override
  int get favoriteFoodLimit;
  @override
  int get suggestFoodRequestsLimit;
  @override
  int get foodPortionRequestsLimit;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionPlanImplCopyWith<_$SubscriptionPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
