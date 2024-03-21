// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_or_update_my_cook_book_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddOrUpdateMyCookBookEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyCookBook,
    required TResult Function(Food food) onUpdateMyCookBook,
    required TResult Function(Food food) onAddOrUpdateMyCookBook,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyCookBook,
    TResult? Function(Food food)? onUpdateMyCookBook,
    TResult? Function(Food food)? onAddOrUpdateMyCookBook,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyCookBook,
    TResult Function(Food food)? onUpdateMyCookBook,
    TResult Function(Food food)? onAddOrUpdateMyCookBook,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyCookBook value) onAddToMyCookBook,
    required TResult Function(UpdateMyCookBookFood value) onUpdateMyCookBook,
    required TResult Function(AddOrUpdateFoodMyCookBook value)
        onAddOrUpdateMyCookBook,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult? Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult? Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrUpdateMyCookBookEventCopyWith<$Res> {
  factory $AddOrUpdateMyCookBookEventCopyWith(AddOrUpdateMyCookBookEvent value,
          $Res Function(AddOrUpdateMyCookBookEvent) then) =
      _$AddOrUpdateMyCookBookEventCopyWithImpl<$Res,
          AddOrUpdateMyCookBookEvent>;
}

/// @nodoc
class _$AddOrUpdateMyCookBookEventCopyWithImpl<$Res,
        $Val extends AddOrUpdateMyCookBookEvent>
    implements $AddOrUpdateMyCookBookEventCopyWith<$Res> {
  _$AddOrUpdateMyCookBookEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddFoodToMyCookBookImplCopyWith<$Res> {
  factory _$$AddFoodToMyCookBookImplCopyWith(_$AddFoodToMyCookBookImpl value,
          $Res Function(_$AddFoodToMyCookBookImpl) then) =
      __$$AddFoodToMyCookBookImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddFoodToMyCookBookImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyCookBookEventCopyWithImpl<$Res,
        _$AddFoodToMyCookBookImpl>
    implements _$$AddFoodToMyCookBookImplCopyWith<$Res> {
  __$$AddFoodToMyCookBookImplCopyWithImpl(_$AddFoodToMyCookBookImpl _value,
      $Res Function(_$AddFoodToMyCookBookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddFoodToMyCookBookImpl(
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

class _$AddFoodToMyCookBookImpl implements AddFoodToMyCookBook {
  const _$AddFoodToMyCookBookImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyCookBookEvent.onAddToMyCookBook(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddFoodToMyCookBookImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddFoodToMyCookBookImplCopyWith<_$AddFoodToMyCookBookImpl> get copyWith =>
      __$$AddFoodToMyCookBookImplCopyWithImpl<_$AddFoodToMyCookBookImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyCookBook,
    required TResult Function(Food food) onUpdateMyCookBook,
    required TResult Function(Food food) onAddOrUpdateMyCookBook,
    required TResult Function() onReset,
  }) {
    return onAddToMyCookBook(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyCookBook,
    TResult? Function(Food food)? onUpdateMyCookBook,
    TResult? Function(Food food)? onAddOrUpdateMyCookBook,
    TResult? Function()? onReset,
  }) {
    return onAddToMyCookBook?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyCookBook,
    TResult Function(Food food)? onUpdateMyCookBook,
    TResult Function(Food food)? onAddOrUpdateMyCookBook,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onAddToMyCookBook != null) {
      return onAddToMyCookBook(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyCookBook value) onAddToMyCookBook,
    required TResult Function(UpdateMyCookBookFood value) onUpdateMyCookBook,
    required TResult Function(AddOrUpdateFoodMyCookBook value)
        onAddOrUpdateMyCookBook,
    required TResult Function(Reset value) onReset,
  }) {
    return onAddToMyCookBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult? Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult? Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) {
    return onAddToMyCookBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onAddToMyCookBook != null) {
      return onAddToMyCookBook(this);
    }
    return orElse();
  }
}

abstract class AddFoodToMyCookBook implements AddOrUpdateMyCookBookEvent {
  const factory AddFoodToMyCookBook(final Food food) =
      _$AddFoodToMyCookBookImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddFoodToMyCookBookImplCopyWith<_$AddFoodToMyCookBookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateMyCookBookFoodImplCopyWith<$Res> {
  factory _$$UpdateMyCookBookFoodImplCopyWith(_$UpdateMyCookBookFoodImpl value,
          $Res Function(_$UpdateMyCookBookFoodImpl) then) =
      __$$UpdateMyCookBookFoodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$UpdateMyCookBookFoodImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyCookBookEventCopyWithImpl<$Res,
        _$UpdateMyCookBookFoodImpl>
    implements _$$UpdateMyCookBookFoodImplCopyWith<$Res> {
  __$$UpdateMyCookBookFoodImplCopyWithImpl(_$UpdateMyCookBookFoodImpl _value,
      $Res Function(_$UpdateMyCookBookFoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$UpdateMyCookBookFoodImpl(
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

class _$UpdateMyCookBookFoodImpl implements UpdateMyCookBookFood {
  const _$UpdateMyCookBookFoodImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyCookBookEvent.onUpdateMyCookBook(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateMyCookBookFoodImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateMyCookBookFoodImplCopyWith<_$UpdateMyCookBookFoodImpl>
      get copyWith =>
          __$$UpdateMyCookBookFoodImplCopyWithImpl<_$UpdateMyCookBookFoodImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyCookBook,
    required TResult Function(Food food) onUpdateMyCookBook,
    required TResult Function(Food food) onAddOrUpdateMyCookBook,
    required TResult Function() onReset,
  }) {
    return onUpdateMyCookBook(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyCookBook,
    TResult? Function(Food food)? onUpdateMyCookBook,
    TResult? Function(Food food)? onAddOrUpdateMyCookBook,
    TResult? Function()? onReset,
  }) {
    return onUpdateMyCookBook?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyCookBook,
    TResult Function(Food food)? onUpdateMyCookBook,
    TResult Function(Food food)? onAddOrUpdateMyCookBook,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onUpdateMyCookBook != null) {
      return onUpdateMyCookBook(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyCookBook value) onAddToMyCookBook,
    required TResult Function(UpdateMyCookBookFood value) onUpdateMyCookBook,
    required TResult Function(AddOrUpdateFoodMyCookBook value)
        onAddOrUpdateMyCookBook,
    required TResult Function(Reset value) onReset,
  }) {
    return onUpdateMyCookBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult? Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult? Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) {
    return onUpdateMyCookBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onUpdateMyCookBook != null) {
      return onUpdateMyCookBook(this);
    }
    return orElse();
  }
}

abstract class UpdateMyCookBookFood implements AddOrUpdateMyCookBookEvent {
  const factory UpdateMyCookBookFood(final Food food) =
      _$UpdateMyCookBookFoodImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$UpdateMyCookBookFoodImplCopyWith<_$UpdateMyCookBookFoodImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrUpdateFoodMyCookBookImplCopyWith<$Res> {
  factory _$$AddOrUpdateFoodMyCookBookImplCopyWith(
          _$AddOrUpdateFoodMyCookBookImpl value,
          $Res Function(_$AddOrUpdateFoodMyCookBookImpl) then) =
      __$$AddOrUpdateFoodMyCookBookImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddOrUpdateFoodMyCookBookImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyCookBookEventCopyWithImpl<$Res,
        _$AddOrUpdateFoodMyCookBookImpl>
    implements _$$AddOrUpdateFoodMyCookBookImplCopyWith<$Res> {
  __$$AddOrUpdateFoodMyCookBookImplCopyWithImpl(
      _$AddOrUpdateFoodMyCookBookImpl _value,
      $Res Function(_$AddOrUpdateFoodMyCookBookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddOrUpdateFoodMyCookBookImpl(
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

class _$AddOrUpdateFoodMyCookBookImpl implements AddOrUpdateFoodMyCookBook {
  const _$AddOrUpdateFoodMyCookBookImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyCookBookEvent.onAddOrUpdateMyCookBook(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateFoodMyCookBookImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateFoodMyCookBookImplCopyWith<_$AddOrUpdateFoodMyCookBookImpl>
      get copyWith => __$$AddOrUpdateFoodMyCookBookImplCopyWithImpl<
          _$AddOrUpdateFoodMyCookBookImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onAddToMyCookBook,
    required TResult Function(Food food) onUpdateMyCookBook,
    required TResult Function(Food food) onAddOrUpdateMyCookBook,
    required TResult Function() onReset,
  }) {
    return onAddOrUpdateMyCookBook(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyCookBook,
    TResult? Function(Food food)? onUpdateMyCookBook,
    TResult? Function(Food food)? onAddOrUpdateMyCookBook,
    TResult? Function()? onReset,
  }) {
    return onAddOrUpdateMyCookBook?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyCookBook,
    TResult Function(Food food)? onUpdateMyCookBook,
    TResult Function(Food food)? onAddOrUpdateMyCookBook,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onAddOrUpdateMyCookBook != null) {
      return onAddOrUpdateMyCookBook(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddFoodToMyCookBook value) onAddToMyCookBook,
    required TResult Function(UpdateMyCookBookFood value) onUpdateMyCookBook,
    required TResult Function(AddOrUpdateFoodMyCookBook value)
        onAddOrUpdateMyCookBook,
    required TResult Function(Reset value) onReset,
  }) {
    return onAddOrUpdateMyCookBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult? Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult? Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) {
    return onAddOrUpdateMyCookBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onAddOrUpdateMyCookBook != null) {
      return onAddOrUpdateMyCookBook(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateFoodMyCookBook implements AddOrUpdateMyCookBookEvent {
  const factory AddOrUpdateFoodMyCookBook(final Food food) =
      _$AddOrUpdateFoodMyCookBookImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddOrUpdateFoodMyCookBookImplCopyWith<_$AddOrUpdateFoodMyCookBookImpl>
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
    extends _$AddOrUpdateMyCookBookEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'AddOrUpdateMyCookBookEvent.onReset()';
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
    required TResult Function(Food food) onAddToMyCookBook,
    required TResult Function(Food food) onUpdateMyCookBook,
    required TResult Function(Food food) onAddOrUpdateMyCookBook,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onAddToMyCookBook,
    TResult? Function(Food food)? onUpdateMyCookBook,
    TResult? Function(Food food)? onAddOrUpdateMyCookBook,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onAddToMyCookBook,
    TResult Function(Food food)? onUpdateMyCookBook,
    TResult Function(Food food)? onAddOrUpdateMyCookBook,
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
    required TResult Function(AddFoodToMyCookBook value) onAddToMyCookBook,
    required TResult Function(UpdateMyCookBookFood value) onUpdateMyCookBook,
    required TResult Function(AddOrUpdateFoodMyCookBook value)
        onAddOrUpdateMyCookBook,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult? Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult? Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddFoodToMyCookBook value)? onAddToMyCookBook,
    TResult Function(UpdateMyCookBookFood value)? onUpdateMyCookBook,
    TResult Function(AddOrUpdateFoodMyCookBook value)? onAddOrUpdateMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements AddOrUpdateMyCookBookEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$AddOrUpdateMyCookBookState {
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
    required TResult Function(AddOrUpdateMyCookBookInitialState value) initial,
    required TResult Function(AddOrUpdateMyCookBookLoadingState value) loading,
    required TResult Function(AddOrUpdateMyCookBookErrorState value) error,
    required TResult Function(AddOrUpdateMyCookBookLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult? Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult? Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddOrUpdateMyCookBookStateCopyWith<$Res> {
  factory $AddOrUpdateMyCookBookStateCopyWith(AddOrUpdateMyCookBookState value,
          $Res Function(AddOrUpdateMyCookBookState) then) =
      _$AddOrUpdateMyCookBookStateCopyWithImpl<$Res,
          AddOrUpdateMyCookBookState>;
}

/// @nodoc
class _$AddOrUpdateMyCookBookStateCopyWithImpl<$Res,
        $Val extends AddOrUpdateMyCookBookState>
    implements $AddOrUpdateMyCookBookStateCopyWith<$Res> {
  _$AddOrUpdateMyCookBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddOrUpdateMyCookBookInitialStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyCookBookInitialStateImplCopyWith(
          _$AddOrUpdateMyCookBookInitialStateImpl value,
          $Res Function(_$AddOrUpdateMyCookBookInitialStateImpl) then) =
      __$$AddOrUpdateMyCookBookInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddOrUpdateMyCookBookInitialStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyCookBookStateCopyWithImpl<$Res,
        _$AddOrUpdateMyCookBookInitialStateImpl>
    implements _$$AddOrUpdateMyCookBookInitialStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyCookBookInitialStateImplCopyWithImpl(
      _$AddOrUpdateMyCookBookInitialStateImpl _value,
      $Res Function(_$AddOrUpdateMyCookBookInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddOrUpdateMyCookBookInitialStateImpl
    implements AddOrUpdateMyCookBookInitialState {
  const _$AddOrUpdateMyCookBookInitialStateImpl();

  @override
  String toString() {
    return 'AddOrUpdateMyCookBookState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyCookBookInitialStateImpl);
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
    required TResult Function(AddOrUpdateMyCookBookInitialState value) initial,
    required TResult Function(AddOrUpdateMyCookBookLoadingState value) loading,
    required TResult Function(AddOrUpdateMyCookBookErrorState value) error,
    required TResult Function(AddOrUpdateMyCookBookLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult? Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult? Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyCookBookInitialState
    implements AddOrUpdateMyCookBookState {
  const factory AddOrUpdateMyCookBookInitialState() =
      _$AddOrUpdateMyCookBookInitialStateImpl;
}

/// @nodoc
abstract class _$$AddOrUpdateMyCookBookLoadingStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyCookBookLoadingStateImplCopyWith(
          _$AddOrUpdateMyCookBookLoadingStateImpl value,
          $Res Function(_$AddOrUpdateMyCookBookLoadingStateImpl) then) =
      __$$AddOrUpdateMyCookBookLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddOrUpdateMyCookBookLoadingStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyCookBookStateCopyWithImpl<$Res,
        _$AddOrUpdateMyCookBookLoadingStateImpl>
    implements _$$AddOrUpdateMyCookBookLoadingStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyCookBookLoadingStateImplCopyWithImpl(
      _$AddOrUpdateMyCookBookLoadingStateImpl _value,
      $Res Function(_$AddOrUpdateMyCookBookLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddOrUpdateMyCookBookLoadingStateImpl
    implements AddOrUpdateMyCookBookLoadingState {
  const _$AddOrUpdateMyCookBookLoadingStateImpl();

  @override
  String toString() {
    return 'AddOrUpdateMyCookBookState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyCookBookLoadingStateImpl);
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
    required TResult Function(AddOrUpdateMyCookBookInitialState value) initial,
    required TResult Function(AddOrUpdateMyCookBookLoadingState value) loading,
    required TResult Function(AddOrUpdateMyCookBookErrorState value) error,
    required TResult Function(AddOrUpdateMyCookBookLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult? Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult? Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyCookBookLoadingState
    implements AddOrUpdateMyCookBookState {
  const factory AddOrUpdateMyCookBookLoadingState() =
      _$AddOrUpdateMyCookBookLoadingStateImpl;
}

/// @nodoc
abstract class _$$AddOrUpdateMyCookBookErrorStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyCookBookErrorStateImplCopyWith(
          _$AddOrUpdateMyCookBookErrorStateImpl value,
          $Res Function(_$AddOrUpdateMyCookBookErrorStateImpl) then) =
      __$$AddOrUpdateMyCookBookErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddOrUpdateMyCookBookErrorStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyCookBookStateCopyWithImpl<$Res,
        _$AddOrUpdateMyCookBookErrorStateImpl>
    implements _$$AddOrUpdateMyCookBookErrorStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyCookBookErrorStateImplCopyWithImpl(
      _$AddOrUpdateMyCookBookErrorStateImpl _value,
      $Res Function(_$AddOrUpdateMyCookBookErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$AddOrUpdateMyCookBookErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddOrUpdateMyCookBookErrorStateImpl
    implements AddOrUpdateMyCookBookErrorState {
  const _$AddOrUpdateMyCookBookErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AddOrUpdateMyCookBookState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyCookBookErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateMyCookBookErrorStateImplCopyWith<
          _$AddOrUpdateMyCookBookErrorStateImpl>
      get copyWith => __$$AddOrUpdateMyCookBookErrorStateImplCopyWithImpl<
          _$AddOrUpdateMyCookBookErrorStateImpl>(this, _$identity);

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
    required TResult Function(AddOrUpdateMyCookBookInitialState value) initial,
    required TResult Function(AddOrUpdateMyCookBookLoadingState value) loading,
    required TResult Function(AddOrUpdateMyCookBookErrorState value) error,
    required TResult Function(AddOrUpdateMyCookBookLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult? Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult? Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyCookBookErrorState
    implements AddOrUpdateMyCookBookState {
  const factory AddOrUpdateMyCookBookErrorState(final String message) =
      _$AddOrUpdateMyCookBookErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$AddOrUpdateMyCookBookErrorStateImplCopyWith<
          _$AddOrUpdateMyCookBookErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddOrUpdateMyCookBookLoadedStateImplCopyWith<$Res> {
  factory _$$AddOrUpdateMyCookBookLoadedStateImplCopyWith(
          _$AddOrUpdateMyCookBookLoadedStateImpl value,
          $Res Function(_$AddOrUpdateMyCookBookLoadedStateImpl) then) =
      __$$AddOrUpdateMyCookBookLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$AddOrUpdateMyCookBookLoadedStateImplCopyWithImpl<$Res>
    extends _$AddOrUpdateMyCookBookStateCopyWithImpl<$Res,
        _$AddOrUpdateMyCookBookLoadedStateImpl>
    implements _$$AddOrUpdateMyCookBookLoadedStateImplCopyWith<$Res> {
  __$$AddOrUpdateMyCookBookLoadedStateImplCopyWithImpl(
      _$AddOrUpdateMyCookBookLoadedStateImpl _value,
      $Res Function(_$AddOrUpdateMyCookBookLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$AddOrUpdateMyCookBookLoadedStateImpl(
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

class _$AddOrUpdateMyCookBookLoadedStateImpl
    implements AddOrUpdateMyCookBookLoadedState {
  const _$AddOrUpdateMyCookBookLoadedStateImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'AddOrUpdateMyCookBookState.loaded(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddOrUpdateMyCookBookLoadedStateImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddOrUpdateMyCookBookLoadedStateImplCopyWith<
          _$AddOrUpdateMyCookBookLoadedStateImpl>
      get copyWith => __$$AddOrUpdateMyCookBookLoadedStateImplCopyWithImpl<
          _$AddOrUpdateMyCookBookLoadedStateImpl>(this, _$identity);

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
    required TResult Function(AddOrUpdateMyCookBookInitialState value) initial,
    required TResult Function(AddOrUpdateMyCookBookLoadingState value) loading,
    required TResult Function(AddOrUpdateMyCookBookErrorState value) error,
    required TResult Function(AddOrUpdateMyCookBookLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult? Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult? Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult? Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddOrUpdateMyCookBookInitialState value)? initial,
    TResult Function(AddOrUpdateMyCookBookLoadingState value)? loading,
    TResult Function(AddOrUpdateMyCookBookErrorState value)? error,
    TResult Function(AddOrUpdateMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AddOrUpdateMyCookBookLoadedState
    implements AddOrUpdateMyCookBookState {
  const factory AddOrUpdateMyCookBookLoadedState(final Food food) =
      _$AddOrUpdateMyCookBookLoadedStateImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$AddOrUpdateMyCookBookLoadedStateImplCopyWith<
          _$AddOrUpdateMyCookBookLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
