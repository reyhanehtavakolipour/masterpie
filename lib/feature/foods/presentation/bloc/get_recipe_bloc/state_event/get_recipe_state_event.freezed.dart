// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_recipe_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetRecipeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GenericFood genericFood) onGetRecipe,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GenericFood genericFood)? onGetRecipe,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GenericFood genericFood)? onGetRecipe,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecipeDetailEvent value) onGetRecipe,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeDetailEvent value)? onGetRecipe,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeDetailEvent value)? onGetRecipe,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRecipeEventCopyWith<$Res> {
  factory $GetRecipeEventCopyWith(
          GetRecipeEvent value, $Res Function(GetRecipeEvent) then) =
      _$GetRecipeEventCopyWithImpl<$Res, GetRecipeEvent>;
}

/// @nodoc
class _$GetRecipeEventCopyWithImpl<$Res, $Val extends GetRecipeEvent>
    implements $GetRecipeEventCopyWith<$Res> {
  _$GetRecipeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetRecipeDetailEventImplCopyWith<$Res> {
  factory _$$GetRecipeDetailEventImplCopyWith(_$GetRecipeDetailEventImpl value,
          $Res Function(_$GetRecipeDetailEventImpl) then) =
      __$$GetRecipeDetailEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GenericFood genericFood});

  $GenericFoodCopyWith<$Res> get genericFood;
}

/// @nodoc
class __$$GetRecipeDetailEventImplCopyWithImpl<$Res>
    extends _$GetRecipeEventCopyWithImpl<$Res, _$GetRecipeDetailEventImpl>
    implements _$$GetRecipeDetailEventImplCopyWith<$Res> {
  __$$GetRecipeDetailEventImplCopyWithImpl(_$GetRecipeDetailEventImpl _value,
      $Res Function(_$GetRecipeDetailEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genericFood = null,
  }) {
    return _then(_$GetRecipeDetailEventImpl(
      null == genericFood
          ? _value.genericFood
          : genericFood // ignore: cast_nullable_to_non_nullable
              as GenericFood,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GenericFoodCopyWith<$Res> get genericFood {
    return $GenericFoodCopyWith<$Res>(_value.genericFood, (value) {
      return _then(_value.copyWith(genericFood: value));
    });
  }
}

/// @nodoc

class _$GetRecipeDetailEventImpl implements GetRecipeDetailEvent {
  const _$GetRecipeDetailEventImpl(this.genericFood);

  @override
  final GenericFood genericFood;

  @override
  String toString() {
    return 'GetRecipeEvent.onGetRecipe(genericFood: $genericFood)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecipeDetailEventImpl &&
            (identical(other.genericFood, genericFood) ||
                other.genericFood == genericFood));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genericFood);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRecipeDetailEventImplCopyWith<_$GetRecipeDetailEventImpl>
      get copyWith =>
          __$$GetRecipeDetailEventImplCopyWithImpl<_$GetRecipeDetailEventImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(GenericFood genericFood) onGetRecipe,
    required TResult Function() onReset,
  }) {
    return onGetRecipe(genericFood);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GenericFood genericFood)? onGetRecipe,
    TResult? Function()? onReset,
  }) {
    return onGetRecipe?.call(genericFood);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GenericFood genericFood)? onGetRecipe,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetRecipe != null) {
      return onGetRecipe(genericFood);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecipeDetailEvent value) onGetRecipe,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetRecipe(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeDetailEvent value)? onGetRecipe,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetRecipe?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeDetailEvent value)? onGetRecipe,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetRecipe != null) {
      return onGetRecipe(this);
    }
    return orElse();
  }
}

abstract class GetRecipeDetailEvent implements GetRecipeEvent {
  const factory GetRecipeDetailEvent(final GenericFood genericFood) =
      _$GetRecipeDetailEventImpl;

  GenericFood get genericFood;
  @JsonKey(ignore: true)
  _$$GetRecipeDetailEventImplCopyWith<_$GetRecipeDetailEventImpl>
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
    extends _$GetRecipeEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'GetRecipeEvent.onReset()';
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
    required TResult Function(GenericFood genericFood) onGetRecipe,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(GenericFood genericFood)? onGetRecipe,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GenericFood genericFood)? onGetRecipe,
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
    required TResult Function(GetRecipeDetailEvent value) onGetRecipe,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeDetailEvent value)? onGetRecipe,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeDetailEvent value)? onGetRecipe,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements GetRecipeEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$GetRecipeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GenericFood food) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GenericFood food)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GenericFood food)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecipeInitialState value) initial,
    required TResult Function(GetRecipeLoadingState value) loading,
    required TResult Function(GetRecipeErrorState value) error,
    required TResult Function(GetRecipeLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeInitialState value)? initial,
    TResult? Function(GetRecipeLoadingState value)? loading,
    TResult? Function(GetRecipeErrorState value)? error,
    TResult? Function(GetRecipeLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeInitialState value)? initial,
    TResult Function(GetRecipeLoadingState value)? loading,
    TResult Function(GetRecipeErrorState value)? error,
    TResult Function(GetRecipeLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRecipeStateCopyWith<$Res> {
  factory $GetRecipeStateCopyWith(
          GetRecipeState value, $Res Function(GetRecipeState) then) =
      _$GetRecipeStateCopyWithImpl<$Res, GetRecipeState>;
}

/// @nodoc
class _$GetRecipeStateCopyWithImpl<$Res, $Val extends GetRecipeState>
    implements $GetRecipeStateCopyWith<$Res> {
  _$GetRecipeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetRecipeInitialStateImplCopyWith<$Res> {
  factory _$$GetRecipeInitialStateImplCopyWith(
          _$GetRecipeInitialStateImpl value,
          $Res Function(_$GetRecipeInitialStateImpl) then) =
      __$$GetRecipeInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRecipeInitialStateImplCopyWithImpl<$Res>
    extends _$GetRecipeStateCopyWithImpl<$Res, _$GetRecipeInitialStateImpl>
    implements _$$GetRecipeInitialStateImplCopyWith<$Res> {
  __$$GetRecipeInitialStateImplCopyWithImpl(_$GetRecipeInitialStateImpl _value,
      $Res Function(_$GetRecipeInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetRecipeInitialStateImpl implements GetRecipeInitialState {
  const _$GetRecipeInitialStateImpl();

  @override
  String toString() {
    return 'GetRecipeState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecipeInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GenericFood food) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GenericFood food)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GenericFood food)? loaded,
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
    required TResult Function(GetRecipeInitialState value) initial,
    required TResult Function(GetRecipeLoadingState value) loading,
    required TResult Function(GetRecipeErrorState value) error,
    required TResult Function(GetRecipeLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeInitialState value)? initial,
    TResult? Function(GetRecipeLoadingState value)? loading,
    TResult? Function(GetRecipeErrorState value)? error,
    TResult? Function(GetRecipeLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeInitialState value)? initial,
    TResult Function(GetRecipeLoadingState value)? loading,
    TResult Function(GetRecipeErrorState value)? error,
    TResult Function(GetRecipeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GetRecipeInitialState implements GetRecipeState {
  const factory GetRecipeInitialState() = _$GetRecipeInitialStateImpl;
}

/// @nodoc
abstract class _$$GetRecipeLoadingStateImplCopyWith<$Res> {
  factory _$$GetRecipeLoadingStateImplCopyWith(
          _$GetRecipeLoadingStateImpl value,
          $Res Function(_$GetRecipeLoadingStateImpl) then) =
      __$$GetRecipeLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRecipeLoadingStateImplCopyWithImpl<$Res>
    extends _$GetRecipeStateCopyWithImpl<$Res, _$GetRecipeLoadingStateImpl>
    implements _$$GetRecipeLoadingStateImplCopyWith<$Res> {
  __$$GetRecipeLoadingStateImplCopyWithImpl(_$GetRecipeLoadingStateImpl _value,
      $Res Function(_$GetRecipeLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetRecipeLoadingStateImpl implements GetRecipeLoadingState {
  const _$GetRecipeLoadingStateImpl();

  @override
  String toString() {
    return 'GetRecipeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecipeLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GenericFood food) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GenericFood food)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GenericFood food)? loaded,
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
    required TResult Function(GetRecipeInitialState value) initial,
    required TResult Function(GetRecipeLoadingState value) loading,
    required TResult Function(GetRecipeErrorState value) error,
    required TResult Function(GetRecipeLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeInitialState value)? initial,
    TResult? Function(GetRecipeLoadingState value)? loading,
    TResult? Function(GetRecipeErrorState value)? error,
    TResult? Function(GetRecipeLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeInitialState value)? initial,
    TResult Function(GetRecipeLoadingState value)? loading,
    TResult Function(GetRecipeErrorState value)? error,
    TResult Function(GetRecipeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GetRecipeLoadingState implements GetRecipeState {
  const factory GetRecipeLoadingState() = _$GetRecipeLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetRecipeErrorStateImplCopyWith<$Res> {
  factory _$$GetRecipeErrorStateImplCopyWith(_$GetRecipeErrorStateImpl value,
          $Res Function(_$GetRecipeErrorStateImpl) then) =
      __$$GetRecipeErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GetRecipeErrorStateImplCopyWithImpl<$Res>
    extends _$GetRecipeStateCopyWithImpl<$Res, _$GetRecipeErrorStateImpl>
    implements _$$GetRecipeErrorStateImplCopyWith<$Res> {
  __$$GetRecipeErrorStateImplCopyWithImpl(_$GetRecipeErrorStateImpl _value,
      $Res Function(_$GetRecipeErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GetRecipeErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRecipeErrorStateImpl implements GetRecipeErrorState {
  const _$GetRecipeErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GetRecipeState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecipeErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRecipeErrorStateImplCopyWith<_$GetRecipeErrorStateImpl> get copyWith =>
      __$$GetRecipeErrorStateImplCopyWithImpl<_$GetRecipeErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GenericFood food) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GenericFood food)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GenericFood food)? loaded,
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
    required TResult Function(GetRecipeInitialState value) initial,
    required TResult Function(GetRecipeLoadingState value) loading,
    required TResult Function(GetRecipeErrorState value) error,
    required TResult Function(GetRecipeLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeInitialState value)? initial,
    TResult? Function(GetRecipeLoadingState value)? loading,
    TResult? Function(GetRecipeErrorState value)? error,
    TResult? Function(GetRecipeLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeInitialState value)? initial,
    TResult Function(GetRecipeLoadingState value)? loading,
    TResult Function(GetRecipeErrorState value)? error,
    TResult Function(GetRecipeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetRecipeErrorState implements GetRecipeState {
  const factory GetRecipeErrorState(final String message) =
      _$GetRecipeErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$GetRecipeErrorStateImplCopyWith<_$GetRecipeErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRecipeLoadedStateImplCopyWith<$Res> {
  factory _$$GetRecipeLoadedStateImplCopyWith(_$GetRecipeLoadedStateImpl value,
          $Res Function(_$GetRecipeLoadedStateImpl) then) =
      __$$GetRecipeLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GenericFood food});

  $GenericFoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$GetRecipeLoadedStateImplCopyWithImpl<$Res>
    extends _$GetRecipeStateCopyWithImpl<$Res, _$GetRecipeLoadedStateImpl>
    implements _$$GetRecipeLoadedStateImplCopyWith<$Res> {
  __$$GetRecipeLoadedStateImplCopyWithImpl(_$GetRecipeLoadedStateImpl _value,
      $Res Function(_$GetRecipeLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$GetRecipeLoadedStateImpl(
      food: null == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as GenericFood,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GenericFoodCopyWith<$Res> get food {
    return $GenericFoodCopyWith<$Res>(_value.food, (value) {
      return _then(_value.copyWith(food: value));
    });
  }
}

/// @nodoc

class _$GetRecipeLoadedStateImpl implements GetRecipeLoadedState {
  const _$GetRecipeLoadedStateImpl({required this.food});

  @override
  final GenericFood food;

  @override
  String toString() {
    return 'GetRecipeState.loaded(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecipeLoadedStateImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRecipeLoadedStateImplCopyWith<_$GetRecipeLoadedStateImpl>
      get copyWith =>
          __$$GetRecipeLoadedStateImplCopyWithImpl<_$GetRecipeLoadedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(GenericFood food) loaded,
  }) {
    return loaded(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(GenericFood food)? loaded,
  }) {
    return loaded?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(GenericFood food)? loaded,
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
    required TResult Function(GetRecipeInitialState value) initial,
    required TResult Function(GetRecipeLoadingState value) loading,
    required TResult Function(GetRecipeErrorState value) error,
    required TResult Function(GetRecipeLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipeInitialState value)? initial,
    TResult? Function(GetRecipeLoadingState value)? loading,
    TResult? Function(GetRecipeErrorState value)? error,
    TResult? Function(GetRecipeLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipeInitialState value)? initial,
    TResult Function(GetRecipeLoadingState value)? loading,
    TResult Function(GetRecipeErrorState value)? error,
    TResult Function(GetRecipeLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GetRecipeLoadedState implements GetRecipeState {
  const factory GetRecipeLoadedState({required final GenericFood food}) =
      _$GetRecipeLoadedStateImpl;

  GenericFood get food;
  @JsonKey(ignore: true)
  _$$GetRecipeLoadedStateImplCopyWith<_$GetRecipeLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
