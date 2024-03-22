// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remove_from_cook_book_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RemoveFromMyCookBookEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onRemoveFromMyCookBook,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onRemoveFromMyCookBook,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onRemoveFromMyCookBook,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveFoodFromMyCookBook value)
        onRemoveFromMyCookBook,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFoodFromMyCookBook value)? onRemoveFromMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFoodFromMyCookBook value)? onRemoveFromMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFromMyCookBookEventCopyWith<$Res> {
  factory $RemoveFromMyCookBookEventCopyWith(RemoveFromMyCookBookEvent value,
          $Res Function(RemoveFromMyCookBookEvent) then) =
      _$RemoveFromMyCookBookEventCopyWithImpl<$Res, RemoveFromMyCookBookEvent>;
}

/// @nodoc
class _$RemoveFromMyCookBookEventCopyWithImpl<$Res,
        $Val extends RemoveFromMyCookBookEvent>
    implements $RemoveFromMyCookBookEventCopyWith<$Res> {
  _$RemoveFromMyCookBookEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RemoveFoodFromMyCookBookImplCopyWith<$Res> {
  factory _$$RemoveFoodFromMyCookBookImplCopyWith(
          _$RemoveFoodFromMyCookBookImpl value,
          $Res Function(_$RemoveFoodFromMyCookBookImpl) then) =
      __$$RemoveFoodFromMyCookBookImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$RemoveFoodFromMyCookBookImplCopyWithImpl<$Res>
    extends _$RemoveFromMyCookBookEventCopyWithImpl<$Res,
        _$RemoveFoodFromMyCookBookImpl>
    implements _$$RemoveFoodFromMyCookBookImplCopyWith<$Res> {
  __$$RemoveFoodFromMyCookBookImplCopyWithImpl(
      _$RemoveFoodFromMyCookBookImpl _value,
      $Res Function(_$RemoveFoodFromMyCookBookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$RemoveFoodFromMyCookBookImpl(
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

class _$RemoveFoodFromMyCookBookImpl implements RemoveFoodFromMyCookBook {
  const _$RemoveFoodFromMyCookBookImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'RemoveFromMyCookBookEvent.onRemoveFromMyCookBook(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFoodFromMyCookBookImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFoodFromMyCookBookImplCopyWith<_$RemoveFoodFromMyCookBookImpl>
      get copyWith => __$$RemoveFoodFromMyCookBookImplCopyWithImpl<
          _$RemoveFoodFromMyCookBookImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Food food) onRemoveFromMyCookBook,
    required TResult Function() onReset,
  }) {
    return onRemoveFromMyCookBook(food);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onRemoveFromMyCookBook,
    TResult? Function()? onReset,
  }) {
    return onRemoveFromMyCookBook?.call(food);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onRemoveFromMyCookBook,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onRemoveFromMyCookBook != null) {
      return onRemoveFromMyCookBook(food);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RemoveFoodFromMyCookBook value)
        onRemoveFromMyCookBook,
    required TResult Function(Reset value) onReset,
  }) {
    return onRemoveFromMyCookBook(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFoodFromMyCookBook value)? onRemoveFromMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) {
    return onRemoveFromMyCookBook?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFoodFromMyCookBook value)? onRemoveFromMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onRemoveFromMyCookBook != null) {
      return onRemoveFromMyCookBook(this);
    }
    return orElse();
  }
}

abstract class RemoveFoodFromMyCookBook implements RemoveFromMyCookBookEvent {
  const factory RemoveFoodFromMyCookBook(final Food food) =
      _$RemoveFoodFromMyCookBookImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$RemoveFoodFromMyCookBookImplCopyWith<_$RemoveFoodFromMyCookBookImpl>
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
    extends _$RemoveFromMyCookBookEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'RemoveFromMyCookBookEvent.onReset()';
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
    required TResult Function(Food food) onRemoveFromMyCookBook,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Food food)? onRemoveFromMyCookBook,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Food food)? onRemoveFromMyCookBook,
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
    required TResult Function(RemoveFoodFromMyCookBook value)
        onRemoveFromMyCookBook,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFoodFromMyCookBook value)? onRemoveFromMyCookBook,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFoodFromMyCookBook value)? onRemoveFromMyCookBook,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements RemoveFromMyCookBookEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$RemoveFromMyCookBookState {
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
    required TResult Function(RemoveFromMyCookBookInitialState value) initial,
    required TResult Function(RemoveFromMyCookBookLoadingState value) loading,
    required TResult Function(RemoveFromMyCookBookErrorState value) error,
    required TResult Function(RemoveFromMyCookBookLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult? Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult? Function(RemoveFromMyCookBookErrorState value)? error,
    TResult? Function(RemoveFromMyCookBookLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult Function(RemoveFromMyCookBookErrorState value)? error,
    TResult Function(RemoveFromMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoveFromMyCookBookStateCopyWith<$Res> {
  factory $RemoveFromMyCookBookStateCopyWith(RemoveFromMyCookBookState value,
          $Res Function(RemoveFromMyCookBookState) then) =
      _$RemoveFromMyCookBookStateCopyWithImpl<$Res, RemoveFromMyCookBookState>;
}

/// @nodoc
class _$RemoveFromMyCookBookStateCopyWithImpl<$Res,
        $Val extends RemoveFromMyCookBookState>
    implements $RemoveFromMyCookBookStateCopyWith<$Res> {
  _$RemoveFromMyCookBookStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RemoveFromMyCookBookInitialStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyCookBookInitialStateImplCopyWith(
          _$RemoveFromMyCookBookInitialStateImpl value,
          $Res Function(_$RemoveFromMyCookBookInitialStateImpl) then) =
      __$$RemoveFromMyCookBookInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveFromMyCookBookInitialStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyCookBookStateCopyWithImpl<$Res,
        _$RemoveFromMyCookBookInitialStateImpl>
    implements _$$RemoveFromMyCookBookInitialStateImplCopyWith<$Res> {
  __$$RemoveFromMyCookBookInitialStateImplCopyWithImpl(
      _$RemoveFromMyCookBookInitialStateImpl _value,
      $Res Function(_$RemoveFromMyCookBookInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveFromMyCookBookInitialStateImpl
    implements RemoveFromMyCookBookInitialState {
  const _$RemoveFromMyCookBookInitialStateImpl();

  @override
  String toString() {
    return 'RemoveFromMyCookBookState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyCookBookInitialStateImpl);
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
    required TResult Function(RemoveFromMyCookBookInitialState value) initial,
    required TResult Function(RemoveFromMyCookBookLoadingState value) loading,
    required TResult Function(RemoveFromMyCookBookErrorState value) error,
    required TResult Function(RemoveFromMyCookBookLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult? Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult? Function(RemoveFromMyCookBookErrorState value)? error,
    TResult? Function(RemoveFromMyCookBookLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult Function(RemoveFromMyCookBookErrorState value)? error,
    TResult Function(RemoveFromMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyCookBookInitialState
    implements RemoveFromMyCookBookState {
  const factory RemoveFromMyCookBookInitialState() =
      _$RemoveFromMyCookBookInitialStateImpl;
}

/// @nodoc
abstract class _$$RemoveFromMyCookBookLoadingStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyCookBookLoadingStateImplCopyWith(
          _$RemoveFromMyCookBookLoadingStateImpl value,
          $Res Function(_$RemoveFromMyCookBookLoadingStateImpl) then) =
      __$$RemoveFromMyCookBookLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RemoveFromMyCookBookLoadingStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyCookBookStateCopyWithImpl<$Res,
        _$RemoveFromMyCookBookLoadingStateImpl>
    implements _$$RemoveFromMyCookBookLoadingStateImplCopyWith<$Res> {
  __$$RemoveFromMyCookBookLoadingStateImplCopyWithImpl(
      _$RemoveFromMyCookBookLoadingStateImpl _value,
      $Res Function(_$RemoveFromMyCookBookLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RemoveFromMyCookBookLoadingStateImpl
    implements RemoveFromMyCookBookLoadingState {
  const _$RemoveFromMyCookBookLoadingStateImpl();

  @override
  String toString() {
    return 'RemoveFromMyCookBookState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyCookBookLoadingStateImpl);
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
    required TResult Function(RemoveFromMyCookBookInitialState value) initial,
    required TResult Function(RemoveFromMyCookBookLoadingState value) loading,
    required TResult Function(RemoveFromMyCookBookErrorState value) error,
    required TResult Function(RemoveFromMyCookBookLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult? Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult? Function(RemoveFromMyCookBookErrorState value)? error,
    TResult? Function(RemoveFromMyCookBookLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult Function(RemoveFromMyCookBookErrorState value)? error,
    TResult Function(RemoveFromMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyCookBookLoadingState
    implements RemoveFromMyCookBookState {
  const factory RemoveFromMyCookBookLoadingState() =
      _$RemoveFromMyCookBookLoadingStateImpl;
}

/// @nodoc
abstract class _$$RemoveFromMyCookBookErrorStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyCookBookErrorStateImplCopyWith(
          _$RemoveFromMyCookBookErrorStateImpl value,
          $Res Function(_$RemoveFromMyCookBookErrorStateImpl) then) =
      __$$RemoveFromMyCookBookErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RemoveFromMyCookBookErrorStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyCookBookStateCopyWithImpl<$Res,
        _$RemoveFromMyCookBookErrorStateImpl>
    implements _$$RemoveFromMyCookBookErrorStateImplCopyWith<$Res> {
  __$$RemoveFromMyCookBookErrorStateImplCopyWithImpl(
      _$RemoveFromMyCookBookErrorStateImpl _value,
      $Res Function(_$RemoveFromMyCookBookErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RemoveFromMyCookBookErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromMyCookBookErrorStateImpl
    implements RemoveFromMyCookBookErrorState {
  const _$RemoveFromMyCookBookErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RemoveFromMyCookBookState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyCookBookErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromMyCookBookErrorStateImplCopyWith<
          _$RemoveFromMyCookBookErrorStateImpl>
      get copyWith => __$$RemoveFromMyCookBookErrorStateImplCopyWithImpl<
          _$RemoveFromMyCookBookErrorStateImpl>(this, _$identity);

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
    required TResult Function(RemoveFromMyCookBookInitialState value) initial,
    required TResult Function(RemoveFromMyCookBookLoadingState value) loading,
    required TResult Function(RemoveFromMyCookBookErrorState value) error,
    required TResult Function(RemoveFromMyCookBookLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult? Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult? Function(RemoveFromMyCookBookErrorState value)? error,
    TResult? Function(RemoveFromMyCookBookLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult Function(RemoveFromMyCookBookErrorState value)? error,
    TResult Function(RemoveFromMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyCookBookErrorState
    implements RemoveFromMyCookBookState {
  const factory RemoveFromMyCookBookErrorState(final String message) =
      _$RemoveFromMyCookBookErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RemoveFromMyCookBookErrorStateImplCopyWith<
          _$RemoveFromMyCookBookErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromMyCookBookLoadedStateImplCopyWith<$Res> {
  factory _$$RemoveFromMyCookBookLoadedStateImplCopyWith(
          _$RemoveFromMyCookBookLoadedStateImpl value,
          $Res Function(_$RemoveFromMyCookBookLoadedStateImpl) then) =
      __$$RemoveFromMyCookBookLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Food food});

  $FoodCopyWith<$Res> get food;
}

/// @nodoc
class __$$RemoveFromMyCookBookLoadedStateImplCopyWithImpl<$Res>
    extends _$RemoveFromMyCookBookStateCopyWithImpl<$Res,
        _$RemoveFromMyCookBookLoadedStateImpl>
    implements _$$RemoveFromMyCookBookLoadedStateImplCopyWith<$Res> {
  __$$RemoveFromMyCookBookLoadedStateImplCopyWithImpl(
      _$RemoveFromMyCookBookLoadedStateImpl _value,
      $Res Function(_$RemoveFromMyCookBookLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = null,
  }) {
    return _then(_$RemoveFromMyCookBookLoadedStateImpl(
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

class _$RemoveFromMyCookBookLoadedStateImpl
    implements RemoveFromMyCookBookLoadedState {
  const _$RemoveFromMyCookBookLoadedStateImpl(this.food);

  @override
  final Food food;

  @override
  String toString() {
    return 'RemoveFromMyCookBookState.loaded(food: $food)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromMyCookBookLoadedStateImpl &&
            (identical(other.food, food) || other.food == food));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromMyCookBookLoadedStateImplCopyWith<
          _$RemoveFromMyCookBookLoadedStateImpl>
      get copyWith => __$$RemoveFromMyCookBookLoadedStateImplCopyWithImpl<
          _$RemoveFromMyCookBookLoadedStateImpl>(this, _$identity);

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
    required TResult Function(RemoveFromMyCookBookInitialState value) initial,
    required TResult Function(RemoveFromMyCookBookLoadingState value) loading,
    required TResult Function(RemoveFromMyCookBookErrorState value) error,
    required TResult Function(RemoveFromMyCookBookLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult? Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult? Function(RemoveFromMyCookBookErrorState value)? error,
    TResult? Function(RemoveFromMyCookBookLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RemoveFromMyCookBookInitialState value)? initial,
    TResult Function(RemoveFromMyCookBookLoadingState value)? loading,
    TResult Function(RemoveFromMyCookBookErrorState value)? error,
    TResult Function(RemoveFromMyCookBookLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RemoveFromMyCookBookLoadedState
    implements RemoveFromMyCookBookState {
  const factory RemoveFromMyCookBookLoadedState(final Food food) =
      _$RemoveFromMyCookBookLoadedStateImpl;

  Food get food;
  @JsonKey(ignore: true)
  _$$RemoveFromMyCookBookLoadedStateImplCopyWith<
          _$RemoveFromMyCookBookLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
