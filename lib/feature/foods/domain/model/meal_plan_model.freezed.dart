// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_plan_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MealPlan {
  String get mealPlanId => throw _privateConstructorUsedError;
  List<Food> get foods => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<double> get totalMacro => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealPlanCopyWith<MealPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanCopyWith<$Res> {
  factory $MealPlanCopyWith(MealPlan value, $Res Function(MealPlan) then) =
      _$MealPlanCopyWithImpl<$Res, MealPlan>;
  @useResult
  $Res call(
      {String mealPlanId,
      List<Food> foods,
      String name,
      List<double> totalMacro});
}

/// @nodoc
class _$MealPlanCopyWithImpl<$Res, $Val extends MealPlan>
    implements $MealPlanCopyWith<$Res> {
  _$MealPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlanId = null,
    Object? foods = null,
    Object? name = null,
    Object? totalMacro = null,
  }) {
    return _then(_value.copyWith(
      mealPlanId: null == mealPlanId
          ? _value.mealPlanId
          : mealPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalMacro: null == totalMacro
          ? _value.totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealPlanImplCopyWith<$Res>
    implements $MealPlanCopyWith<$Res> {
  factory _$$MealPlanImplCopyWith(
          _$MealPlanImpl value, $Res Function(_$MealPlanImpl) then) =
      __$$MealPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mealPlanId,
      List<Food> foods,
      String name,
      List<double> totalMacro});
}

/// @nodoc
class __$$MealPlanImplCopyWithImpl<$Res>
    extends _$MealPlanCopyWithImpl<$Res, _$MealPlanImpl>
    implements _$$MealPlanImplCopyWith<$Res> {
  __$$MealPlanImplCopyWithImpl(
      _$MealPlanImpl _value, $Res Function(_$MealPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlanId = null,
    Object? foods = null,
    Object? name = null,
    Object? totalMacro = null,
  }) {
    return _then(_$MealPlanImpl(
      mealPlanId: null == mealPlanId
          ? _value.mealPlanId
          : mealPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalMacro: null == totalMacro
          ? _value._totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$MealPlanImpl implements _MealPlan {
  _$MealPlanImpl(
      {this.mealPlanId = '',
      final List<Food> foods = const [],
      this.name = '',
      final List<double> totalMacro = const []})
      : _foods = foods,
        _totalMacro = totalMacro;

  @override
  @JsonKey()
  final String mealPlanId;
  final List<Food> _foods;
  @override
  @JsonKey()
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  @JsonKey()
  final String name;
  final List<double> _totalMacro;
  @override
  @JsonKey()
  List<double> get totalMacro {
    if (_totalMacro is EqualUnmodifiableListView) return _totalMacro;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalMacro);
  }

  @override
  String toString() {
    return 'MealPlan(mealPlanId: $mealPlanId, foods: $foods, name: $name, totalMacro: $totalMacro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanImpl &&
            (identical(other.mealPlanId, mealPlanId) ||
                other.mealPlanId == mealPlanId) &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._totalMacro, _totalMacro));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mealPlanId,
      const DeepCollectionEquality().hash(_foods),
      name,
      const DeepCollectionEquality().hash(_totalMacro));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanImplCopyWith<_$MealPlanImpl> get copyWith =>
      __$$MealPlanImplCopyWithImpl<_$MealPlanImpl>(this, _$identity);
}

abstract class _MealPlan implements MealPlan {
  factory _MealPlan(
      {final String mealPlanId,
      final List<Food> foods,
      final String name,
      final List<double> totalMacro}) = _$MealPlanImpl;

  @override
  String get mealPlanId;
  @override
  List<Food> get foods;
  @override
  String get name;
  @override
  List<double> get totalMacro;
  @override
  @JsonKey(ignore: true)
  _$$MealPlanImplCopyWith<_$MealPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
