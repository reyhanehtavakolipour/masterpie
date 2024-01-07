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
abstract class _$$RemoveFoodFromMyFavoritesCopyWith<$Res> {
  factory _$$RemoveFoodFromMyFavoritesCopyWith(
          _$RemoveFoodFromMyFavorites value,
          $Res Function(_$RemoveFoodFromMyFavorites) then) =
      __$$RemoveFoodFromMyFavoritesCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$RemoveFoodFromMyFavoritesCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteEventCopyWithImpl<$Res,
        _$RemoveFoodFromMyFavorites>
    implements _$$RemoveFoodFromMyFavoritesCopyWith<$Res> {
  __$$RemoveFoodFromMyFavoritesCopyWithImpl(_$RemoveFoodFromMyFavorites _value,
      $Res Function(_$RemoveFoodFromMyFavorites) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$RemoveFoodFromMyFavorites(
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

class _$RemoveFoodFromMyFavorites implements RemoveFoodFromMyFavorites {
  const _$RemoveFoodFromMyFavorites(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFoodFromMyFavorites &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFoodFromMyFavoritesCopyWith<_$RemoveFoodFromMyFavorites>
      get copyWith => __$$RemoveFoodFromMyFavoritesCopyWithImpl<
          _$RemoveFoodFromMyFavorites>(this, _$identity);

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
      _$RemoveFoodFromMyFavorites;

  Food get food;
  @JsonKey(ignore: true)
  _$$RemoveFoodFromMyFavoritesCopyWith<_$RemoveFoodFromMyFavorites>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'RemoveFromMyFavoriteEvent.onReset()';
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
  const factory Reset() = _$Reset;
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
abstract class _$$RemoveFromMyFavoriteInitialStateCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteInitialStateCopyWith(
          _$RemoveFromMyFavoriteInitialState value,
          $Res Function(_$RemoveFromMyFavoriteInitialState) then) =
      __$$RemoveFromMyFavoriteInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveFromMyFavoriteInitialStateCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteInitialState>
    implements _$$RemoveFromMyFavoriteInitialStateCopyWith<$Res> {
  __$$RemoveFromMyFavoriteInitialStateCopyWithImpl(
      _$RemoveFromMyFavoriteInitialState _value,
      $Res Function(_$RemoveFromMyFavoriteInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveFromMyFavoriteInitialState
    implements RemoveFromMyFavoriteInitialState {
  const _$RemoveFromMyFavoriteInitialState();

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteInitialState);
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
      _$RemoveFromMyFavoriteInitialState;
}

/// @nodoc
abstract class _$$RemoveFromMyFavoriteLoadingStateCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteLoadingStateCopyWith(
          _$RemoveFromMyFavoriteLoadingState value,
          $Res Function(_$RemoveFromMyFavoriteLoadingState) then) =
      __$$RemoveFromMyFavoriteLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveFromMyFavoriteLoadingStateCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteLoadingState>
    implements _$$RemoveFromMyFavoriteLoadingStateCopyWith<$Res> {
  __$$RemoveFromMyFavoriteLoadingStateCopyWithImpl(
      _$RemoveFromMyFavoriteLoadingState _value,
      $Res Function(_$RemoveFromMyFavoriteLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveFromMyFavoriteLoadingState
    implements RemoveFromMyFavoriteLoadingState {
  const _$RemoveFromMyFavoriteLoadingState();

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteLoadingState);
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
      _$RemoveFromMyFavoriteLoadingState;
}

/// @nodoc
abstract class _$$RemoveFromMyFavoriteErrorStateCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteErrorStateCopyWith(
          _$RemoveFromMyFavoriteErrorState value,
          $Res Function(_$RemoveFromMyFavoriteErrorState) then) =
      __$$RemoveFromMyFavoriteErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RemoveFromMyFavoriteErrorStateCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteErrorState>
    implements _$$RemoveFromMyFavoriteErrorStateCopyWith<$Res> {
  __$$RemoveFromMyFavoriteErrorStateCopyWithImpl(
      _$RemoveFromMyFavoriteErrorState _value,
      $Res Function(_$RemoveFromMyFavoriteErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RemoveFromMyFavoriteErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromMyFavoriteErrorState
    implements RemoveFromMyFavoriteErrorState {
  const _$RemoveFromMyFavoriteErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromMyFavoriteErrorStateCopyWith<_$RemoveFromMyFavoriteErrorState>
      get copyWith => __$$RemoveFromMyFavoriteErrorStateCopyWithImpl<
          _$RemoveFromMyFavoriteErrorState>(this, _$identity);

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
      _$RemoveFromMyFavoriteErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$RemoveFromMyFavoriteErrorStateCopyWith<_$RemoveFromMyFavoriteErrorState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromMyFavoriteLoadedStateCopyWith<$Res> {
  factory _$$RemoveFromMyFavoriteLoadedStateCopyWith(
          _$RemoveFromMyFavoriteLoadedState value,
          $Res Function(_$RemoveFromMyFavoriteLoadedState) then) =
      __$$RemoveFromMyFavoriteLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$RemoveFromMyFavoriteLoadedStateCopyWithImpl<$Res>
    extends _$RemoveFromMyFavoriteStateCopyWithImpl<$Res,
        _$RemoveFromMyFavoriteLoadedState>
    implements _$$RemoveFromMyFavoriteLoadedStateCopyWith<$Res> {
  __$$RemoveFromMyFavoriteLoadedStateCopyWithImpl(
      _$RemoveFromMyFavoriteLoadedState _value,
      $Res Function(_$RemoveFromMyFavoriteLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$RemoveFromMyFavoriteLoadedState(
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

class _$RemoveFromMyFavoriteLoadedState
    implements RemoveFromMyFavoriteLoadedState {
  const _$RemoveFromMyFavoriteLoadedState(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'RemoveFromMyFavoriteState.loaded(food: $food)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyFavoriteLoadedState &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromMyFavoriteLoadedStateCopyWith<_$RemoveFromMyFavoriteLoadedState>
      get copyWith => __$$RemoveFromMyFavoriteLoadedStateCopyWithImpl<
          _$RemoveFromMyFavoriteLoadedState>(this, _$identity);

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
      _$RemoveFromMyFavoriteLoadedState;

  Food get food;
  @JsonKey(ignore: true)
  _$$RemoveFromMyFavoriteLoadedStateCopyWith<_$RemoveFromMyFavoriteLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}
