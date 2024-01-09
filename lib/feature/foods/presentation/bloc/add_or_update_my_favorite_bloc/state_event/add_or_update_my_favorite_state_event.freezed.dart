// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_or_update_my_favorite_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddOrUpdateMyFavoriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyFavorite,
    required TResult Function(Food food) onUpdateMyFavorite,
    required TResult Function(Food food) onAddOrUpdateMyFavorite,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyFavorite,
    TResult? Function(Food food)? onUpdateMyFavorite,
    TResult? Function(Food food)? onAddOrUpdateMyFavorite,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyFavorite,
    TResult Function(Food food)? onUpdateMyFavorite,
    TResult Function(Food food)? onAddOrUpdateMyFavorite,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyFavorites value) onAddToMyFavorite,
    required TResult Function(UpdateMyFavoriteFood value) onUpdateMyFavorite,
    required TResult Function(AddOrUpdateFoodMyFavorites value)
        onAddOrUpdateMyFavorite,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult? Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult? Function(AddOrUpdateFoodMyFavorites value)?
        onAddOrUpdateMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult Function(AddOrUpdateFoodMyFavorites value)? onAddOrUpdateMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrUpdateMyFavoriteEventCopyWith<$Res> {
  factory $AddOrUpdateMyFavoriteEventCopyWith(AddOrUpdateMyFavoriteEvent value,
          $Res Function(AddOrUpdateMyFavoriteEvent) then) =
      _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
          AddOrUpdateMyFavoriteEvent>;
}

/// @nodoc
class _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
        $Val extends AddOrUpdateMyFavoriteEvent>
    implements $AddOrUpdateMyFavoriteEventCopyWith<$Res> {
  _$AddOrUpdateMyFavoriteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddFoodToMyFavoritesImplCopyWith<$Res> {
  factory _$$AddFoodToMyFavoritesImplCopyWith(_$AddFoodToMyFavoritesImpl value,
          $Res Function(_$AddFoodToMyFavoritesImpl) then) =
      __$$AddFoodToMyFavoritesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddFoodToMyFavoritesImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
        _$AddFoodToMyFavoritesImpl>
    implements _$$AddFoodToMyFavoritesImplCopyWith<$Res> {
  __$$AddFoodToMyFavoritesImplCopyWithImpl(_$AddFoodToMyFavoritesImpl _value,
      $Res Function(_$AddFoodToMyFavoritesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddFoodToMyFavoritesImpl(
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

class _$AddFoodToMyFavoritesImpl implements AddFoodToMyFavorites {
  const _$AddFoodToMyFavoritesImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFoodToMyFavoritesImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFoodToMyFavoritesImplCopyWith<_$AddFoodToMyFavoritesImpl>
      get copyWith =>
          __$$AddFoodToMyFavoritesImplCopyWithImpl<_$AddFoodToMyFavoritesImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyFavorite,
    required TResult Function(Food food) onUpdateMyFavorite,
    required TResult Function(Food food) onAddOrUpdateMyFavorite,
    required TResult Function() onReset,
  }) {
    return onAddToMyFavorite(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyFavorite,
    TResult? Function(Food food)? onUpdateMyFavorite,
    TResult? Function(Food food)? onAddOrUpdateMyFavorite,
    TResult? Function()? onReset,
  }) {
    return onAddToMyFavorite?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyFavorite,
    TResult Function(Food food)? onUpdateMyFavorite,
    TResult Function(Food food)? onAddOrUpdateMyFavorite,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onAddToMyFavorite != null) {
      return onAddToMyFavorite(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyFavorites value) onAddToMyFavorite,
    required TResult Function(UpdateMyFavoriteFood value) onUpdateMyFavorite,
    required TResult Function(AddOrUpdateFoodMyFavorites value)
        onAddOrUpdateMyFavorite,
    required TResult Function(Reset value) onReset,
  }) {
    return onAddToMyFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult? Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult? Function(AddOrUpdateFoodMyFavorites value)?
        onAddOrUpdateMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) {
    return onAddToMyFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult Function(AddOrUpdateFoodMyFavorites value)? onAddOrUpdateMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onAddToMyFavorite != null) {
      return onAddToMyFavorite(this);
    }
    return orElse();
  }
}

abstract class AddFoodToMyFavorites implements AddOrUpdateMyFavoriteEvent {
  const factory AddFoodToMyFavorites(final Food food) =
      _$AddFoodToMyFavoritesImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddFoodToMyFavoritesImplCopyWith<_$AddFoodToMyFavoritesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMyFavoriteFoodImplCopyWith<$Res> {
  factory _$$UpdateMyFavoriteFoodImplCopyWith(_$UpdateMyFavoriteFoodImpl value,
          $Res Function(_$UpdateMyFavoriteFoodImpl) then) =
      __$$UpdateMyFavoriteFoodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$UpdateMyFavoriteFoodImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
        _$UpdateMyFavoriteFoodImpl>
    implements _$$UpdateMyFavoriteFoodImplCopyWith<$Res> {
  __$$UpdateMyFavoriteFoodImplCopyWithImpl(_$UpdateMyFavoriteFoodImpl _value,
      $Res Function(_$UpdateMyFavoriteFoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$UpdateMyFavoriteFoodImpl(
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

class _$UpdateMyFavoriteFoodImpl implements UpdateMyFavoriteFood {
  const _$UpdateMyFavoriteFoodImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteEvent.onUpdateMyFavorite(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMyFavoriteFoodImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMyFavoriteFoodImplCopyWith<_$UpdateMyFavoriteFoodImpl>
      get copyWith =>
          __$$UpdateMyFavoriteFoodImplCopyWithImpl<_$UpdateMyFavoriteFoodImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyFavorite,
    required TResult Function(Food food) onUpdateMyFavorite,
    required TResult Function(Food food) onAddOrUpdateMyFavorite,
    required TResult Function() onReset,
  }) {
    return onUpdateMyFavorite(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyFavorite,
    TResult? Function(Food food)? onUpdateMyFavorite,
    TResult? Function(Food food)? onAddOrUpdateMyFavorite,
    TResult? Function()? onReset,
  }) {
    return onUpdateMyFavorite?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyFavorite,
    TResult Function(Food food)? onUpdateMyFavorite,
    TResult Function(Food food)? onAddOrUpdateMyFavorite,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onUpdateMyFavorite != null) {
      return onUpdateMyFavorite(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyFavorites value) onAddToMyFavorite,
    required TResult Function(UpdateMyFavoriteFood value) onUpdateMyFavorite,
    required TResult Function(AddOrUpdateFoodMyFavorites value)
        onAddOrUpdateMyFavorite,
    required TResult Function(Reset value) onReset,
  }) {
    return onUpdateMyFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult? Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult? Function(AddOrUpdateFoodMyFavorites value)?
        onAddOrUpdateMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) {
    return onUpdateMyFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult Function(AddOrUpdateFoodMyFavorites value)? onAddOrUpdateMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onUpdateMyFavorite != null) {
      return onUpdateMyFavorite(this);
    }
    return orElse();
  }
}

abstract class UpdateMyFavoriteFood implements AddOrUpdateMyFavoriteEvent {
  const factory UpdateMyFavoriteFood(final Food food) =
      _$UpdateMyFavoriteFoodImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$UpdateMyFavoriteFoodImplCopyWith<_$UpdateMyFavoriteFoodImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrUpdateFoodMyFavoritesImplCopyWith<$Res> {
  factory _$$AddOrUpdateFoodMyFavoritesImplCopyWith(
          _$AddOrUpdateFoodMyFavoritesImpl value,
          $Res Function(_$AddOrUpdateFoodMyFavoritesImpl) then) =
      __$$AddOrUpdateFoodMyFavoritesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddOrUpdateFoodMyFavoritesImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
        _$AddOrUpdateFoodMyFavoritesImpl>
    implements _$$AddOrUpdateFoodMyFavoritesImplCopyWith<$Res> {
  __$$AddOrUpdateFoodMyFavoritesImplCopyWithImpl(
      _$AddOrUpdateFoodMyFavoritesImpl _value,
      $Res Function(_$AddOrUpdateFoodMyFavoritesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddOrUpdateFoodMyFavoritesImpl(
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

class _$AddOrUpdateFoodMyFavoritesImpl implements AddOrUpdateFoodMyFavorites {
  const _$AddOrUpdateFoodMyFavoritesImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteEvent.onAddOrUpdateMyFavorite(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateFoodMyFavoritesImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateFoodMyFavoritesImplCopyWith<_$AddOrUpdateFoodMyFavoritesImpl>
      get copyWith => __$$AddOrUpdateFoodMyFavoritesImplCopyWithImpl<
          _$AddOrUpdateFoodMyFavoritesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyFavorite,
    required TResult Function(Food food) onUpdateMyFavorite,
    required TResult Function(Food food) onAddOrUpdateMyFavorite,
    required TResult Function() onReset,
  }) {
    return onAddOrUpdateMyFavorite(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyFavorite,
    TResult? Function(Food food)? onUpdateMyFavorite,
    TResult? Function(Food food)? onAddOrUpdateMyFavorite,
    TResult? Function()? onReset,
  }) {
    return onAddOrUpdateMyFavorite?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyFavorite,
    TResult Function(Food food)? onUpdateMyFavorite,
    TResult Function(Food food)? onAddOrUpdateMyFavorite,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onAddOrUpdateMyFavorite != null) {
      return onAddOrUpdateMyFavorite(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyFavorites value) onAddToMyFavorite,
    required TResult Function(UpdateMyFavoriteFood value) onUpdateMyFavorite,
    required TResult Function(AddOrUpdateFoodMyFavorites value)
        onAddOrUpdateMyFavorite,
    required TResult Function(Reset value) onReset,
  }) {
    return onAddOrUpdateMyFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult? Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult? Function(AddOrUpdateFoodMyFavorites value)?
        onAddOrUpdateMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) {
    return onAddOrUpdateMyFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult Function(AddOrUpdateFoodMyFavorites value)? onAddOrUpdateMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onAddOrUpdateMyFavorite != null) {
      return onAddOrUpdateMyFavorite(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateFoodMyFavorites
    implements AddOrUpdateMyFavoriteEvent {
  const factory AddOrUpdateFoodMyFavorites(final Food food) =
      _$AddOrUpdateFoodMyFavoritesImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddOrUpdateFoodMyFavoritesImplCopyWith<_$AddOrUpdateFoodMyFavoritesImpl>
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
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'AddOrUpdateMyFavoriteEvent.onReset()';
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
    required TResult Function(Food food) onAddToMyFavorite,
    required TResult Function(Food food) onUpdateMyFavorite,
    required TResult Function(Food food) onAddOrUpdateMyFavorite,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyFavorite,
    TResult? Function(Food food)? onUpdateMyFavorite,
    TResult? Function(Food food)? onAddOrUpdateMyFavorite,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyFavorite,
    TResult Function(Food food)? onUpdateMyFavorite,
    TResult Function(Food food)? onAddOrUpdateMyFavorite,
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
    required TResult Function(AddFoodToMyFavorites value) onAddToMyFavorite,
    required TResult Function(UpdateMyFavoriteFood value) onUpdateMyFavorite,
    required TResult Function(AddOrUpdateFoodMyFavorites value)
        onAddOrUpdateMyFavorite,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult? Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult? Function(AddOrUpdateFoodMyFavorites value)?
        onAddOrUpdateMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyFavorites value)? onAddToMyFavorite,
    TResult Function(UpdateMyFavoriteFood value)? onUpdateMyFavorite,
    TResult Function(AddOrUpdateFoodMyFavorites value)? onAddOrUpdateMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements AddOrUpdateMyFavoriteEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$AddOrUpdateMyFavoriteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddOrUpdateMyFavoriteInitialState value) initial,
    required TResult Function(AddOrUpdateMyFavoriteLoadingState value) loading,
    required TResult Function(AddOrUpdateMyFavoriteErrorState value) error,
    required TResult Function(AddOrUpdateMyFavoriteLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult? Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult? Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrUpdateMyFavoriteStateCopyWith<$Res> {
  factory $AddOrUpdateMyFavoriteStateCopyWith(AddOrUpdateMyFavoriteState value,
          $Res Function(AddOrUpdateMyFavoriteState) then) =
      _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
          AddOrUpdateMyFavoriteState>;
}

/// @nodoc
class _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        $Val extends AddOrUpdateMyFavoriteState>
    implements $AddOrUpdateMyFavoriteStateCopyWith<$Res> {
  _$AddOrUpdateMyFavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddOrUpdateMyFavoriteInitialStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteInitialStateImplCopyWith(
          _$AddOrUpdateMyFavoriteInitialStateImpl value,
          $Res Function(_$AddOrUpdateMyFavoriteInitialStateImpl) then) =
      __$$AddOrUpdateMyFavoriteInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteInitialStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteInitialStateImpl>
    implements _$$AddOrUpdateMyFavoriteInitialStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteInitialStateImplCopyWithImpl(
      _$AddOrUpdateMyFavoriteInitialStateImpl _value,
      $Res Function(_$AddOrUpdateMyFavoriteInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddOrUpdateMyFavoriteInitialStateImpl
    implements AddOrUpdateMyFavoriteInitialState {
  const _$AddOrUpdateMyFavoriteInitialStateImpl();

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
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
    required TResult Function(AddOrUpdateMyFavoriteInitialState value) initial,
    required TResult Function(AddOrUpdateMyFavoriteLoadingState value) loading,
    required TResult Function(AddOrUpdateMyFavoriteErrorState value) error,
    required TResult Function(AddOrUpdateMyFavoriteLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult? Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult? Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyFavoriteInitialState
    implements AddOrUpdateMyFavoriteState {
  const factory AddOrUpdateMyFavoriteInitialState() =
      _$AddOrUpdateMyFavoriteInitialStateImpl;
}

/// @nodoc
abstract class _$$AddOrUpdateMyFavoriteLoadingStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteLoadingStateImplCopyWith(
          _$AddOrUpdateMyFavoriteLoadingStateImpl value,
          $Res Function(_$AddOrUpdateMyFavoriteLoadingStateImpl) then) =
      __$$AddOrUpdateMyFavoriteLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteLoadingStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteLoadingStateImpl>
    implements _$$AddOrUpdateMyFavoriteLoadingStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteLoadingStateImplCopyWithImpl(
      _$AddOrUpdateMyFavoriteLoadingStateImpl _value,
      $Res Function(_$AddOrUpdateMyFavoriteLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddOrUpdateMyFavoriteLoadingStateImpl
    implements AddOrUpdateMyFavoriteLoadingState {
  const _$AddOrUpdateMyFavoriteLoadingStateImpl();

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
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
    required TResult Function(AddOrUpdateMyFavoriteInitialState value) initial,
    required TResult Function(AddOrUpdateMyFavoriteLoadingState value) loading,
    required TResult Function(AddOrUpdateMyFavoriteErrorState value) error,
    required TResult Function(AddOrUpdateMyFavoriteLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult? Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult? Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyFavoriteLoadingState
    implements AddOrUpdateMyFavoriteState {
  const factory AddOrUpdateMyFavoriteLoadingState() =
      _$AddOrUpdateMyFavoriteLoadingStateImpl;
}

/// @nodoc
abstract class _$$AddOrUpdateMyFavoriteErrorStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteErrorStateImplCopyWith(
          _$AddOrUpdateMyFavoriteErrorStateImpl value,
          $Res Function(_$AddOrUpdateMyFavoriteErrorStateImpl) then) =
      __$$AddOrUpdateMyFavoriteErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteErrorStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteErrorStateImpl>
    implements _$$AddOrUpdateMyFavoriteErrorStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteErrorStateImplCopyWithImpl(
      _$AddOrUpdateMyFavoriteErrorStateImpl _value,
      $Res Function(_$AddOrUpdateMyFavoriteErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AddOrUpdateMyFavoriteErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddOrUpdateMyFavoriteErrorStateImpl
    implements AddOrUpdateMyFavoriteErrorState {
  const _$AddOrUpdateMyFavoriteErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateMyFavoriteErrorStateImplCopyWith<
          _$AddOrUpdateMyFavoriteErrorStateImpl>
      get copyWith => __$$AddOrUpdateMyFavoriteErrorStateImplCopyWithImpl<
          _$AddOrUpdateMyFavoriteErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
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
    required TResult Function(AddOrUpdateMyFavoriteInitialState value) initial,
    required TResult Function(AddOrUpdateMyFavoriteLoadingState value) loading,
    required TResult Function(AddOrUpdateMyFavoriteErrorState value) error,
    required TResult Function(AddOrUpdateMyFavoriteLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult? Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult? Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyFavoriteErrorState
    implements AddOrUpdateMyFavoriteState {
  const factory AddOrUpdateMyFavoriteErrorState(final String message) =
      _$AddOrUpdateMyFavoriteErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AddOrUpdateMyFavoriteErrorStateImplCopyWith<
          _$AddOrUpdateMyFavoriteErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrUpdateMyFavoriteLoadedStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteLoadedStateImplCopyWith(
          _$AddOrUpdateMyFavoriteLoadedStateImpl value,
          $Res Function(_$AddOrUpdateMyFavoriteLoadedStateImpl) then) =
      __$$AddOrUpdateMyFavoriteLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteLoadedStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteLoadedStateImpl>
    implements _$$AddOrUpdateMyFavoriteLoadedStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteLoadedStateImplCopyWithImpl(
      _$AddOrUpdateMyFavoriteLoadedStateImpl _value,
      $Res Function(_$AddOrUpdateMyFavoriteLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddOrUpdateMyFavoriteLoadedStateImpl(
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

class _$AddOrUpdateMyFavoriteLoadedStateImpl
    implements AddOrUpdateMyFavoriteLoadedState {
  const _$AddOrUpdateMyFavoriteLoadedStateImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.loaded(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteLoadedStateImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateMyFavoriteLoadedStateImplCopyWith<
          _$AddOrUpdateMyFavoriteLoadedStateImpl>
      get copyWith => __$$AddOrUpdateMyFavoriteLoadedStateImplCopyWithImpl<
          _$AddOrUpdateMyFavoriteLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(Food food) loaded,
  }) {
    return loaded(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(Food food)? loaded,
  }) {
    return loaded?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(Food food)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddOrUpdateMyFavoriteInitialState value) initial,
    required TResult Function(AddOrUpdateMyFavoriteLoadingState value) loading,
    required TResult Function(AddOrUpdateMyFavoriteErrorState value) error,
    required TResult Function(AddOrUpdateMyFavoriteLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult? Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult? Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyFavoriteInitialState value)? initial,
    TResult Function(AddOrUpdateMyFavoriteLoadingState value)? loading,
    TResult Function(AddOrUpdateMyFavoriteErrorState value)? error,
    TResult Function(AddOrUpdateMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyFavoriteLoadedState
    implements AddOrUpdateMyFavoriteState {
  const factory AddOrUpdateMyFavoriteLoadedState(final Food food) =
      _$AddOrUpdateMyFavoriteLoadedStateImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddOrUpdateMyFavoriteLoadedStateImplCopyWith<
          _$AddOrUpdateMyFavoriteLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
