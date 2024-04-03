// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipes_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RecipesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onGetGroceries,
    required TResult Function() onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetGroceries,
    TResult? Function()? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetGroceries,
    TResult Function()? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecipesEvent value) onGetGroceries,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipesEvent value)? onGetGroceries,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipesEvent value)? onGetGroceries,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipesEventCopyWith<$Res> {
  factory $RecipesEventCopyWith(
          RecipesEvent value, $Res Function(RecipesEvent) then) =
      _$RecipesEventCopyWithImpl<$Res, RecipesEvent>;
}

/// @nodoc
class _$RecipesEventCopyWithImpl<$Res, $Val extends RecipesEvent>
    implements $RecipesEventCopyWith<$Res> {
  _$RecipesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetRecipesEventImplCopyWith<$Res> {
  factory _$$GetRecipesEventImplCopyWith(_$GetRecipesEventImpl value,
          $Res Function(_$GetRecipesEventImpl) then) =
      __$$GetRecipesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetRecipesEventImplCopyWithImpl<$Res>
    extends _$RecipesEventCopyWithImpl<$Res, _$GetRecipesEventImpl>
    implements _$$GetRecipesEventImplCopyWith<$Res> {
  __$$GetRecipesEventImplCopyWithImpl(
      _$GetRecipesEventImpl _value, $Res Function(_$GetRecipesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetRecipesEventImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetRecipesEventImpl implements GetRecipesEvent {
  const _$GetRecipesEventImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'RecipesEvent.onGetGroceries(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRecipesEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRecipesEventImplCopyWith<_$GetRecipesEventImpl> get copyWith =>
      __$$GetRecipesEventImplCopyWithImpl<_$GetRecipesEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) onGetGroceries,
    required TResult Function() onReset,
  }) {
    return onGetGroceries(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetGroceries,
    TResult? Function()? onReset,
  }) {
    return onGetGroceries?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetGroceries,
    TResult Function()? onReset,
    required TResult orElse(),
  }) {
    if (onGetGroceries != null) {
      return onGetGroceries(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetRecipesEvent value) onGetGroceries,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetGroceries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipesEvent value)? onGetGroceries,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetGroceries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipesEvent value)? onGetGroceries,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetGroceries != null) {
      return onGetGroceries(this);
    }
    return orElse();
  }
}

abstract class GetRecipesEvent implements RecipesEvent {
  const factory GetRecipesEvent(final String query) = _$GetRecipesEventImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetRecipesEventImplCopyWith<_$GetRecipesEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetImplCopyWith<$Res> {
  factory _$$ResetImplCopyWith(
          _$ResetImpl value, $Res Function(_$ResetImpl) then) =
      __$$ResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetImplCopyWithImpl<$Res>
    extends _$RecipesEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'RecipesEvent.onReset()';
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
    required TResult Function(String query) onGetGroceries,
    required TResult Function() onReset,
  }) {
    return onReset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? onGetGroceries,
    TResult? Function()? onReset,
  }) {
    return onReset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? onGetGroceries,
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
    required TResult Function(GetRecipesEvent value) onGetGroceries,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetRecipesEvent value)? onGetGroceries,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetRecipesEvent value)? onGetGroceries,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements RecipesEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$RecipesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GenericFood> foods) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GenericFood> foods)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GenericFood> foods)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RecipesInitialState value) initial,
    required TResult Function(RecipesLoadingState value) loading,
    required TResult Function(RecipesErrorState value) error,
    required TResult Function(RecipesLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecipesInitialState value)? initial,
    TResult? Function(RecipesLoadingState value)? loading,
    TResult? Function(RecipesErrorState value)? error,
    TResult? Function(RecipesLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecipesInitialState value)? initial,
    TResult Function(RecipesLoadingState value)? loading,
    TResult Function(RecipesErrorState value)? error,
    TResult Function(RecipesLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipesStateCopyWith<$Res> {
  factory $RecipesStateCopyWith(
          RecipesState value, $Res Function(RecipesState) then) =
      _$RecipesStateCopyWithImpl<$Res, RecipesState>;
}

/// @nodoc
class _$RecipesStateCopyWithImpl<$Res, $Val extends RecipesState>
    implements $RecipesStateCopyWith<$Res> {
  _$RecipesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RecipesInitialStateImplCopyWith<$Res> {
  factory _$$RecipesInitialStateImplCopyWith(_$RecipesInitialStateImpl value,
          $Res Function(_$RecipesInitialStateImpl) then) =
      __$$RecipesInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecipesInitialStateImplCopyWithImpl<$Res>
    extends _$RecipesStateCopyWithImpl<$Res, _$RecipesInitialStateImpl>
    implements _$$RecipesInitialStateImplCopyWith<$Res> {
  __$$RecipesInitialStateImplCopyWithImpl(_$RecipesInitialStateImpl _value,
      $Res Function(_$RecipesInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RecipesInitialStateImpl implements RecipesInitialState {
  const _$RecipesInitialStateImpl();

  @override
  String toString() {
    return 'RecipesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipesInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GenericFood> foods) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GenericFood> foods)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GenericFood> foods)? loaded,
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
    required TResult Function(RecipesInitialState value) initial,
    required TResult Function(RecipesLoadingState value) loading,
    required TResult Function(RecipesErrorState value) error,
    required TResult Function(RecipesLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecipesInitialState value)? initial,
    TResult? Function(RecipesLoadingState value)? loading,
    TResult? Function(RecipesErrorState value)? error,
    TResult? Function(RecipesLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecipesInitialState value)? initial,
    TResult Function(RecipesLoadingState value)? loading,
    TResult Function(RecipesErrorState value)? error,
    TResult Function(RecipesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RecipesInitialState implements RecipesState {
  const factory RecipesInitialState() = _$RecipesInitialStateImpl;
}

/// @nodoc
abstract class _$$RecipesLoadingStateImplCopyWith<$Res> {
  factory _$$RecipesLoadingStateImplCopyWith(_$RecipesLoadingStateImpl value,
          $Res Function(_$RecipesLoadingStateImpl) then) =
      __$$RecipesLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecipesLoadingStateImplCopyWithImpl<$Res>
    extends _$RecipesStateCopyWithImpl<$Res, _$RecipesLoadingStateImpl>
    implements _$$RecipesLoadingStateImplCopyWith<$Res> {
  __$$RecipesLoadingStateImplCopyWithImpl(_$RecipesLoadingStateImpl _value,
      $Res Function(_$RecipesLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RecipesLoadingStateImpl implements RecipesLoadingState {
  const _$RecipesLoadingStateImpl();

  @override
  String toString() {
    return 'RecipesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipesLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GenericFood> foods) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GenericFood> foods)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GenericFood> foods)? loaded,
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
    required TResult Function(RecipesInitialState value) initial,
    required TResult Function(RecipesLoadingState value) loading,
    required TResult Function(RecipesErrorState value) error,
    required TResult Function(RecipesLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecipesInitialState value)? initial,
    TResult? Function(RecipesLoadingState value)? loading,
    TResult? Function(RecipesErrorState value)? error,
    TResult? Function(RecipesLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecipesInitialState value)? initial,
    TResult Function(RecipesLoadingState value)? loading,
    TResult Function(RecipesErrorState value)? error,
    TResult Function(RecipesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RecipesLoadingState implements RecipesState {
  const factory RecipesLoadingState() = _$RecipesLoadingStateImpl;
}

/// @nodoc
abstract class _$$RecipesErrorStateImplCopyWith<$Res> {
  factory _$$RecipesErrorStateImplCopyWith(_$RecipesErrorStateImpl value,
          $Res Function(_$RecipesErrorStateImpl) then) =
      __$$RecipesErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RecipesErrorStateImplCopyWithImpl<$Res>
    extends _$RecipesStateCopyWithImpl<$Res, _$RecipesErrorStateImpl>
    implements _$$RecipesErrorStateImplCopyWith<$Res> {
  __$$RecipesErrorStateImplCopyWithImpl(_$RecipesErrorStateImpl _value,
      $Res Function(_$RecipesErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RecipesErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RecipesErrorStateImpl implements RecipesErrorState {
  const _$RecipesErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RecipesState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipesErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipesErrorStateImplCopyWith<_$RecipesErrorStateImpl> get copyWith =>
      __$$RecipesErrorStateImplCopyWithImpl<_$RecipesErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GenericFood> foods) loaded,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GenericFood> foods)? loaded,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GenericFood> foods)? loaded,
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
    required TResult Function(RecipesInitialState value) initial,
    required TResult Function(RecipesLoadingState value) loading,
    required TResult Function(RecipesErrorState value) error,
    required TResult Function(RecipesLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecipesInitialState value)? initial,
    TResult? Function(RecipesLoadingState value)? loading,
    TResult? Function(RecipesErrorState value)? error,
    TResult? Function(RecipesLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecipesInitialState value)? initial,
    TResult Function(RecipesLoadingState value)? loading,
    TResult Function(RecipesErrorState value)? error,
    TResult Function(RecipesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class RecipesErrorState implements RecipesState {
  const factory RecipesErrorState(final String message) =
      _$RecipesErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$RecipesErrorStateImplCopyWith<_$RecipesErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecipesLoadedStateImplCopyWith<$Res> {
  factory _$$RecipesLoadedStateImplCopyWith(_$RecipesLoadedStateImpl value,
          $Res Function(_$RecipesLoadedStateImpl) then) =
      __$$RecipesLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GenericFood> foods});
}

/// @nodoc
class __$$RecipesLoadedStateImplCopyWithImpl<$Res>
    extends _$RecipesStateCopyWithImpl<$Res, _$RecipesLoadedStateImpl>
    implements _$$RecipesLoadedStateImplCopyWith<$Res> {
  __$$RecipesLoadedStateImplCopyWithImpl(_$RecipesLoadedStateImpl _value,
      $Res Function(_$RecipesLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$RecipesLoadedStateImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<GenericFood>,
    ));
  }
}

/// @nodoc

class _$RecipesLoadedStateImpl implements RecipesLoadedState {
  const _$RecipesLoadedStateImpl({required final List<GenericFood> foods})
      : _foods = foods;

  final List<GenericFood> _foods;
  @override
  List<GenericFood> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  String toString() {
    return 'RecipesState.loaded(foods: $foods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipesLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipesLoadedStateImplCopyWith<_$RecipesLoadedStateImpl> get copyWith =>
      __$$RecipesLoadedStateImplCopyWithImpl<_$RecipesLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<GenericFood> foods) loaded,
  }) {
    return loaded(foods);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<GenericFood> foods)? loaded,
  }) {
    return loaded?.call(foods);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<GenericFood> foods)? loaded,
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
    required TResult Function(RecipesInitialState value) initial,
    required TResult Function(RecipesLoadingState value) loading,
    required TResult Function(RecipesErrorState value) error,
    required TResult Function(RecipesLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RecipesInitialState value)? initial,
    TResult? Function(RecipesLoadingState value)? loading,
    TResult? Function(RecipesErrorState value)? error,
    TResult? Function(RecipesLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RecipesInitialState value)? initial,
    TResult Function(RecipesLoadingState value)? loading,
    TResult Function(RecipesErrorState value)? error,
    TResult Function(RecipesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RecipesLoadedState implements RecipesState {
  const factory RecipesLoadedState({required final List<GenericFood> foods}) =
      _$RecipesLoadedStateImpl;

  List<GenericFood> get foods;
  @JsonKey(ignore: true)
  _$$RecipesLoadedStateImplCopyWith<_$RecipesLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
