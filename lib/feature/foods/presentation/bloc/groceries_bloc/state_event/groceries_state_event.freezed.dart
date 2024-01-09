// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'groceries_state_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GroceriesEvent {
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
    required TResult Function(GetGroceriesEvent value) onGetGroceries,
    required TResult Function(Reset value) onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetGroceriesEvent value)? onGetGroceries,
    TResult? Function(Reset value)? onReset,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetGroceriesEvent value)? onGetGroceries,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceriesEventCopyWith<$Res> {
  factory $GroceriesEventCopyWith(
          GroceriesEvent value, $Res Function(GroceriesEvent) then) =
      _$GroceriesEventCopyWithImpl<$Res, GroceriesEvent>;
}

/// @nodoc
class _$GroceriesEventCopyWithImpl<$Res, $Val extends GroceriesEvent>
    implements $GroceriesEventCopyWith<$Res> {
  _$GroceriesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetGroceriesEventImplCopyWith<$Res> {
  factory _$$GetGroceriesEventImplCopyWith(_$GetGroceriesEventImpl value,
          $Res Function(_$GetGroceriesEventImpl) then) =
      __$$GetGroceriesEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetGroceriesEventImplCopyWithImpl<$Res>
    extends _$GroceriesEventCopyWithImpl<$Res, _$GetGroceriesEventImpl>
    implements _$$GetGroceriesEventImplCopyWith<$Res> {
  __$$GetGroceriesEventImplCopyWithImpl(_$GetGroceriesEventImpl _value,
      $Res Function(_$GetGroceriesEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetGroceriesEventImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetGroceriesEventImpl implements GetGroceriesEvent {
  const _$GetGroceriesEventImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'GroceriesEvent.onGetGroceries(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetGroceriesEventImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetGroceriesEventImplCopyWith<_$GetGroceriesEventImpl> get copyWith =>
      __$$GetGroceriesEventImplCopyWithImpl<_$GetGroceriesEventImpl>(
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
    required TResult Function(GetGroceriesEvent value) onGetGroceries,
    required TResult Function(Reset value) onReset,
  }) {
    return onGetGroceries(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetGroceriesEvent value)? onGetGroceries,
    TResult? Function(Reset value)? onReset,
  }) {
    return onGetGroceries?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetGroceriesEvent value)? onGetGroceries,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onGetGroceries != null) {
      return onGetGroceries(this);
    }
    return orElse();
  }
}

abstract class GetGroceriesEvent implements GroceriesEvent {
  const factory GetGroceriesEvent(final String query) = _$GetGroceriesEventImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$GetGroceriesEventImplCopyWith<_$GetGroceriesEventImpl> get copyWith =>
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
    extends _$GroceriesEventCopyWithImpl<$Res, _$ResetImpl>
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
    return 'GroceriesEvent.onReset()';
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
    required TResult Function(GetGroceriesEvent value) onGetGroceries,
    required TResult Function(Reset value) onReset,
  }) {
    return onReset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetGroceriesEvent value)? onGetGroceries,
    TResult? Function(Reset value)? onReset,
  }) {
    return onReset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetGroceriesEvent value)? onGetGroceries,
    TResult Function(Reset value)? onReset,
    required TResult orElse(),
  }) {
    if (onReset != null) {
      return onReset(this);
    }
    return orElse();
  }
}

abstract class Reset implements GroceriesEvent {
  const factory Reset() = _$ResetImpl;
}

/// @nodoc
mixin _$GroceriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function(List<Food> foods)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function(List<Food> foods)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroceriesInitialState value) initial,
    required TResult Function(GroceriesLoadingState value) loading,
    required TResult Function(GroceriesErrorState value) error,
    required TResult Function(GroceriesLoadedState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroceriesInitialState value)? initial,
    TResult? Function(GroceriesLoadingState value)? loading,
    TResult? Function(GroceriesErrorState value)? error,
    TResult? Function(GroceriesLoadedState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroceriesInitialState value)? initial,
    TResult Function(GroceriesLoadingState value)? loading,
    TResult Function(GroceriesErrorState value)? error,
    TResult Function(GroceriesLoadedState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroceriesStateCopyWith<$Res> {
  factory $GroceriesStateCopyWith(
          GroceriesState value, $Res Function(GroceriesState) then) =
      _$GroceriesStateCopyWithImpl<$Res, GroceriesState>;
}

/// @nodoc
class _$GroceriesStateCopyWithImpl<$Res, $Val extends GroceriesState>
    implements $GroceriesStateCopyWith<$Res> {
  _$GroceriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GroceriesInitialStateImplCopyWith<$Res> {
  factory _$$GroceriesInitialStateImplCopyWith(
          _$GroceriesInitialStateImpl value,
          $Res Function(_$GroceriesInitialStateImpl) then) =
      __$$GroceriesInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroceriesInitialStateImplCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesInitialStateImpl>
    implements _$$GroceriesInitialStateImplCopyWith<$Res> {
  __$$GroceriesInitialStateImplCopyWithImpl(_$GroceriesInitialStateImpl _value,
      $Res Function(_$GroceriesInitialStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GroceriesInitialStateImpl implements GroceriesInitialState {
  const _$GroceriesInitialStateImpl();

  @override
  String toString() {
    return 'GroceriesState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceriesInitialStateImpl);
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
    required TResult Function(GroceriesInitialState value) initial,
    required TResult Function(GroceriesLoadingState value) loading,
    required TResult Function(GroceriesErrorState value) error,
    required TResult Function(GroceriesLoadedState value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroceriesInitialState value)? initial,
    TResult? Function(GroceriesLoadingState value)? loading,
    TResult? Function(GroceriesErrorState value)? error,
    TResult? Function(GroceriesLoadedState value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroceriesInitialState value)? initial,
    TResult Function(GroceriesLoadingState value)? loading,
    TResult Function(GroceriesErrorState value)? error,
    TResult Function(GroceriesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GroceriesInitialState implements GroceriesState {
  const factory GroceriesInitialState() = _$GroceriesInitialStateImpl;
}

/// @nodoc
abstract class _$$GroceriesLoadingStateImplCopyWith<$Res> {
  factory _$$GroceriesLoadingStateImplCopyWith(
          _$GroceriesLoadingStateImpl value,
          $Res Function(_$GroceriesLoadingStateImpl) then) =
      __$$GroceriesLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroceriesLoadingStateImplCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesLoadingStateImpl>
    implements _$$GroceriesLoadingStateImplCopyWith<$Res> {
  __$$GroceriesLoadingStateImplCopyWithImpl(_$GroceriesLoadingStateImpl _value,
      $Res Function(_$GroceriesLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GroceriesLoadingStateImpl implements GroceriesLoadingState {
  const _$GroceriesLoadingStateImpl();

  @override
  String toString() {
    return 'GroceriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceriesLoadingStateImpl);
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
    required TResult Function(GroceriesInitialState value) initial,
    required TResult Function(GroceriesLoadingState value) loading,
    required TResult Function(GroceriesErrorState value) error,
    required TResult Function(GroceriesLoadedState value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroceriesInitialState value)? initial,
    TResult? Function(GroceriesLoadingState value)? loading,
    TResult? Function(GroceriesErrorState value)? error,
    TResult? Function(GroceriesLoadedState value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroceriesInitialState value)? initial,
    TResult Function(GroceriesLoadingState value)? loading,
    TResult Function(GroceriesErrorState value)? error,
    TResult Function(GroceriesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GroceriesLoadingState implements GroceriesState {
  const factory GroceriesLoadingState() = _$GroceriesLoadingStateImpl;
}

/// @nodoc
abstract class _$$GroceriesErrorStateImplCopyWith<$Res> {
  factory _$$GroceriesErrorStateImplCopyWith(_$GroceriesErrorStateImpl value,
          $Res Function(_$GroceriesErrorStateImpl) then) =
      __$$GroceriesErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GroceriesErrorStateImplCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesErrorStateImpl>
    implements _$$GroceriesErrorStateImplCopyWith<$Res> {
  __$$GroceriesErrorStateImplCopyWithImpl(_$GroceriesErrorStateImpl _value,
      $Res Function(_$GroceriesErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GroceriesErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GroceriesErrorStateImpl implements GroceriesErrorState {
  const _$GroceriesErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GroceriesState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceriesErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceriesErrorStateImplCopyWith<_$GroceriesErrorStateImpl> get copyWith =>
      __$$GroceriesErrorStateImplCopyWithImpl<_$GroceriesErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
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
    required TResult Function(GroceriesInitialState value) initial,
    required TResult Function(GroceriesLoadingState value) loading,
    required TResult Function(GroceriesErrorState value) error,
    required TResult Function(GroceriesLoadedState value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroceriesInitialState value)? initial,
    TResult? Function(GroceriesLoadingState value)? loading,
    TResult? Function(GroceriesErrorState value)? error,
    TResult? Function(GroceriesLoadedState value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroceriesInitialState value)? initial,
    TResult Function(GroceriesLoadingState value)? loading,
    TResult Function(GroceriesErrorState value)? error,
    TResult Function(GroceriesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GroceriesErrorState implements GroceriesState {
  const factory GroceriesErrorState(final String message) =
      _$GroceriesErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$GroceriesErrorStateImplCopyWith<_$GroceriesErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroceriesLoadedStateImplCopyWith<$Res> {
  factory _$$GroceriesLoadedStateImplCopyWith(_$GroceriesLoadedStateImpl value,
          $Res Function(_$GroceriesLoadedStateImpl) then) =
      __$$GroceriesLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$GroceriesLoadedStateImplCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesLoadedStateImpl>
    implements _$$GroceriesLoadedStateImplCopyWith<$Res> {
  __$$GroceriesLoadedStateImplCopyWithImpl(_$GroceriesLoadedStateImpl _value,
      $Res Function(_$GroceriesLoadedStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$GroceriesLoadedStateImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$GroceriesLoadedStateImpl implements GroceriesLoadedState {
  const _$GroceriesLoadedStateImpl({required final List<Food> foods})
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
    return 'GroceriesState.loaded(foods: $foods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceriesLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceriesLoadedStateImplCopyWith<_$GroceriesLoadedStateImpl>
      get copyWith =>
          __$$GroceriesLoadedStateImplCopyWithImpl<_$GroceriesLoadedStateImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function(List<Food> foods) loaded,
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
    required TResult Function(GroceriesInitialState value) initial,
    required TResult Function(GroceriesLoadingState value) loading,
    required TResult Function(GroceriesErrorState value) error,
    required TResult Function(GroceriesLoadedState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroceriesInitialState value)? initial,
    TResult? Function(GroceriesLoadingState value)? loading,
    TResult? Function(GroceriesErrorState value)? error,
    TResult? Function(GroceriesLoadedState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroceriesInitialState value)? initial,
    TResult Function(GroceriesLoadingState value)? loading,
    TResult Function(GroceriesErrorState value)? error,
    TResult Function(GroceriesLoadedState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GroceriesLoadedState implements GroceriesState {
  const factory GroceriesLoadedState({required final List<Food> foods}) =
      _$GroceriesLoadedStateImpl;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$GroceriesLoadedStateImplCopyWith<_$GroceriesLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
