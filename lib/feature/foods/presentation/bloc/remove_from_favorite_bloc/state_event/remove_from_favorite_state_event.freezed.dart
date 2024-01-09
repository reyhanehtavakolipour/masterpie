// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_from_favorite_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoveFromMyFavoriteEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onRemoveFromMyFavorite,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onRemoveFromMyFavorite,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onRemoveFromMyFavorite,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveFoodFromMyFavorites value)
        onRemoveFromMyFavorite,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFoodFromMyFavorites value)? onRemoveFromMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFoodFromMyFavorites value)? onRemoveFromMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFromMyFavoriteEventCopyWith<$Res> {
  factory $RemoveFromMyFavoriteEventCopyWith(RemoveFromMyFavoriteEvent value,
          $Res Function(RemoveFromMyFavoriteEvent) then) =
      _$RemoveFromMyFavoriteEventCopyWithImpl<$Res, RemoveFromMyFavoriteEvent>;
}

/// @nodoc
class _$RemoveFromMyFavoriteEventCopyWithImpl<$Res,
        $Val extends RemoveFromMyFavoriteEvent>
    implements $RemoveFromMyFavoriteEventCopyWith<$Res> {
  _$RemoveFromMyFavoriteEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RemoveFoodFromMyFavoritesImplCopyWith<$Res> {
  factory _$$RemoveFoodFromMyFavoritesImplCopyWith(
          _$RemoveFoodFromMyFavoritesImpl value,
          $Res Function(_$RemoveFoodFromMyFavoritesImpl) then) =
      __$$RemoveFoodFromMyFavoritesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$RemoveFoodFromMyFavoritesImplCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteEventCopyWithImpl<$Res,
        _$RemoveFoodFromMyFavoritesImpl>
    implements _$$RemoveFoodFromMyFavoritesImplCopyWith<$Res> {
  __$$RemoveFoodFromMyFavoritesImplCopyWithImpl(
      _$RemoveFoodFromMyFavoritesImpl _value,
      $Res Function(_$RemoveFoodFromMyFavoritesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$RemoveFoodFromMyFavoritesImpl(
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

class _$RemoveFoodFromMyFavoritesImpl implements RemoveFoodFromMyFavorites {
  const _$RemoveFoodFromMyFavoritesImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFoodFromMyFavoritesImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFoodFromMyFavoritesImplCopyWith<_$RemoveFoodFromMyFavoritesImpl>
      get copyWith => __$$RemoveFoodFromMyFavoritesImplCopyWithImpl<
          _$RemoveFoodFromMyFavoritesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onRemoveFromMyFavorite,
    required TResult Function() onReset,
  }) {
    return onRemoveFromMyFavorite(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onRemoveFromMyFavorite,
    TResult? Function()? onReset,
  }) {
    return onRemoveFromMyFavorite?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onRemoveFromMyFavorite,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onRemoveFromMyFavorite != null) {
      return onRemoveFromMyFavorite(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveFoodFromMyFavorites value)
        onRemoveFromMyFavorite,
    required TResult Function(Reset value) onReset,
  }) {
    return onRemoveFromMyFavorite(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFoodFromMyFavorites value)? onRemoveFromMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) {
    return onRemoveFromMyFavorite?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFoodFromMyFavorites value)? onRemoveFromMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onRemoveFromMyFavorite != null) {
      return onRemoveFromMyFavorite(this);
    }
    return orElse();
  }
}

abstract class RemoveFoodFromMyFavorites implements RemoveFromMyFavoriteEvent {
  const factory RemoveFoodFromMyFavorites(final Food food) =
      _$RemoveFoodFromMyFavoritesImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$RemoveFoodFromMyFavoritesImplCopyWith<_$RemoveFoodFromMyFavoritesImpl>
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
    extends _$RemoveFromMyFavoriteEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'RemoveFromMyFavoriteEvent.onReset()';
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
    required TResult Function(Food food) onRemoveFromMyFavorite,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onRemoveFromMyFavorite,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onRemoveFromMyFavorite,
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
    required TResult Function(RemoveFoodFromMyFavorites value)
        onRemoveFromMyFavorite,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFoodFromMyFavorites value)? onRemoveFromMyFavorite,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFoodFromMyFavorites value)? onRemoveFromMyFavorite,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements RemoveFromMyFavoriteEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$RemoveFromMyFavoriteState {
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
    required TResult Function(RemoveFromMyFavoriteInitialState value) initial,
    required TResult Function(RemoveFromMyFavoriteLoadingState value) loading,
    required TResult Function(RemoveFromMyFavoriteErrorState value) error,
    required TResult Function(RemoveFromMyFavoriteLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult? Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult? Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult? Function(RemoveFromMyFavoriteLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult Function(RemoveFromMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFromMyFavoriteStateCopyWith<$Res> {
  factory $RemoveFromMyFavoriteStateCopyWith(RemoveFromMyFavoriteState value,
          $Res Function(RemoveFromMyFavoriteState) then) =
      _$RemoveFromMyFavoriteStateCopyWithImpl<$Res, RemoveFromMyFavoriteState>;
}

/// @nodoc
class _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        $Val extends RemoveFromMyFavoriteState>
    implements $RemoveFromMyFavoriteStateCopyWith<$Res> {
  _$RemoveFromMyFavoriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RemoveFromMyFavoriteInitialStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteInitialStateImplCopyWith(
          _$RemoveFromMyFavoriteInitialStateImpl value,
          $Res Function(_$RemoveFromMyFavoriteInitialStateImpl) then) =
      __$$RemoveFromMyFavoriteInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveFromMyFavoriteInitialStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteInitialStateImpl>
    implements _$$RemoveFromMyFavoriteInitialStateImplCopyWith<$Res> {
  __$$RemoveFromMyFavoriteInitialStateImplCopyWithImpl(
      _$RemoveFromMyFavoriteInitialStateImpl _value,
      $Res Function(_$RemoveFromMyFavoriteInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveFromMyFavoriteInitialStateImpl
    implements RemoveFromMyFavoriteInitialState {
  const _$RemoveFromMyFavoriteInitialStateImpl();

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteInitialStateImpl);
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
    required TResult Function(RemoveFromMyFavoriteInitialState value) initial,
    required TResult Function(RemoveFromMyFavoriteLoadingState value) loading,
    required TResult Function(RemoveFromMyFavoriteErrorState value) error,
    required TResult Function(RemoveFromMyFavoriteLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult? Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult? Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult? Function(RemoveFromMyFavoriteLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult Function(RemoveFromMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyFavoriteInitialState
    implements RemoveFromMyFavoriteState {
  const factory RemoveFromMyFavoriteInitialState() =
      _$RemoveFromMyFavoriteInitialStateImpl;
}

/// @nodoc
abstract class _$$RemoveFromMyFavoriteLoadingStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteLoadingStateImplCopyWith(
          _$RemoveFromMyFavoriteLoadingStateImpl value,
          $Res Function(_$RemoveFromMyFavoriteLoadingStateImpl) then) =
      __$$RemoveFromMyFavoriteLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveFromMyFavoriteLoadingStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteLoadingStateImpl>
    implements _$$RemoveFromMyFavoriteLoadingStateImplCopyWith<$Res> {
  __$$RemoveFromMyFavoriteLoadingStateImplCopyWithImpl(
      _$RemoveFromMyFavoriteLoadingStateImpl _value,
      $Res Function(_$RemoveFromMyFavoriteLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveFromMyFavoriteLoadingStateImpl
    implements RemoveFromMyFavoriteLoadingState {
  const _$RemoveFromMyFavoriteLoadingStateImpl();

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteLoadingStateImpl);
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
    required TResult Function(RemoveFromMyFavoriteInitialState value) initial,
    required TResult Function(RemoveFromMyFavoriteLoadingState value) loading,
    required TResult Function(RemoveFromMyFavoriteErrorState value) error,
    required TResult Function(RemoveFromMyFavoriteLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult? Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult? Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult? Function(RemoveFromMyFavoriteLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult Function(RemoveFromMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyFavoriteLoadingState
    implements RemoveFromMyFavoriteState {
  const factory RemoveFromMyFavoriteLoadingState() =
      _$RemoveFromMyFavoriteLoadingStateImpl;
}

/// @nodoc
abstract class _$$RemoveFromMyFavoriteErrorStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteErrorStateImplCopyWith(
          _$RemoveFromMyFavoriteErrorStateImpl value,
          $Res Function(_$RemoveFromMyFavoriteErrorStateImpl) then) =
      __$$RemoveFromMyFavoriteErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RemoveFromMyFavoriteErrorStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteErrorStateImpl>
    implements _$$RemoveFromMyFavoriteErrorStateImplCopyWith<$Res> {
  __$$RemoveFromMyFavoriteErrorStateImplCopyWithImpl(
      _$RemoveFromMyFavoriteErrorStateImpl _value,
      $Res Function(_$RemoveFromMyFavoriteErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RemoveFromMyFavoriteErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromMyFavoriteErrorStateImpl
    implements RemoveFromMyFavoriteErrorState {
  const _$RemoveFromMyFavoriteErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromMyFavoriteErrorStateImplCopyWith<
          _$RemoveFromMyFavoriteErrorStateImpl>
      get copyWith => __$$RemoveFromMyFavoriteErrorStateImplCopyWithImpl<
          _$RemoveFromMyFavoriteErrorStateImpl>(this, _$identity);

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
    required TResult Function(RemoveFromMyFavoriteInitialState value) initial,
    required TResult Function(RemoveFromMyFavoriteLoadingState value) loading,
    required TResult Function(RemoveFromMyFavoriteErrorState value) error,
    required TResult Function(RemoveFromMyFavoriteLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult? Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult? Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult? Function(RemoveFromMyFavoriteLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult Function(RemoveFromMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyFavoriteErrorState
    implements RemoveFromMyFavoriteState {
  const factory RemoveFromMyFavoriteErrorState(final String message) =
      _$RemoveFromMyFavoriteErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RemoveFromMyFavoriteErrorStateImplCopyWith<
          _$RemoveFromMyFavoriteErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromMyFavoriteLoadedStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteLoadedStateImplCopyWith(
          _$RemoveFromMyFavoriteLoadedStateImpl value,
          $Res Function(_$RemoveFromMyFavoriteLoadedStateImpl) then) =
      __$$RemoveFromMyFavoriteLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$RemoveFromMyFavoriteLoadedStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteLoadedStateImpl>
    implements _$$RemoveFromMyFavoriteLoadedStateImplCopyWith<$Res> {
  __$$RemoveFromMyFavoriteLoadedStateImplCopyWithImpl(
      _$RemoveFromMyFavoriteLoadedStateImpl _value,
      $Res Function(_$RemoveFromMyFavoriteLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$RemoveFromMyFavoriteLoadedStateImpl(
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

class _$RemoveFromMyFavoriteLoadedStateImpl
    implements RemoveFromMyFavoriteLoadedState {
  const _$RemoveFromMyFavoriteLoadedStateImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.loaded(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteLoadedStateImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromMyFavoriteLoadedStateImplCopyWith<
          _$RemoveFromMyFavoriteLoadedStateImpl>
      get copyWith => __$$RemoveFromMyFavoriteLoadedStateImplCopyWithImpl<
          _$RemoveFromMyFavoriteLoadedStateImpl>(this, _$identity);

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
    required TResult Function(RemoveFromMyFavoriteInitialState value) initial,
    required TResult Function(RemoveFromMyFavoriteLoadingState value) loading,
    required TResult Function(RemoveFromMyFavoriteErrorState value) error,
    required TResult Function(RemoveFromMyFavoriteLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult? Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult? Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult? Function(RemoveFromMyFavoriteLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyFavoriteInitialState value)? initial,
    TResult Function(RemoveFromMyFavoriteLoadingState value)? loading,
    TResult Function(RemoveFromMyFavoriteErrorState value)? error,
    TResult Function(RemoveFromMyFavoriteLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyFavoriteLoadedState
    implements RemoveFromMyFavoriteState {
  const factory RemoveFromMyFavoriteLoadedState(final Food food) =
      _$RemoveFromMyFavoriteLoadedStateImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$RemoveFromMyFavoriteLoadedStateImplCopyWith<
          _$RemoveFromMyFavoriteLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
