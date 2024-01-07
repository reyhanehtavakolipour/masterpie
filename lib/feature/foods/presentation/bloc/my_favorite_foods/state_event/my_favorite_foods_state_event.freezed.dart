// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_favorite_foods_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyFavoriteFoodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodType foodType, String query)
        onGetMyFavoriteFoods,
    required TResult Function(Food food) onImmediateSearchInMyFavoriteFoods,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult? Function(Food food)? onImmediateSearchInMyFavoriteFoods,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult Function(Food food)? onImmediateSearchInMyFavoriteFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteFoods value) onGetMyFavoriteFoods,
    required TResult Function(ImmediateSearchFavoriteFoods value)
        onImmediateSearchInMyFavoriteFoods,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult? Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyFavoriteFoodsEventCopyWith<$Res> {
  factory $MyFavoriteFoodsEventCopyWith(MyFavoriteFoodsEvent value,
          $Res Function(MyFavoriteFoodsEvent) then) =
      _$MyFavoriteFoodsEventCopyWithImpl<$Res, MyFavoriteFoodsEvent>;
}

/// @nodoc
class _$MyFavoriteFoodsEventCopyWithImpl<$Res,
        $Val extends MyFavoriteFoodsEvent>
    implements $MyFavoriteFoodsEventCopyWith<$Res> {
  _$MyFavoriteFoodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoriteFoodsCopyWith<$Res> {
  factory _$$FavoriteFoodsCopyWith(
          _$FavoriteFoods value, $Res Function(_$FavoriteFoods) then) =
      __$$FavoriteFoodsCopyWithImpl<$Res>;
  @useResult
  $Res call({FoodType foodType, String query});
}

/// @nodoc
class __$$FavoriteFoodsCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsEventCopyWithImpl<$Res, _$FavoriteFoods>
    implements _$$FavoriteFoodsCopyWith<$Res> {
  __$$FavoriteFoodsCopyWithImpl(
      _$FavoriteFoods _value, $Res Function(_$FavoriteFoods) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodType = null,
    Object? query = null,
  }) {
    return _then(_$FavoriteFoods(
      null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavoriteFoods implements FavoriteFoods {
  const _$FavoriteFoods(this.foodType, this.query);

  @override
  final FoodType foodType;
  @override
  final String query;

  @override
  String toString() {
    return 'MyFavoriteFoodsEvent.onGetMyFavoriteFoods(foodType: $foodType, query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteFoods &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foodType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteFoodsCopyWith<_$FavoriteFoods> get copyWith =>
      __$$FavoriteFoodsCopyWithImpl<_$FavoriteFoods>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodType foodType, String query)
        onGetMyFavoriteFoods,
    required TResult Function(Food food) onImmediateSearchInMyFavoriteFoods,
    required TResult Function() onReset,
  }) {
    return onGetMyFavoriteFoods(foodType, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult? Function(Food food)? onImmediateSearchInMyFavoriteFoods,
    TResult? Function()? onReset,
  }) {
    return onGetMyFavoriteFoods?.call(foodType, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult Function(Food food)? onImmediateSearchInMyFavoriteFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetMyFavoriteFoods != null) {
      return onGetMyFavoriteFoods(foodType, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteFoods value) onGetMyFavoriteFoods,
    required TResult Function(ImmediateSearchFavoriteFoods value)
        onImmediateSearchInMyFavoriteFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetMyFavoriteFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult? Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetMyFavoriteFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetMyFavoriteFoods != null) {
      return onGetMyFavoriteFoods(this);
    }
    return orElse();
  }
}

abstract class FavoriteFoods implements MyFavoriteFoodsEvent {
  const factory FavoriteFoods(final FoodType foodType, final String query) =
      _$FavoriteFoods;

  FoodType get foodType;
  String get query;
  @JsonKey(ignore: true)
  _$$FavoriteFoodsCopyWith<_$FavoriteFoods> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImmediateSearchFavoriteFoodsCopyWith<$Res> {
  factory _$$ImmediateSearchFavoriteFoodsCopyWith(
          _$ImmediateSearchFavoriteFoods value,
          $Res Function(_$ImmediateSearchFavoriteFoods) then) =
      __$$ImmediateSearchFavoriteFoodsCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$ImmediateSearchFavoriteFoodsCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsEventCopyWithImpl<$Res,
        _$ImmediateSearchFavoriteFoods>
    implements _$$ImmediateSearchFavoriteFoodsCopyWith<$Res> {
  __$$ImmediateSearchFavoriteFoodsCopyWithImpl(
      _$ImmediateSearchFavoriteFoods _value,
      $Res Function(_$ImmediateSearchFavoriteFoods) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$ImmediateSearchFavoriteFoods(
      null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FoodCopyWith<$Res> get food {
    return $FoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc

class _$ImmediateSearchFavoriteFoods implements ImmediateSearchFavoriteFoods {
  const _$ImmediateSearchFavoriteFoods(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'MyFavoriteFoodsEvent.onImmediateSearchInMyFavoriteFoods(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateSearchFavoriteFoods &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmediateSearchFavoriteFoodsCopyWith<_$ImmediateSearchFavoriteFoods>
      get copyWith => __$$ImmediateSearchFavoriteFoodsCopyWithImpl<
          _$ImmediateSearchFavoriteFoods>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodType foodType, String query)
        onGetMyFavoriteFoods,
    required TResult Function(Food food) onImmediateSearchInMyFavoriteFoods,
    required TResult Function() onReset,
  }) {
    return onImmediateSearchInMyFavoriteFoods(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult? Function(Food food)? onImmediateSearchInMyFavoriteFoods,
    TResult? Function()? onReset,
  }) {
    return onImmediateSearchInMyFavoriteFoods?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult Function(Food food)? onImmediateSearchInMyFavoriteFoods,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onImmediateSearchInMyFavoriteFoods != null) {
      return onImmediateSearchInMyFavoriteFoods(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoriteFoods value) onGetMyFavoriteFoods,
    required TResult Function(ImmediateSearchFavoriteFoods value)
        onImmediateSearchInMyFavoriteFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onImmediateSearchInMyFavoriteFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult? Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onImmediateSearchInMyFavoriteFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onImmediateSearchInMyFavoriteFoods != null) {
      return onImmediateSearchInMyFavoriteFoods(this);
    }
    return orElse();
  }
}

abstract class ImmediateSearchFavoriteFoods implements MyFavoriteFoodsEvent {
  const factory ImmediateSearchFavoriteFoods(final Food food) =
      _$ImmediateSearchFavoriteFoods;

  Food get food;
  @JsonKey(ignore: true)
  _$$ImmediateSearchFavoriteFoodsCopyWith<_$ImmediateSearchFavoriteFoods>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'MyFavoriteFoodsEvent.onReset()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Reset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(FoodType foodType, String query)
        onGetMyFavoriteFoods,
    required TResult Function(Food food) onImmediateSearchInMyFavoriteFoods,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult? Function(Food food)? onImmediateSearchInMyFavoriteFoods,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(FoodType foodType, String query)? onGetMyFavoriteFoods,
    TResult Function(Food food)? onImmediateSearchInMyFavoriteFoods,
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
    required TResult Function(FavoriteFoods value) onGetMyFavoriteFoods,
    required TResult Function(ImmediateSearchFavoriteFoods value)
        onImmediateSearchInMyFavoriteFoods,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult? Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoriteFoods value)? onGetMyFavoriteFoods,
    TResult Function(ImmediateSearchFavoriteFoods value)?
        onImmediateSearchInMyFavoriteFoods,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements MyFavoriteFoodsEvent {
  const factory Reset() = _$Reset;
}

/// @nodoc
mixin _$MyFavoriteFoodsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(String favoriteId)
        immediateSearchInFavoritesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(String favoriteId)? immediateSearchInFavoritesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(String favoriteId)? immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyFavoriteFoodsInitialState value) initial,
    required TResult Function(MyFavoriteFoodsLoadingState value) loading,
    required TResult Function(MyFavoriteFoodsErrorState value) error,
    required TResult Function(MyFavoriteFoodsLoadedState value) loaded,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInFavoritesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyFavoriteFoodsInitialState value)? initial,
    TResult? Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult? Function(MyFavoriteFoodsErrorState value)? error,
    TResult? Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyFavoriteFoodsInitialState value)? initial,
    TResult Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult Function(MyFavoriteFoodsErrorState value)? error,
    TResult Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyFavoriteFoodsStateCopyWith<$Res> {
  factory $MyFavoriteFoodsStateCopyWith(MyFavoriteFoodsState value,
          $Res Function(MyFavoriteFoodsState) then) =
      _$MyFavoriteFoodsStateCopyWithImpl<$Res, MyFavoriteFoodsState>;
}

/// @nodoc
class _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        $Val extends MyFavoriteFoodsState>
    implements $MyFavoriteFoodsStateCopyWith<$Res> {
  _$MyFavoriteFoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MyFavoriteFoodsInitialStateCopyWith<$Res> {
  factory _$$MyFavoriteFoodsInitialStateCopyWith(
          _$MyFavoriteFoodsInitialState value,
          $Res Function(_$MyFavoriteFoodsInitialState) then) =
      __$$MyFavoriteFoodsInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyFavoriteFoodsInitialStateCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsInitialState>
    implements _$$MyFavoriteFoodsInitialStateCopyWith<$Res> {
  __$$MyFavoriteFoodsInitialStateCopyWithImpl(
      _$MyFavoriteFoodsInitialState _value,
      $Res Function(_$MyFavoriteFoodsInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyFavoriteFoodsInitialState implements MyFavoriteFoodsInitialState {
  const _$MyFavoriteFoodsInitialState();

  @override
  String toString() {
    return 'MyFavoriteFoodsState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsInitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(String favoriteId)
        immediateSearchInFavoritesLoaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(String favoriteId)? immediateSearchInFavoritesLoaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(String favoriteId)? immediateSearchInFavoritesLoaded,
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
    required TResult Function(MyFavoriteFoodsInitialState value) initial,
    required TResult Function(MyFavoriteFoodsLoadingState value) loading,
    required TResult Function(MyFavoriteFoodsErrorState value) error,
    required TResult Function(MyFavoriteFoodsLoadedState value) loaded,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInFavoritesLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyFavoriteFoodsInitialState value)? initial,
    TResult? Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult? Function(MyFavoriteFoodsErrorState value)? error,
    TResult? Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyFavoriteFoodsInitialState value)? initial,
    TResult Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult Function(MyFavoriteFoodsErrorState value)? error,
    TResult Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MyFavoriteFoodsInitialState implements MyFavoriteFoodsState {
  const factory MyFavoriteFoodsInitialState() = _$MyFavoriteFoodsInitialState;
}

/// @nodoc
abstract class _$$MyFavoriteFoodsLoadingStateCopyWith<$Res> {
  factory _$$MyFavoriteFoodsLoadingStateCopyWith(
          _$MyFavoriteFoodsLoadingState value,
          $Res Function(_$MyFavoriteFoodsLoadingState) then) =
      __$$MyFavoriteFoodsLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyFavoriteFoodsLoadingStateCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsLoadingState>
    implements _$$MyFavoriteFoodsLoadingStateCopyWith<$Res> {
  __$$MyFavoriteFoodsLoadingStateCopyWithImpl(
      _$MyFavoriteFoodsLoadingState _value,
      $Res Function(_$MyFavoriteFoodsLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyFavoriteFoodsLoadingState implements MyFavoriteFoodsLoadingState {
  const _$MyFavoriteFoodsLoadingState();

  @override
  String toString() {
    return 'MyFavoriteFoodsState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(String favoriteId)
        immediateSearchInFavoritesLoaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(String favoriteId)? immediateSearchInFavoritesLoaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(String favoriteId)? immediateSearchInFavoritesLoaded,
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
    required TResult Function(MyFavoriteFoodsInitialState value) initial,
    required TResult Function(MyFavoriteFoodsLoadingState value) loading,
    required TResult Function(MyFavoriteFoodsErrorState value) error,
    required TResult Function(MyFavoriteFoodsLoadedState value) loaded,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInFavoritesLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyFavoriteFoodsInitialState value)? initial,
    TResult? Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult? Function(MyFavoriteFoodsErrorState value)? error,
    TResult? Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyFavoriteFoodsInitialState value)? initial,
    TResult Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult Function(MyFavoriteFoodsErrorState value)? error,
    TResult Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyFavoriteFoodsLoadingState implements MyFavoriteFoodsState {
  const factory MyFavoriteFoodsLoadingState() = _$MyFavoriteFoodsLoadingState;
}

/// @nodoc
abstract class _$$MyFavoriteFoodsErrorStateCopyWith<$Res> {
  factory _$$MyFavoriteFoodsErrorStateCopyWith(
          _$MyFavoriteFoodsErrorState value,
          $Res Function(_$MyFavoriteFoodsErrorState) then) =
      __$$MyFavoriteFoodsErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MyFavoriteFoodsErrorStateCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsErrorState>
    implements _$$MyFavoriteFoodsErrorStateCopyWith<$Res> {
  __$$MyFavoriteFoodsErrorStateCopyWithImpl(_$MyFavoriteFoodsErrorState _value,
      $Res Function(_$MyFavoriteFoodsErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MyFavoriteFoodsErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyFavoriteFoodsErrorState implements MyFavoriteFoodsErrorState {
  const _$MyFavoriteFoodsErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MyFavoriteFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyFavoriteFoodsErrorStateCopyWith<_$MyFavoriteFoodsErrorState>
      get copyWith => __$$MyFavoriteFoodsErrorStateCopyWithImpl<
          _$MyFavoriteFoodsErrorState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(String favoriteId)
        immediateSearchInFavoritesLoaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(String favoriteId)? immediateSearchInFavoritesLoaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(String favoriteId)? immediateSearchInFavoritesLoaded,
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
    required TResult Function(MyFavoriteFoodsInitialState value) initial,
    required TResult Function(MyFavoriteFoodsLoadingState value) loading,
    required TResult Function(MyFavoriteFoodsErrorState value) error,
    required TResult Function(MyFavoriteFoodsLoadedState value) loaded,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInFavoritesLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyFavoriteFoodsInitialState value)? initial,
    TResult? Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult? Function(MyFavoriteFoodsErrorState value)? error,
    TResult? Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyFavoriteFoodsInitialState value)? initial,
    TResult Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult Function(MyFavoriteFoodsErrorState value)? error,
    TResult Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MyFavoriteFoodsErrorState implements MyFavoriteFoodsState {
  const factory MyFavoriteFoodsErrorState(final String message) =
      _$MyFavoriteFoodsErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$MyFavoriteFoodsErrorStateCopyWith<_$MyFavoriteFoodsErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyFavoriteFoodsLoadedStateCopyWith<$Res> {
  factory _$$MyFavoriteFoodsLoadedStateCopyWith(
          _$MyFavoriteFoodsLoadedState value,
          $Res Function(_$MyFavoriteFoodsLoadedState) then) =
      __$$MyFavoriteFoodsLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$MyFavoriteFoodsLoadedStateCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsLoadedState>
    implements _$$MyFavoriteFoodsLoadedStateCopyWith<$Res> {
  __$$MyFavoriteFoodsLoadedStateCopyWithImpl(
      _$MyFavoriteFoodsLoadedState _value,
      $Res Function(_$MyFavoriteFoodsLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$MyFavoriteFoodsLoadedState(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$MyFavoriteFoodsLoadedState implements MyFavoriteFoodsLoadedState {
  const _$MyFavoriteFoodsLoadedState({required final List<Food> foods})
      : _foods = foods;

  final List<Food> _foods;
  @override
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  String toString() {
    return 'MyFavoriteFoodsState.loaded(foods: $foods)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsLoadedState &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyFavoriteFoodsLoadedStateCopyWith<_$MyFavoriteFoodsLoadedState>
      get copyWith => __$$MyFavoriteFoodsLoadedStateCopyWithImpl<
          _$MyFavoriteFoodsLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(String favoriteId)
        immediateSearchInFavoritesLoaded,
  }) {
    return loaded(foods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(String favoriteId)? immediateSearchInFavoritesLoaded,
  }) {
    return loaded?.call(foods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(String favoriteId)? immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(foods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyFavoriteFoodsInitialState value) initial,
    required TResult Function(MyFavoriteFoodsLoadingState value) loading,
    required TResult Function(MyFavoriteFoodsErrorState value) error,
    required TResult Function(MyFavoriteFoodsLoadedState value) loaded,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInFavoritesLoaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyFavoriteFoodsInitialState value)? initial,
    TResult? Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult? Function(MyFavoriteFoodsErrorState value)? error,
    TResult? Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyFavoriteFoodsInitialState value)? initial,
    TResult Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult Function(MyFavoriteFoodsErrorState value)? error,
    TResult Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MyFavoriteFoodsLoadedState implements MyFavoriteFoodsState {
  const factory MyFavoriteFoodsLoadedState({required final List<Food> foods}) =
      _$MyFavoriteFoodsLoadedState;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$MyFavoriteFoodsLoadedStateCopyWith<_$MyFavoriteFoodsLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImmediateSearchInFoodsLoadedStateCopyWith<$Res> {
  factory _$$ImmediateSearchInFoodsLoadedStateCopyWith(
          _$ImmediateSearchInFoodsLoadedState value,
          $Res Function(_$ImmediateSearchInFoodsLoadedState) then) =
      __$$ImmediateSearchInFoodsLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String favoriteId});
}

/// @nodoc
class __$$ImmediateSearchInFoodsLoadedStateCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$ImmediateSearchInFoodsLoadedState>
    implements _$$ImmediateSearchInFoodsLoadedStateCopyWith<$Res> {
  __$$ImmediateSearchInFoodsLoadedStateCopyWithImpl(
      _$ImmediateSearchInFoodsLoadedState _value,
      $Res Function(_$ImmediateSearchInFoodsLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteId = null,
  }) {
    return _then(_$ImmediateSearchInFoodsLoadedState(
      favoriteId: null == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImmediateSearchInFoodsLoadedState
    implements ImmediateSearchInFoodsLoadedState {
  const _$ImmediateSearchInFoodsLoadedState({required this.favoriteId});

  @override
  final String favoriteId;

  @override
  String toString() {
    return 'MyFavoriteFoodsState.immediateSearchInFavoritesLoaded(favoriteId: $favoriteId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateSearchInFoodsLoadedState &&
            (identical(other.favoriteId, favoriteId) ||
                other.favoriteId == favoriteId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favoriteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmediateSearchInFoodsLoadedStateCopyWith<
          _$ImmediateSearchInFoodsLoadedState>
      get copyWith => __$$ImmediateSearchInFoodsLoadedStateCopyWithImpl<
          _$ImmediateSearchInFoodsLoadedState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(String favoriteId)
        immediateSearchInFavoritesLoaded,
  }) {
    return immediateSearchInFavoritesLoaded(favoriteId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(String favoriteId)? immediateSearchInFavoritesLoaded,
  }) {
    return immediateSearchInFavoritesLoaded?.call(favoriteId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(String favoriteId)? immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) {
    if (immediateSearchInFavoritesLoaded != null) {
      return immediateSearchInFavoritesLoaded(favoriteId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyFavoriteFoodsInitialState value) initial,
    required TResult Function(MyFavoriteFoodsLoadingState value) loading,
    required TResult Function(MyFavoriteFoodsErrorState value) error,
    required TResult Function(MyFavoriteFoodsLoadedState value) loaded,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInFavoritesLoaded,
  }) {
    return immediateSearchInFavoritesLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyFavoriteFoodsInitialState value)? initial,
    TResult? Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult? Function(MyFavoriteFoodsErrorState value)? error,
    TResult? Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
  }) {
    return immediateSearchInFavoritesLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyFavoriteFoodsInitialState value)? initial,
    TResult Function(MyFavoriteFoodsLoadingState value)? loading,
    TResult Function(MyFavoriteFoodsErrorState value)? error,
    TResult Function(MyFavoriteFoodsLoadedState value)? loaded,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInFavoritesLoaded,
    required TResult orElse(),
  }) {
    if (immediateSearchInFavoritesLoaded != null) {
      return immediateSearchInFavoritesLoaded(this);
    }
    return orElse();
  }
}

abstract class ImmediateSearchInFoodsLoadedState
    implements MyFavoriteFoodsState {
  const factory ImmediateSearchInFoodsLoadedState(
      {required final String favoriteId}) = _$ImmediateSearchInFoodsLoadedState;

  String get favoriteId;
  @JsonKey(ignore: true)
  _$$ImmediateSearchInFoodsLoadedStateCopyWith<
          _$ImmediateSearchInFoodsLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}
