// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_cook_book_foods_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MyCookBookFoodsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onGetMyCookBookFoods,
    required TResult Function(Food food) onImmediateSearchInMyCookBookFoods,
    required TResult Function() onGetCookBookFoodsImmediately,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetMyCookBookFoods,
    TResult? Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult? Function()? onGetCookBookFoodsImmediately,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetMyCookBookFoods,
    TResult Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult Function()? onGetCookBookFoodsImmediately,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CookBookFoods value) onGetMyCookBookFoods,
    required TResult Function(ImmediateSearchCookBookFoods value)
        onImmediateSearchInMyCookBookFoods,
    required TResult Function(GetCookBookFoodsImmediately value)
        onGetCookBookFoodsImmediately,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult? Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult? Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCookBookFoodsEventCopyWith<$Res> {
  factory $MyCookBookFoodsEventCopyWith(MyCookBookFoodsEvent value,
          $Res Function(MyCookBookFoodsEvent) then) =
      _$MyCookBookFoodsEventCopyWithImpl<$Res, MyCookBookFoodsEvent>;
}

/// @nodoc
class _$MyCookBookFoodsEventCopyWithImpl<$Res,
        $Val extends MyCookBookFoodsEvent>
    implements $MyCookBookFoodsEventCopyWith<$Res> {
  _$MyCookBookFoodsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CookBookFoodsImplCopyWith<$Res> {
  factory _$$CookBookFoodsImplCopyWith(
          _$CookBookFoodsImpl value, $Res Function(_$CookBookFoodsImpl) then) =
      __$$CookBookFoodsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$CookBookFoodsImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsEventCopyWithImpl<$Res, _$CookBookFoodsImpl>
    implements _$$CookBookFoodsImplCopyWith<$Res> {
  __$$CookBookFoodsImplCopyWithImpl(
      _$CookBookFoodsImpl _value, $Res Function(_$CookBookFoodsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$CookBookFoodsImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CookBookFoodsImpl implements CookBookFoods {
  const _$CookBookFoodsImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'MyCookBookFoodsEvent.onGetMyCookBookFoods(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CookBookFoodsImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CookBookFoodsImplCopyWith<_$CookBookFoodsImpl> get copyWith =>
      __$$CookBookFoodsImplCopyWithImpl<_$CookBookFoodsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onGetMyCookBookFoods,
    required TResult Function(Food food) onImmediateSearchInMyCookBookFoods,
    required TResult Function() onGetCookBookFoodsImmediately,
    required TResult Function() onReset,
  }) {
    return onGetMyCookBookFoods(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetMyCookBookFoods,
    TResult? Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult? Function()? onGetCookBookFoodsImmediately,
    TResult? Function()? onReset,
  }) {
    return onGetMyCookBookFoods?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetMyCookBookFoods,
    TResult Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult Function()? onGetCookBookFoodsImmediately,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetMyCookBookFoods != null) {
      return onGetMyCookBookFoods(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CookBookFoods value) onGetMyCookBookFoods,
    required TResult Function(ImmediateSearchCookBookFoods value)
        onImmediateSearchInMyCookBookFoods,
    required TResult Function(GetCookBookFoodsImmediately value)
        onGetCookBookFoodsImmediately,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetMyCookBookFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult? Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult? Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetMyCookBookFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetMyCookBookFoods != null) {
      return onGetMyCookBookFoods(this);
    }
    return orElse();
  }
}

abstract class CookBookFoods implements MyCookBookFoodsEvent {
  const factory CookBookFoods(final String query) = _$CookBookFoodsImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$CookBookFoodsImplCopyWith<_$CookBookFoodsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImmediateSearchCookBookFoodsImplCopyWith<$Res> {
  factory _$$ImmediateSearchCookBookFoodsImplCopyWith(
          _$ImmediateSearchCookBookFoodsImpl value,
          $Res Function(_$ImmediateSearchCookBookFoodsImpl) then) =
      __$$ImmediateSearchCookBookFoodsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$ImmediateSearchCookBookFoodsImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsEventCopyWithImpl<$Res,
        _$ImmediateSearchCookBookFoodsImpl>
    implements _$$ImmediateSearchCookBookFoodsImplCopyWith<$Res> {
  __$$ImmediateSearchCookBookFoodsImplCopyWithImpl(
      _$ImmediateSearchCookBookFoodsImpl _value,
      $Res Function(_$ImmediateSearchCookBookFoodsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$ImmediateSearchCookBookFoodsImpl(
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

class _$ImmediateSearchCookBookFoodsImpl
    implements ImmediateSearchCookBookFoods {
  const _$ImmediateSearchCookBookFoodsImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'MyCookBookFoodsEvent.onImmediateSearchInMyCookBookFoods(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateSearchCookBookFoodsImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImmediateSearchCookBookFoodsImplCopyWith<
          _$ImmediateSearchCookBookFoodsImpl>
      get copyWith => __$$ImmediateSearchCookBookFoodsImplCopyWithImpl<
          _$ImmediateSearchCookBookFoodsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onGetMyCookBookFoods,
    required TResult Function(Food food) onImmediateSearchInMyCookBookFoods,
    required TResult Function() onGetCookBookFoodsImmediately,
    required TResult Function() onReset,
  }) {
    return onImmediateSearchInMyCookBookFoods(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetMyCookBookFoods,
    TResult? Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult? Function()? onGetCookBookFoodsImmediately,
    TResult? Function()? onReset,
  }) {
    return onImmediateSearchInMyCookBookFoods?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetMyCookBookFoods,
    TResult Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult Function()? onGetCookBookFoodsImmediately,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onImmediateSearchInMyCookBookFoods != null) {
      return onImmediateSearchInMyCookBookFoods(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CookBookFoods value) onGetMyCookBookFoods,
    required TResult Function(ImmediateSearchCookBookFoods value)
        onImmediateSearchInMyCookBookFoods,
    required TResult Function(GetCookBookFoodsImmediately value)
        onGetCookBookFoodsImmediately,
    required TResult Function(Reset value) onReset,
  }) {
    return onImmediateSearchInMyCookBookFoods(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult? Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult? Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult? Function(Reset value)? onReset,
  }) {
    return onImmediateSearchInMyCookBookFoods?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onImmediateSearchInMyCookBookFoods != null) {
      return onImmediateSearchInMyCookBookFoods(this);
    }
    return orElse();
  }
}

abstract class ImmediateSearchCookBookFoods implements MyCookBookFoodsEvent {
  const factory ImmediateSearchCookBookFoods(final Food food) =
      _$ImmediateSearchCookBookFoodsImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$ImmediateSearchCookBookFoodsImplCopyWith<
          _$ImmediateSearchCookBookFoodsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCookBookFoodsImmediatelyImplCopyWith<$Res> {
  factory _$$GetCookBookFoodsImmediatelyImplCopyWith(
          _$GetCookBookFoodsImmediatelyImpl value,
          $Res Function(_$GetCookBookFoodsImmediatelyImpl) then) =
      __$$GetCookBookFoodsImmediatelyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCookBookFoodsImmediatelyImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsEventCopyWithImpl<$Res,
        _$GetCookBookFoodsImmediatelyImpl>
    implements _$$GetCookBookFoodsImmediatelyImplCopyWith<$Res> {
  __$$GetCookBookFoodsImmediatelyImplCopyWithImpl(
      _$GetCookBookFoodsImmediatelyImpl _value,
      $Res Function(_$GetCookBookFoodsImmediatelyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCookBookFoodsImmediatelyImpl implements GetCookBookFoodsImmediately {
  const _$GetCookBookFoodsImmediatelyImpl();

  @override
  String toString() {
    return 'MyCookBookFoodsEvent.onGetCookBookFoodsImmediately()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCookBookFoodsImmediatelyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onGetMyCookBookFoods,
    required TResult Function(Food food) onImmediateSearchInMyCookBookFoods,
    required TResult Function() onGetCookBookFoodsImmediately,
    required TResult Function() onReset,
  }) {
    return onGetCookBookFoodsImmediately();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetMyCookBookFoods,
    TResult? Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult? Function()? onGetCookBookFoodsImmediately,
    TResult? Function()? onReset,
  }) {
    return onGetCookBookFoodsImmediately?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetMyCookBookFoods,
    TResult Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult Function()? onGetCookBookFoodsImmediately,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetCookBookFoodsImmediately != null) {
      return onGetCookBookFoodsImmediately();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CookBookFoods value) onGetMyCookBookFoods,
    required TResult Function(ImmediateSearchCookBookFoods value)
        onImmediateSearchInMyCookBookFoods,
    required TResult Function(GetCookBookFoodsImmediately value)
        onGetCookBookFoodsImmediately,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetCookBookFoodsImmediately(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult? Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult? Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetCookBookFoodsImmediately?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetCookBookFoodsImmediately != null) {
      return onGetCookBookFoodsImmediately(this);
    }
    return orElse();
  }
}

abstract class GetCookBookFoodsImmediately implements MyCookBookFoodsEvent {
  const factory GetCookBookFoodsImmediately() =
      _$GetCookBookFoodsImmediatelyImpl;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'MyCookBookFoodsEvent.onReset()';
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
    required TResult Function(String query) onGetMyCookBookFoods,
    required TResult Function(Food food) onImmediateSearchInMyCookBookFoods,
    required TResult Function() onGetCookBookFoodsImmediately,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetMyCookBookFoods,
    TResult? Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult? Function()? onGetCookBookFoodsImmediately,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetMyCookBookFoods,
    TResult Function(Food food)? onImmediateSearchInMyCookBookFoods,
    TResult Function()? onGetCookBookFoodsImmediately,
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
    required TResult Function(CookBookFoods value) onGetMyCookBookFoods,
    required TResult Function(ImmediateSearchCookBookFoods value)
        onImmediateSearchInMyCookBookFoods,
    required TResult Function(GetCookBookFoodsImmediately value)
        onGetCookBookFoodsImmediately,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult? Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult? Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CookBookFoods value)? onGetMyCookBookFoods,
    TResult Function(ImmediateSearchCookBookFoods value)?
        onImmediateSearchInMyCookBookFoods,
    TResult Function(GetCookBookFoodsImmediately value)?
        onGetCookBookFoodsImmediately,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements MyCookBookFoodsEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$MyCookBookFoodsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(List<Food> foods) loadedImmediately,
    required TResult Function(String cookBookId)
        immediateSearchInCookBookLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(List<Food> foods)? loadedImmediately,
    TResult? Function(String cookBookId)? immediateSearchInCookBookLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(List<Food> foods)? loadedImmediately,
    TResult Function(String cookBookId)? immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyCookBookFoodsInitialState value) initial,
    required TResult Function(MyCookBookFoodsLoadingState value) loading,
    required TResult Function(MyCookBookFoodsErrorState value) error,
    required TResult Function(MyCookBookFoodsLoadedState value) loaded,
    required TResult Function(MyCookBookFoodsLoadedImmediatelyState value)
        loadedImmediately,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInCookBookLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyCookBookFoodsInitialState value)? initial,
    TResult? Function(MyCookBookFoodsLoadingState value)? loading,
    TResult? Function(MyCookBookFoodsErrorState value)? error,
    TResult? Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult? Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyCookBookFoodsInitialState value)? initial,
    TResult Function(MyCookBookFoodsLoadingState value)? loading,
    TResult Function(MyCookBookFoodsErrorState value)? error,
    TResult Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCookBookFoodsStateCopyWith<$Res> {
  factory $MyCookBookFoodsStateCopyWith(MyCookBookFoodsState value,
          $Res Function(MyCookBookFoodsState) then) =
      _$MyCookBookFoodsStateCopyWithImpl<$Res, MyCookBookFoodsState>;
}

/// @nodoc
class _$MyCookBookFoodsStateCopyWithImpl<$Res,
        $Val extends MyCookBookFoodsState>
    implements $MyCookBookFoodsStateCopyWith<$Res> {
  _$MyCookBookFoodsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$MyCookBookFoodsInitialStateImplCopyWith<$Res> {
  factory _$$MyCookBookFoodsInitialStateImplCopyWith(
          _$MyCookBookFoodsInitialStateImpl value,
          $Res Function(_$MyCookBookFoodsInitialStateImpl) then) =
      __$$MyCookBookFoodsInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyCookBookFoodsInitialStateImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsStateCopyWithImpl<$Res,
        _$MyCookBookFoodsInitialStateImpl>
    implements _$$MyCookBookFoodsInitialStateImplCopyWith<$Res> {
  __$$MyCookBookFoodsInitialStateImplCopyWithImpl(
      _$MyCookBookFoodsInitialStateImpl _value,
      $Res Function(_$MyCookBookFoodsInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyCookBookFoodsInitialStateImpl implements MyCookBookFoodsInitialState {
  const _$MyCookBookFoodsInitialStateImpl();

  @override
  String toString() {
    return 'MyCookBookFoodsState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCookBookFoodsInitialStateImpl);
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
    required TResult Function(List<Food> foods) loadedImmediately,
    required TResult Function(String cookBookId)
        immediateSearchInCookBookLoaded,
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
    TResult? Function(List<Food> foods)? loadedImmediately,
    TResult? Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    TResult Function(List<Food> foods)? loadedImmediately,
    TResult Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    required TResult Function(MyCookBookFoodsInitialState value) initial,
    required TResult Function(MyCookBookFoodsLoadingState value) loading,
    required TResult Function(MyCookBookFoodsErrorState value) error,
    required TResult Function(MyCookBookFoodsLoadedState value) loaded,
    required TResult Function(MyCookBookFoodsLoadedImmediatelyState value)
        loadedImmediately,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInCookBookLoaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyCookBookFoodsInitialState value)? initial,
    TResult? Function(MyCookBookFoodsLoadingState value)? loading,
    TResult? Function(MyCookBookFoodsErrorState value)? error,
    TResult? Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult? Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyCookBookFoodsInitialState value)? initial,
    TResult Function(MyCookBookFoodsLoadingState value)? loading,
    TResult Function(MyCookBookFoodsErrorState value)? error,
    TResult Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MyCookBookFoodsInitialState implements MyCookBookFoodsState {
  const factory MyCookBookFoodsInitialState() =
      _$MyCookBookFoodsInitialStateImpl;
}

/// @nodoc
abstract class _$$MyCookBookFoodsLoadingStateImplCopyWith<$Res> {
  factory _$$MyCookBookFoodsLoadingStateImplCopyWith(
          _$MyCookBookFoodsLoadingStateImpl value,
          $Res Function(_$MyCookBookFoodsLoadingStateImpl) then) =
      __$$MyCookBookFoodsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MyCookBookFoodsLoadingStateImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsStateCopyWithImpl<$Res,
        _$MyCookBookFoodsLoadingStateImpl>
    implements _$$MyCookBookFoodsLoadingStateImplCopyWith<$Res> {
  __$$MyCookBookFoodsLoadingStateImplCopyWithImpl(
      _$MyCookBookFoodsLoadingStateImpl _value,
      $Res Function(_$MyCookBookFoodsLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$MyCookBookFoodsLoadingStateImpl implements MyCookBookFoodsLoadingState {
  const _$MyCookBookFoodsLoadingStateImpl();

  @override
  String toString() {
    return 'MyCookBookFoodsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCookBookFoodsLoadingStateImpl);
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
    required TResult Function(List<Food> foods) loadedImmediately,
    required TResult Function(String cookBookId)
        immediateSearchInCookBookLoaded,
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
    TResult? Function(List<Food> foods)? loadedImmediately,
    TResult? Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    TResult Function(List<Food> foods)? loadedImmediately,
    TResult Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    required TResult Function(MyCookBookFoodsInitialState value) initial,
    required TResult Function(MyCookBookFoodsLoadingState value) loading,
    required TResult Function(MyCookBookFoodsErrorState value) error,
    required TResult Function(MyCookBookFoodsLoadedState value) loaded,
    required TResult Function(MyCookBookFoodsLoadedImmediatelyState value)
        loadedImmediately,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInCookBookLoaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyCookBookFoodsInitialState value)? initial,
    TResult? Function(MyCookBookFoodsLoadingState value)? loading,
    TResult? Function(MyCookBookFoodsErrorState value)? error,
    TResult? Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult? Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyCookBookFoodsInitialState value)? initial,
    TResult Function(MyCookBookFoodsLoadingState value)? loading,
    TResult Function(MyCookBookFoodsErrorState value)? error,
    TResult Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MyCookBookFoodsLoadingState implements MyCookBookFoodsState {
  const factory MyCookBookFoodsLoadingState() =
      _$MyCookBookFoodsLoadingStateImpl;
}

/// @nodoc
abstract class _$$MyCookBookFoodsErrorStateImplCopyWith<$Res> {
  factory _$$MyCookBookFoodsErrorStateImplCopyWith(
          _$MyCookBookFoodsErrorStateImpl value,
          $Res Function(_$MyCookBookFoodsErrorStateImpl) then) =
      __$$MyCookBookFoodsErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MyCookBookFoodsErrorStateImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsStateCopyWithImpl<$Res,
        _$MyCookBookFoodsErrorStateImpl>
    implements _$$MyCookBookFoodsErrorStateImplCopyWith<$Res> {
  __$$MyCookBookFoodsErrorStateImplCopyWithImpl(
      _$MyCookBookFoodsErrorStateImpl _value,
      $Res Function(_$MyCookBookFoodsErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MyCookBookFoodsErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MyCookBookFoodsErrorStateImpl implements MyCookBookFoodsErrorState {
  const _$MyCookBookFoodsErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MyCookBookFoodsState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCookBookFoodsErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyCookBookFoodsErrorStateImplCopyWith<_$MyCookBookFoodsErrorStateImpl>
      get copyWith => __$$MyCookBookFoodsErrorStateImplCopyWithImpl<
          _$MyCookBookFoodsErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(List<Food> foods) loadedImmediately,
    required TResult Function(String cookBookId)
        immediateSearchInCookBookLoaded,
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
    TResult? Function(List<Food> foods)? loadedImmediately,
    TResult? Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    TResult Function(List<Food> foods)? loadedImmediately,
    TResult Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    required TResult Function(MyCookBookFoodsInitialState value) initial,
    required TResult Function(MyCookBookFoodsLoadingState value) loading,
    required TResult Function(MyCookBookFoodsErrorState value) error,
    required TResult Function(MyCookBookFoodsLoadedState value) loaded,
    required TResult Function(MyCookBookFoodsLoadedImmediatelyState value)
        loadedImmediately,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInCookBookLoaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyCookBookFoodsInitialState value)? initial,
    TResult? Function(MyCookBookFoodsLoadingState value)? loading,
    TResult? Function(MyCookBookFoodsErrorState value)? error,
    TResult? Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult? Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyCookBookFoodsInitialState value)? initial,
    TResult Function(MyCookBookFoodsLoadingState value)? loading,
    TResult Function(MyCookBookFoodsErrorState value)? error,
    TResult Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MyCookBookFoodsErrorState implements MyCookBookFoodsState {
  const factory MyCookBookFoodsErrorState(final String message) =
      _$MyCookBookFoodsErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$MyCookBookFoodsErrorStateImplCopyWith<_$MyCookBookFoodsErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyCookBookFoodsLoadedStateImplCopyWith<$Res> {
  factory _$$MyCookBookFoodsLoadedStateImplCopyWith(
          _$MyCookBookFoodsLoadedStateImpl value,
          $Res Function(_$MyCookBookFoodsLoadedStateImpl) then) =
      __$$MyCookBookFoodsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$MyCookBookFoodsLoadedStateImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsStateCopyWithImpl<$Res,
        _$MyCookBookFoodsLoadedStateImpl>
    implements _$$MyCookBookFoodsLoadedStateImplCopyWith<$Res> {
  __$$MyCookBookFoodsLoadedStateImplCopyWithImpl(
      _$MyCookBookFoodsLoadedStateImpl _value,
      $Res Function(_$MyCookBookFoodsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$MyCookBookFoodsLoadedStateImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$MyCookBookFoodsLoadedStateImpl implements MyCookBookFoodsLoadedState {
  const _$MyCookBookFoodsLoadedStateImpl({required final List<Food> foods})
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
    return 'MyCookBookFoodsState.loaded(foods: $foods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCookBookFoodsLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyCookBookFoodsLoadedStateImplCopyWith<_$MyCookBookFoodsLoadedStateImpl>
      get copyWith => __$$MyCookBookFoodsLoadedStateImplCopyWithImpl<
          _$MyCookBookFoodsLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(List<Food> foods) loadedImmediately,
    required TResult Function(String cookBookId)
        immediateSearchInCookBookLoaded,
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
    TResult? Function(List<Food> foods)? loadedImmediately,
    TResult? Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    TResult Function(List<Food> foods)? loadedImmediately,
    TResult Function(String cookBookId)? immediateSearchInCookBookLoaded,
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
    required TResult Function(MyCookBookFoodsInitialState value) initial,
    required TResult Function(MyCookBookFoodsLoadingState value) loading,
    required TResult Function(MyCookBookFoodsErrorState value) error,
    required TResult Function(MyCookBookFoodsLoadedState value) loaded,
    required TResult Function(MyCookBookFoodsLoadedImmediatelyState value)
        loadedImmediately,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInCookBookLoaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyCookBookFoodsInitialState value)? initial,
    TResult? Function(MyCookBookFoodsLoadingState value)? loading,
    TResult? Function(MyCookBookFoodsErrorState value)? error,
    TResult? Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult? Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyCookBookFoodsInitialState value)? initial,
    TResult Function(MyCookBookFoodsLoadingState value)? loading,
    TResult Function(MyCookBookFoodsErrorState value)? error,
    TResult Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MyCookBookFoodsLoadedState implements MyCookBookFoodsState {
  const factory MyCookBookFoodsLoadedState({required final List<Food> foods}) =
      _$MyCookBookFoodsLoadedStateImpl;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$MyCookBookFoodsLoadedStateImplCopyWith<_$MyCookBookFoodsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWith<$Res> {
  factory _$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWith(
          _$MyCookBookFoodsLoadedImmediatelyStateImpl value,
          $Res Function(_$MyCookBookFoodsLoadedImmediatelyStateImpl) then) =
      __$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsStateCopyWithImpl<$Res,
        _$MyCookBookFoodsLoadedImmediatelyStateImpl>
    implements _$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWith<$Res> {
  __$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWithImpl(
      _$MyCookBookFoodsLoadedImmediatelyStateImpl _value,
      $Res Function(_$MyCookBookFoodsLoadedImmediatelyStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$MyCookBookFoodsLoadedImmediatelyStateImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$MyCookBookFoodsLoadedImmediatelyStateImpl
    implements MyCookBookFoodsLoadedImmediatelyState {
  const _$MyCookBookFoodsLoadedImmediatelyStateImpl(
      {required final List<Food> foods})
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
    return 'MyCookBookFoodsState.loadedImmediately(foods: $foods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCookBookFoodsLoadedImmediatelyStateImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWith<
          _$MyCookBookFoodsLoadedImmediatelyStateImpl>
      get copyWith => __$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWithImpl<
          _$MyCookBookFoodsLoadedImmediatelyStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
    required TResult Function(List<Food> foods) loadedImmediately,
    required TResult Function(String cookBookId)
        immediateSearchInCookBookLoaded,
  }) {
    return loadedImmediately(foods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(List<Food> foods)? loadedImmediately,
    TResult? Function(String cookBookId)? immediateSearchInCookBookLoaded,
  }) {
    return loadedImmediately?.call(foods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(List<Food> foods)? loadedImmediately,
    TResult Function(String cookBookId)? immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (loadedImmediately != null) {
      return loadedImmediately(foods);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyCookBookFoodsInitialState value) initial,
    required TResult Function(MyCookBookFoodsLoadingState value) loading,
    required TResult Function(MyCookBookFoodsErrorState value) error,
    required TResult Function(MyCookBookFoodsLoadedState value) loaded,
    required TResult Function(MyCookBookFoodsLoadedImmediatelyState value)
        loadedImmediately,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInCookBookLoaded,
  }) {
    return loadedImmediately(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyCookBookFoodsInitialState value)? initial,
    TResult? Function(MyCookBookFoodsLoadingState value)? loading,
    TResult? Function(MyCookBookFoodsErrorState value)? error,
    TResult? Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult? Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
  }) {
    return loadedImmediately?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyCookBookFoodsInitialState value)? initial,
    TResult Function(MyCookBookFoodsLoadingState value)? loading,
    TResult Function(MyCookBookFoodsErrorState value)? error,
    TResult Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (loadedImmediately != null) {
      return loadedImmediately(this);
    }
    return orElse();
  }
}

abstract class MyCookBookFoodsLoadedImmediatelyState
    implements MyCookBookFoodsState {
  const factory MyCookBookFoodsLoadedImmediatelyState(
          {required final List<Food> foods}) =
      _$MyCookBookFoodsLoadedImmediatelyStateImpl;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$MyCookBookFoodsLoadedImmediatelyStateImplCopyWith<
          _$MyCookBookFoodsLoadedImmediatelyStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImmediateSearchInFoodsLoadedStateImplCopyWith<$Res> {
  factory _$$ImmediateSearchInFoodsLoadedStateImplCopyWith(
          _$ImmediateSearchInFoodsLoadedStateImpl value,
          $Res Function(_$ImmediateSearchInFoodsLoadedStateImpl) then) =
      __$$ImmediateSearchInFoodsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String cookBookId});
}

/// @nodoc
class __$$ImmediateSearchInFoodsLoadedStateImplCopyWithImpl<$Res>
    extends _$MyCookBookFoodsStateCopyWithImpl<$Res,
        _$ImmediateSearchInFoodsLoadedStateImpl>
    implements _$$ImmediateSearchInFoodsLoadedStateImplCopyWith<$Res> {
  __$$ImmediateSearchInFoodsLoadedStateImplCopyWithImpl(
      _$ImmediateSearchInFoodsLoadedStateImpl _value,
      $Res Function(_$ImmediateSearchInFoodsLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cookBookId = null,
  }) {
    return _then(_$ImmediateSearchInFoodsLoadedStateImpl(
      cookBookId: null == cookBookId
          ? _value.cookBookId
          : cookBookId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ImmediateSearchInFoodsLoadedStateImpl
    implements ImmediateSearchInFoodsLoadedState {
  const _$ImmediateSearchInFoodsLoadedStateImpl({required this.cookBookId});

  @override
  final String cookBookId;

  @override
  String toString() {
    return 'MyCookBookFoodsState.immediateSearchInCookBookLoaded(cookBookId: $cookBookId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImmediateSearchInFoodsLoadedStateImpl &&
            (identical(other.cookBookId, cookBookId) ||
                other.cookBookId == cookBookId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cookBookId);

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
    required TResult Function(List<Food> foods) loadedImmediately,
    required TResult Function(String cookBookId)
        immediateSearchInCookBookLoaded,
  }) {
    return immediateSearchInCookBookLoaded(cookBookId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
    TResult? Function(List<Food> foods)? loadedImmediately,
    TResult? Function(String cookBookId)? immediateSearchInCookBookLoaded,
  }) {
    return immediateSearchInCookBookLoaded?.call(cookBookId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    TResult Function(List<Food> foods)? loadedImmediately,
    TResult Function(String cookBookId)? immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (immediateSearchInCookBookLoaded != null) {
      return immediateSearchInCookBookLoaded(cookBookId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MyCookBookFoodsInitialState value) initial,
    required TResult Function(MyCookBookFoodsLoadingState value) loading,
    required TResult Function(MyCookBookFoodsErrorState value) error,
    required TResult Function(MyCookBookFoodsLoadedState value) loaded,
    required TResult Function(MyCookBookFoodsLoadedImmediatelyState value)
        loadedImmediately,
    required TResult Function(ImmediateSearchInFoodsLoadedState value)
        immediateSearchInCookBookLoaded,
  }) {
    return immediateSearchInCookBookLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MyCookBookFoodsInitialState value)? initial,
    TResult? Function(MyCookBookFoodsLoadingState value)? loading,
    TResult? Function(MyCookBookFoodsErrorState value)? error,
    TResult? Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult? Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult? Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
  }) {
    return immediateSearchInCookBookLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MyCookBookFoodsInitialState value)? initial,
    TResult Function(MyCookBookFoodsLoadingState value)? loading,
    TResult Function(MyCookBookFoodsErrorState value)? error,
    TResult Function(MyCookBookFoodsLoadedState value)? loaded,
    TResult Function(MyCookBookFoodsLoadedImmediatelyState value)?
        loadedImmediately,
    TResult Function(ImmediateSearchInFoodsLoadedState value)?
        immediateSearchInCookBookLoaded,
    required TResult orElse(),
  }) {
    if (immediateSearchInCookBookLoaded != null) {
      return immediateSearchInCookBookLoaded(this);
    }
    return orElse();
  }
}

abstract class ImmediateSearchInFoodsLoadedState
    implements MyCookBookFoodsState {
  const factory ImmediateSearchInFoodsLoadedState(
          {required final String cookBookId}) =
      _$ImmediateSearchInFoodsLoadedStateImpl;

  String get cookBookId;
  @JsonKey(ignore: true)
  _$$ImmediateSearchInFoodsLoadedStateImplCopyWith<
          _$ImmediateSearchInFoodsLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
