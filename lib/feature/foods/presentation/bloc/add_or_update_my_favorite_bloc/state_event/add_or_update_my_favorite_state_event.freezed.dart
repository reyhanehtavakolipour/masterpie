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
abstract class _$$AddFoodToMyFavoritesCopyWith<$Res> {
  factory _$$AddFoodToMyFavoritesCopyWith(_$AddFoodToMyFavorites value,
          $Res Function(_$AddFoodToMyFavorites) then) =
      __$$AddFoodToMyFavoritesCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddFoodToMyFavoritesCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
        _$AddFoodToMyFavorites>
    implements _$$AddFoodToMyFavoritesCopyWith<$Res> {
  __$$AddFoodToMyFavoritesCopyWithImpl(_$AddFoodToMyFavorites _value,
      $Res Function(_$AddFoodToMyFavorites) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddFoodToMyFavorites(
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

class _$AddFoodToMyFavorites implements AddFoodToMyFavorites {
  const _$AddFoodToMyFavorites(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFoodToMyFavorites &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFoodToMyFavoritesCopyWith<_$AddFoodToMyFavorites> get copyWith =>
      __$$AddFoodToMyFavoritesCopyWithImpl<_$AddFoodToMyFavorites>(
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
  const factory AddFoodToMyFavorites(final Food food) = _$AddFoodToMyFavorites;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddFoodToMyFavoritesCopyWith<_$AddFoodToMyFavorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMyFavoriteFoodCopyWith<$Res> {
  factory _$$UpdateMyFavoriteFoodCopyWith(_$UpdateMyFavoriteFood value,
          $Res Function(_$UpdateMyFavoriteFood) then) =
      __$$UpdateMyFavoriteFoodCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$UpdateMyFavoriteFoodCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
        _$UpdateMyFavoriteFood>
    implements _$$UpdateMyFavoriteFoodCopyWith<$Res> {
  __$$UpdateMyFavoriteFoodCopyWithImpl(_$UpdateMyFavoriteFood _value,
      $Res Function(_$UpdateMyFavoriteFood) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$UpdateMyFavoriteFood(
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

class _$UpdateMyFavoriteFood implements UpdateMyFavoriteFood {
  const _$UpdateMyFavoriteFood(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteEvent.onUpdateMyFavorite(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMyFavoriteFood &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMyFavoriteFoodCopyWith<_$UpdateMyFavoriteFood> get copyWith =>
      __$$UpdateMyFavoriteFoodCopyWithImpl<_$UpdateMyFavoriteFood>(
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
  const factory UpdateMyFavoriteFood(final Food food) = _$UpdateMyFavoriteFood;

  Food get food;
  @JsonKey(ignore: true)
  _$$UpdateMyFavoriteFoodCopyWith<_$UpdateMyFavoriteFood> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrUpdateFoodMyFavoritesCopyWith<$Res> {
  factory _$$AddOrUpdateFoodMyFavoritesCopyWith(
          _$AddOrUpdateFoodMyFavorites value,
          $Res Function(_$AddOrUpdateFoodMyFavorites) then) =
      __$$AddOrUpdateFoodMyFavoritesCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddOrUpdateFoodMyFavoritesCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res,
        _$AddOrUpdateFoodMyFavorites>
    implements _$$AddOrUpdateFoodMyFavoritesCopyWith<$Res> {
  __$$AddOrUpdateFoodMyFavoritesCopyWithImpl(
      _$AddOrUpdateFoodMyFavorites _value,
      $Res Function(_$AddOrUpdateFoodMyFavorites) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddOrUpdateFoodMyFavorites(
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

class _$AddOrUpdateFoodMyFavorites implements AddOrUpdateFoodMyFavorites {
  const _$AddOrUpdateFoodMyFavorites(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteEvent.onAddOrUpdateMyFavorite(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateFoodMyFavorites &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateFoodMyFavoritesCopyWith<_$AddOrUpdateFoodMyFavorites>
      get copyWith => __$$AddOrUpdateFoodMyFavoritesCopyWithImpl<
          _$AddOrUpdateFoodMyFavorites>(this, _$identity);

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
      _$AddOrUpdateFoodMyFavorites;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddOrUpdateFoodMyFavoritesCopyWith<_$AddOrUpdateFoodMyFavorites>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteEvent.onReset()';
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
  const factory Reset() = _$Reset;
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
abstract class _$$AddOrUpdateMyFavoriteInitialStateCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteInitialStateCopyWith(
          _$AddOrUpdateMyFavoriteInitialState value,
          $Res Function(_$AddOrUpdateMyFavoriteInitialState) then) =
      __$$AddOrUpdateMyFavoriteInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteInitialStateCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteInitialState>
    implements _$$AddOrUpdateMyFavoriteInitialStateCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteInitialStateCopyWithImpl(
      _$AddOrUpdateMyFavoriteInitialState _value,
      $Res Function(_$AddOrUpdateMyFavoriteInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddOrUpdateMyFavoriteInitialState
    implements AddOrUpdateMyFavoriteInitialState {
  const _$AddOrUpdateMyFavoriteInitialState();

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteInitialState);
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
      _$AddOrUpdateMyFavoriteInitialState;
}

/// @nodoc
abstract class _$$AddOrUpdateMyFavoriteLoadingStateCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteLoadingStateCopyWith(
          _$AddOrUpdateMyFavoriteLoadingState value,
          $Res Function(_$AddOrUpdateMyFavoriteLoadingState) then) =
      __$$AddOrUpdateMyFavoriteLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteLoadingStateCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteLoadingState>
    implements _$$AddOrUpdateMyFavoriteLoadingStateCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteLoadingStateCopyWithImpl(
      _$AddOrUpdateMyFavoriteLoadingState _value,
      $Res Function(_$AddOrUpdateMyFavoriteLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddOrUpdateMyFavoriteLoadingState
    implements AddOrUpdateMyFavoriteLoadingState {
  const _$AddOrUpdateMyFavoriteLoadingState();

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteLoadingState);
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
      _$AddOrUpdateMyFavoriteLoadingState;
}

/// @nodoc
abstract class _$$AddOrUpdateMyFavoriteErrorStateCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteErrorStateCopyWith(
          _$AddOrUpdateMyFavoriteErrorState value,
          $Res Function(_$AddOrUpdateMyFavoriteErrorState) then) =
      __$$AddOrUpdateMyFavoriteErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteErrorStateCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteErrorState>
    implements _$$AddOrUpdateMyFavoriteErrorStateCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteErrorStateCopyWithImpl(
      _$AddOrUpdateMyFavoriteErrorState _value,
      $Res Function(_$AddOrUpdateMyFavoriteErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AddOrUpdateMyFavoriteErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddOrUpdateMyFavoriteErrorState
    implements AddOrUpdateMyFavoriteErrorState {
  const _$AddOrUpdateMyFavoriteErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateMyFavoriteErrorStateCopyWith<_$AddOrUpdateMyFavoriteErrorState>
      get copyWith => __$$AddOrUpdateMyFavoriteErrorStateCopyWithImpl<
          _$AddOrUpdateMyFavoriteErrorState>(this, _$identity);

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
      _$AddOrUpdateMyFavoriteErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$AddOrUpdateMyFavoriteErrorStateCopyWith<_$AddOrUpdateMyFavoriteErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrUpdateMyFavoriteLoadedStateCopyWith<$Res> {
  factory _$$AddOrUpdateMyFavoriteLoadedStateCopyWith(
          _$AddOrUpdateMyFavoriteLoadedState value,
          $Res Function(_$AddOrUpdateMyFavoriteLoadedState) then) =
      __$$AddOrUpdateMyFavoriteLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddOrUpdateMyFavoriteLoadedStateCopyWithImpl<$Res>
    extends _$AddOrUpdateMyFavoriteStateCopyWithImpl<$Res,
        _$AddOrUpdateMyFavoriteLoadedState>
    implements _$$AddOrUpdateMyFavoriteLoadedStateCopyWith<$Res> {
  __$$AddOrUpdateMyFavoriteLoadedStateCopyWithImpl(
      _$AddOrUpdateMyFavoriteLoadedState _value,
      $Res Function(_$AddOrUpdateMyFavoriteLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddOrUpdateMyFavoriteLoadedState(
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

class _$AddOrUpdateMyFavoriteLoadedState
    implements AddOrUpdateMyFavoriteLoadedState {
  const _$AddOrUpdateMyFavoriteLoadedState(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyFavoriteState.loaded(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyFavoriteLoadedState &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateMyFavoriteLoadedStateCopyWith<
          _$AddOrUpdateMyFavoriteLoadedState>
      get copyWith => __$$AddOrUpdateMyFavoriteLoadedStateCopyWithImpl<
          _$AddOrUpdateMyFavoriteLoadedState>(this, _$identity);

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
      _$AddOrUpdateMyFavoriteLoadedState;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddOrUpdateMyFavoriteLoadedStateCopyWith<
          _$AddOrUpdateMyFavoriteLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}
