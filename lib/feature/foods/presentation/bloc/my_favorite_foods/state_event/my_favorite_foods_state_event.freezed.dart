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
abstract class _$$FavoriteFoodsImplCopyWith<$Res> {
  factory _$$FavoriteFoodsImplCopyWith(
          _$FavoriteFoodsImpl value, $Res Function(_$FavoriteFoodsImpl) then) =
      __$$FavoriteFoodsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FoodType foodType, String query});
}

/// @nodoc
class __$$FavoriteFoodsImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsEventCopyWithImpl<$Res, _$FavoriteFoodsImpl>
    implements _$$FavoriteFoodsImplCopyWith<$Res> {
  __$$FavoriteFoodsImplCopyWithImpl(
      _$FavoriteFoodsImpl _value, $Res Function(_$FavoriteFoodsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodType = null,
    Object? query = null,
  }) {
    return _then(_$FavoriteFoodsImpl(
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

class _$FavoriteFoodsImpl implements FavoriteFoods {
  const _$FavoriteFoodsImpl(this.foodType, this.query);

  @override
  final FoodType foodType;
  @override
  final String query;

  @override
  String toString() {
    return 'MyFavoriteFoodsEvent.onGetMyFavoriteFoods(foodType: $foodType, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteFoodsImpl &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, foodType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteFoodsImplCopyWith<_$FavoriteFoodsImpl> get copyWith =>
      __$$FavoriteFoodsImplCopyWithImpl<_$FavoriteFoodsImpl>(this, _$identity);

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
      _$FavoriteFoodsImpl;

  FoodType get foodType;
  String get query;
  @JsonKey(ignore: true)
  _$$FavoriteFoodsImplCopyWith<_$FavoriteFoodsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImmediateSearchFavoriteFoodsImplCopyWith<$Res> {
  factory _$$ImmediateSearchFavoriteFoodsImplCopyWith(
          _$ImmediateSearchFavoriteFoodsImpl value,
          $Res Function(_$ImmediateSearchFavoriteFoodsImpl) then) =
      __$$ImmediateSearchFavoriteFoodsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$ImmediateSearchFavoriteFoodsImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsEventCopyWithImpl<$Res,
        _$ImmediateSearchFavoriteFoodsImpl>
    implements _$$ImmediateSearchFavoriteFoodsImplCopyWith<$Res> {
  __$$ImmediateSearchFavoriteFoodsImplCopyWithImpl(
      _$ImmediateSearchFavoriteFoodsImpl _value,
      $Res Function(_$ImmediateSearchFavoriteFoodsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$ImmediateSearchFavoriteFoodsImpl(
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

class _$ImmediateSearchFavoriteFoodsImpl
    implements ImmediateSearchFavoriteFoods {
  const _$ImmediateSearchFavoriteFoodsImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'MyFavoriteFoodsEvent.onImmediateSearchInMyFavoriteFoods(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateSearchFavoriteFoodsImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmediateSearchFavoriteFoodsImplCopyWith<
          _$ImmediateSearchFavoriteFoodsImpl>
      get copyWith => __$$ImmediateSearchFavoriteFoodsImplCopyWithImpl<
          _$ImmediateSearchFavoriteFoodsImpl>(this, _$identity);

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
      _$ImmediateSearchFavoriteFoodsImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$ImmediateSearchFavoriteFoodsImplCopyWith<
          _$ImmediateSearchFavoriteFoodsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'MyFavoriteFoodsEvent.onReset()';
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
  const factory Reset() = _$ResetImpl;
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
abstract class _$$MyFavoriteFoodsInitialStateImplCopyWith<$Res> {
  factory _$$MyFavoriteFoodsInitialStateImplCopyWith(
          _$MyFavoriteFoodsInitialStateImpl value,
          $Res Function(_$MyFavoriteFoodsInitialStateImpl) then) =
      __$$MyFavoriteFoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyFavoriteFoodsInitialStateImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsInitialStateImpl>
    implements _$$MyFavoriteFoodsInitialStateImplCopyWith<$Res> {
  __$$MyFavoriteFoodsInitialStateImplCopyWithImpl(
      _$MyFavoriteFoodsInitialStateImpl _value,
      $Res Function(_$MyFavoriteFoodsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyFavoriteFoodsInitialStateImpl implements MyFavoriteFoodsInitialState {
  const _$MyFavoriteFoodsInitialStateImpl();

  @override
  String toString() {
    return 'MyFavoriteFoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsInitialStateImpl);
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
  const factory MyFavoriteFoodsInitialState() =
      _$MyFavoriteFoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$MyFavoriteFoodsLoadingStateImplCopyWith<$Res> {
  factory _$$MyFavoriteFoodsLoadingStateImplCopyWith(
          _$MyFavoriteFoodsLoadingStateImpl value,
          $Res Function(_$MyFavoriteFoodsLoadingStateImpl) then) =
      __$$MyFavoriteFoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyFavoriteFoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsLoadingStateImpl>
    implements _$$MyFavoriteFoodsLoadingStateImplCopyWith<$Res> {
  __$$MyFavoriteFoodsLoadingStateImplCopyWithImpl(
      _$MyFavoriteFoodsLoadingStateImpl _value,
      $Res Function(_$MyFavoriteFoodsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyFavoriteFoodsLoadingStateImpl implements MyFavoriteFoodsLoadingState {
  const _$MyFavoriteFoodsLoadingStateImpl();

  @override
  String toString() {
    return 'MyFavoriteFoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsLoadingStateImpl);
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
  const factory MyFavoriteFoodsLoadingState() =
      _$MyFavoriteFoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$MyFavoriteFoodsErrorStateImplCopyWith<$Res> {
  factory _$$MyFavoriteFoodsErrorStateImplCopyWith(
          _$MyFavoriteFoodsErrorStateImpl value,
          $Res Function(_$MyFavoriteFoodsErrorStateImpl) then) =
      __$$MyFavoriteFoodsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MyFavoriteFoodsErrorStateImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsErrorStateImpl>
    implements _$$MyFavoriteFoodsErrorStateImplCopyWith<$Res> {
  __$$MyFavoriteFoodsErrorStateImplCopyWithImpl(
      _$MyFavoriteFoodsErrorStateImpl _value,
      $Res Function(_$MyFavoriteFoodsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MyFavoriteFoodsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyFavoriteFoodsErrorStateImpl implements MyFavoriteFoodsErrorState {
  const _$MyFavoriteFoodsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MyFavoriteFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyFavoriteFoodsErrorStateImplCopyWith<_$MyFavoriteFoodsErrorStateImpl>
      get copyWith => __$$MyFavoriteFoodsErrorStateImplCopyWithImpl<
          _$MyFavoriteFoodsErrorStateImpl>(this, _$identity);

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
      _$MyFavoriteFoodsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$MyFavoriteFoodsErrorStateImplCopyWith<_$MyFavoriteFoodsErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyFavoriteFoodsLoadedStateImplCopyWith<$Res> {
  factory _$$MyFavoriteFoodsLoadedStateImplCopyWith(
          _$MyFavoriteFoodsLoadedStateImpl value,
          $Res Function(_$MyFavoriteFoodsLoadedStateImpl) then) =
      __$$MyFavoriteFoodsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$MyFavoriteFoodsLoadedStateImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$MyFavoriteFoodsLoadedStateImpl>
    implements _$$MyFavoriteFoodsLoadedStateImplCopyWith<$Res> {
  __$$MyFavoriteFoodsLoadedStateImplCopyWithImpl(
      _$MyFavoriteFoodsLoadedStateImpl _value,
      $Res Function(_$MyFavoriteFoodsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$MyFavoriteFoodsLoadedStateImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$MyFavoriteFoodsLoadedStateImpl implements MyFavoriteFoodsLoadedState {
  const _$MyFavoriteFoodsLoadedStateImpl({required final List<Food> foods})
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyFavoriteFoodsLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyFavoriteFoodsLoadedStateImplCopyWith<_$MyFavoriteFoodsLoadedStateImpl>
      get copyWith => __$$MyFavoriteFoodsLoadedStateImplCopyWithImpl<
          _$MyFavoriteFoodsLoadedStateImpl>(this, _$identity);

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
      _$MyFavoriteFoodsLoadedStateImpl;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$MyFavoriteFoodsLoadedStateImplCopyWith<_$MyFavoriteFoodsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImmediateSearchInFoodsLoadedStateImplCopyWith<$Res> {
  factory _$$ImmediateSearchInFoodsLoadedStateImplCopyWith(
          _$ImmediateSearchInFoodsLoadedStateImpl value,
          $Res Function(_$ImmediateSearchInFoodsLoadedStateImpl) then) =
      __$$ImmediateSearchInFoodsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String favoriteId});
}

/// @nodoc
class __$$ImmediateSearchInFoodsLoadedStateImplCopyWithImpl<$Res>
    extends _$MyFavoriteFoodsStateCopyWithImpl<$Res,
        _$ImmediateSearchInFoodsLoadedStateImpl>
    implements _$$ImmediateSearchInFoodsLoadedStateImplCopyWith<$Res> {
  __$$ImmediateSearchInFoodsLoadedStateImplCopyWithImpl(
      _$ImmediateSearchInFoodsLoadedStateImpl _value,
      $Res Function(_$ImmediateSearchInFoodsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteId = null,
  }) {
    return _then(_$ImmediateSearchInFoodsLoadedStateImpl(
      favoriteId: null == favoriteId
          ? _value.favoriteId
          : favoriteId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImmediateSearchInFoodsLoadedStateImpl
    implements ImmediateSearchInFoodsLoadedState {
  const _$ImmediateSearchInFoodsLoadedStateImpl({required this.favoriteId});

  @override
  final String favoriteId;

  @override
  String toString() {
    return 'MyFavoriteFoodsState.immediateSearchInFavoritesLoaded(favoriteId: $favoriteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateSearchInFoodsLoadedStateImpl &&
            (identical(other.favoriteId, favoriteId) ||
                other.favoriteId == favoriteId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, favoriteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmediateSearchInFoodsLoadedStateImplCopyWith<
          _$ImmediateSearchInFoodsLoadedStateImpl>
      get copyWith => __$$ImmediateSearchInFoodsLoadedStateImplCopyWithImpl<
          _$ImmediateSearchInFoodsLoadedStateImpl>(this, _$identity);

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
          {required final String favoriteId}) =
      _$ImmediateSearchInFoodsLoadedStateImpl;

  String get favoriteId;
  @JsonKey(ignore: true)
  _$$ImmediateSearchInFoodsLoadedStateImplCopyWith<
          _$ImmediateSearchInFoodsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
