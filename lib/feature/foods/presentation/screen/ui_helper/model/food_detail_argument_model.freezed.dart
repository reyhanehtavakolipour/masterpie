// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_detail_argument_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodDetailArgumentModel {
  FoodDetailScreenType get foodDetailScreenType =>
      throw _privateConstructorUsedError;
  Food? get food => throw _privateConstructorUsedError;
  FoodsListScreen? get foodsListScreen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodDetailArgumentModelCopyWith<FoodDetailArgumentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodDetailArgumentModelCopyWith<$Res> {
  factory $FoodDetailArgumentModelCopyWith(FoodDetailArgumentModel value,
          $Res Function(FoodDetailArgumentModel) then) =
      _$FoodDetailArgumentModelCopyWithImpl<$Res, FoodDetailArgumentModel>;
  @useResult
  $Res call(
      {FoodDetailScreenType foodDetailScreenType,
      Food? food,
      FoodsListScreen? foodsListScreen});

  $FoodCopyWith<$Res>? get food;
}

/// @nodoc
class _$FoodDetailArgumentModelCopyWithImpl<$Res,
        $Val extends FoodDetailArgumentModel>
    implements $FoodDetailArgumentModelCopyWith<$Res> {
  _$FoodDetailArgumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodDetailScreenType = null,
    Object? food = freezed,
    Object? foodsListScreen = freezed,
  }) {
    return _then(_value.copyWith(
      foodDetailScreenType: null == foodDetailScreenType
          ? _value.foodDetailScreenType
          : foodDetailScreenType // ignore: cast_nullable_to_non_nullable
              as FoodDetailScreenType,
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
      foodsListScreen: freezed == foodsListScreen
          ? _value.foodsListScreen
          : foodsListScreen // ignore: cast_nullable_to_non_nullable
              as FoodsListScreen?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FoodCopyWith<$Res>? get food {
    if (_value.food == null) {
      return null;
    }

    return $FoodCopyWith<$Res>(_value.food!, (value) {
      return _then(_value.copyWith(food: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodDetailArgumentModelImplCopyWith<$Res>
    implements $FoodDetailArgumentModelCopyWith<$Res> {
  factory _$$FoodDetailArgumentModelImplCopyWith(
          _$FoodDetailArgumentModelImpl value,
          $Res Function(_$FoodDetailArgumentModelImpl) then) =
      __$$FoodDetailArgumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FoodDetailScreenType foodDetailScreenType,
      Food? food,
      FoodsListScreen? foodsListScreen});

  @override
  $FoodCopyWith<$Res>? get food;
}

/// @nodoc
class __$$FoodDetailArgumentModelImplCopyWithImpl<$Res>
    extends _$FoodDetailArgumentModelCopyWithImpl<$Res,
        _$FoodDetailArgumentModelImpl>
    implements _$$FoodDetailArgumentModelImplCopyWith<$Res> {
  __$$FoodDetailArgumentModelImplCopyWithImpl(
      _$FoodDetailArgumentModelImpl _value,
      $Res Function(_$FoodDetailArgumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodDetailScreenType = null,
    Object? food = freezed,
    Object? foodsListScreen = freezed,
  }) {
    return _then(_$FoodDetailArgumentModelImpl(
      foodDetailScreenType: null == foodDetailScreenType
          ? _value.foodDetailScreenType
          : foodDetailScreenType // ignore: cast_nullable_to_non_nullable
              as FoodDetailScreenType,
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
      foodsListScreen: freezed == foodsListScreen
          ? _value.foodsListScreen
          : foodsListScreen // ignore: cast_nullable_to_non_nullable
              as FoodsListScreen?,
    ));
  }
}

/// @nodoc

class _$FoodDetailArgumentModelImpl implements _FoodDetailArgumentModel {
  _$FoodDetailArgumentModelImpl(
      {this.foodDetailScreenType = FoodDetailScreenType.ADD_NEW_FAVORITE,
      this.food = null,
      this.foodsListScreen = null});

  @override
  @JsonKey()
  final FoodDetailScreenType foodDetailScreenType;
  @override
  @JsonKey()
  final Food? food;
  @override
  @JsonKey()
  final FoodsListScreen? foodsListScreen;

  @override
  String toString() {
    return 'FoodDetailArgumentModel(foodDetailScreenType: $foodDetailScreenType, food: $food, foodsListScreen: $foodsListScreen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodDetailArgumentModelImpl &&
            (identical(other.foodDetailScreenType, foodDetailScreenType) ||
                other.foodDetailScreenType == foodDetailScreenType) &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.foodsListScreen, foodsListScreen) ||
                other.foodsListScreen == foodsListScreen));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, foodDetailScreenType, food, foodsListScreen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodDetailArgumentModelImplCopyWith<_$FoodDetailArgumentModelImpl>
      get copyWith => __$$FoodDetailArgumentModelImplCopyWithImpl<
          _$FoodDetailArgumentModelImpl>(this, _$identity);
}

abstract class _FoodDetailArgumentModel implements FoodDetailArgumentModel {
  factory _FoodDetailArgumentModel(
      {final FoodDetailScreenType foodDetailScreenType,
      final Food? food,
      final FoodsListScreen? foodsListScreen}) = _$FoodDetailArgumentModelImpl;

  @override
  FoodDetailScreenType get foodDetailScreenType;
  @override
  Food? get food;
  @override
  FoodsListScreen? get foodsListScreen;
  @override
  @JsonKey(ignore: true)
  _$$FoodDetailArgumentModelImplCopyWith<_$FoodDetailArgumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
