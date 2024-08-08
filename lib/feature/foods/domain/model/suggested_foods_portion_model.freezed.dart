// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggested_foods_portion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestedFoodsPortion {
  List<Food> get foods => throw _privateConstructorUsedError;
  List<double> get totalMacro => throw _privateConstructorUsedError;
  int get accuracy => throw _privateConstructorUsedError;
  List<int> get foodsIndexesNotAddedByUser =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestedFoodsPortionCopyWith<SuggestedFoodsPortion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedFoodsPortionCopyWith<$Res> {
  factory $SuggestedFoodsPortionCopyWith(SuggestedFoodsPortion value,
          $Res Function(SuggestedFoodsPortion) then) =
      _$SuggestedFoodsPortionCopyWithImpl<$Res, SuggestedFoodsPortion>;
  @useResult
  $Res call(
      {List<Food> foods,
      List<double> totalMacro,
      int accuracy,
      List<int> foodsIndexesNotAddedByUser});
}

/// @nodoc
class _$SuggestedFoodsPortionCopyWithImpl<$Res,
        $Val extends SuggestedFoodsPortion>
    implements $SuggestedFoodsPortionCopyWith<$Res> {
  _$SuggestedFoodsPortionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? totalMacro = null,
    Object? accuracy = null,
    Object? foodsIndexesNotAddedByUser = null,
  }) {
    return _then(_value.copyWith(
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      totalMacro: null == totalMacro
          ? _value.totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      foodsIndexesNotAddedByUser: null == foodsIndexesNotAddedByUser
          ? _value.foodsIndexesNotAddedByUser
          : foodsIndexesNotAddedByUser // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestedFoodsPortionImplCopyWith<$Res>
    implements $SuggestedFoodsPortionCopyWith<$Res> {
  factory _$$SuggestedFoodsPortionImplCopyWith(
          _$SuggestedFoodsPortionImpl value,
          $Res Function(_$SuggestedFoodsPortionImpl) then) =
      __$$SuggestedFoodsPortionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Food> foods,
      List<double> totalMacro,
      int accuracy,
      List<int> foodsIndexesNotAddedByUser});
}

/// @nodoc
class __$$SuggestedFoodsPortionImplCopyWithImpl<$Res>
    extends _$SuggestedFoodsPortionCopyWithImpl<$Res,
        _$SuggestedFoodsPortionImpl>
    implements _$$SuggestedFoodsPortionImplCopyWith<$Res> {
  __$$SuggestedFoodsPortionImplCopyWithImpl(_$SuggestedFoodsPortionImpl _value,
      $Res Function(_$SuggestedFoodsPortionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? totalMacro = null,
    Object? accuracy = null,
    Object? foodsIndexesNotAddedByUser = null,
  }) {
    return _then(_$SuggestedFoodsPortionImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      totalMacro: null == totalMacro
          ? _value._totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
      foodsIndexesNotAddedByUser: null == foodsIndexesNotAddedByUser
          ? _value._foodsIndexesNotAddedByUser
          : foodsIndexesNotAddedByUser // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$SuggestedFoodsPortionImpl implements _SuggestedFoodsPortion {
  _$SuggestedFoodsPortionImpl(
      {final List<Food> foods = const [],
      final List<double> totalMacro = const [],
      this.accuracy = 0,
      final List<int> foodsIndexesNotAddedByUser = const []})
      : _foods = foods,
        _totalMacro = totalMacro,
        _foodsIndexesNotAddedByUser = foodsIndexesNotAddedByUser;

  final List<Food> _foods;
  @override
  @JsonKey()
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<double> _totalMacro;
  @override
  @JsonKey()
  List<double> get totalMacro {
    if (_totalMacro is EqualUnmodifiableListView) return _totalMacro;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalMacro);
  }

  @override
  @JsonKey()
  final int accuracy;
  final List<int> _foodsIndexesNotAddedByUser;
  @override
  @JsonKey()
  List<int> get foodsIndexesNotAddedByUser {
    if (_foodsIndexesNotAddedByUser is EqualUnmodifiableListView)
      return _foodsIndexesNotAddedByUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodsIndexesNotAddedByUser);
  }

  @override
  String toString() {
    return 'SuggestedFoodsPortion(foods: $foods, totalMacro: $totalMacro, accuracy: $accuracy, foodsIndexesNotAddedByUser: $foodsIndexesNotAddedByUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedFoodsPortionImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality()
                .equals(other._totalMacro, _totalMacro) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            const DeepCollectionEquality().equals(
                other._foodsIndexesNotAddedByUser,
                _foodsIndexesNotAddedByUser));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foods),
      const DeepCollectionEquality().hash(_totalMacro),
      accuracy,
      const DeepCollectionEquality().hash(_foodsIndexesNotAddedByUser));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedFoodsPortionImplCopyWith<_$SuggestedFoodsPortionImpl>
      get copyWith => __$$SuggestedFoodsPortionImplCopyWithImpl<
          _$SuggestedFoodsPortionImpl>(this, _$identity);
}

abstract class _SuggestedFoodsPortion implements SuggestedFoodsPortion {
  factory _SuggestedFoodsPortion(
          {final List<Food> foods,
          final List<double> totalMacro,
          final int accuracy,
          final List<int> foodsIndexesNotAddedByUser}) =
      _$SuggestedFoodsPortionImpl;

  @override
  List<Food> get foods;
  @override
  List<double> get totalMacro;
  @override
  int get accuracy;
  @override
  List<int> get foodsIndexesNotAddedByUser;
  @override
  @JsonKey(ignore: true)
  _$$SuggestedFoodsPortionImplCopyWith<_$SuggestedFoodsPortionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
