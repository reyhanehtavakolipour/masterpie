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
abstract class _$$GetGroceriesEventCopyWith<$Res> {
  factory _$$GetGroceriesEventCopyWith(
          _$GetGroceriesEvent value, $Res Function(_$GetGroceriesEvent) then) =
      __$$GetGroceriesEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$GetGroceriesEventCopyWithImpl<$Res>
    extends _$GroceriesEventCopyWithImpl<$Res, _$GetGroceriesEvent>
    implements _$$GetGroceriesEventCopyWith<$Res> {
  __$$GetGroceriesEventCopyWithImpl(
      _$GetGroceriesEvent _value, $Res Function(_$GetGroceriesEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$GetGroceriesEvent(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetGroceriesEvent implements GetGroceriesEvent {
  const _$GetGroceriesEvent(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'GroceriesEvent.onGetGroceries(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetGroceriesEvent &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetGroceriesEventCopyWith<_$GetGroceriesEvent> get copyWith =>
      __$$GetGroceriesEventCopyWithImpl<_$GetGroceriesEvent>(this, _$identity);

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
  const factory GetGroceriesEvent(final String query) = _$GetGroceriesEvent;

  String get query;
  @JsonKey(ignore: true)
  _$$GetGroceriesEventCopyWith<_$GetGroceriesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetCopyWith<$Res> {
  factory _$$ResetCopyWith(_$Reset value, $Res Function(_$Reset) then) =
      __$$ResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetCopyWithImpl<$Res>
    extends _$GroceriesEventCopyWithImpl<$Res, _$Reset>
    implements _$$ResetCopyWith<$Res> {
  __$$ResetCopyWithImpl(_$Reset _value, $Res Function(_$Reset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Reset implements Reset {
  const _$Reset();

  @override
  String toString() {
    return 'GroceriesEvent.onReset()';
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
  const factory Reset() = _$Reset;
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
abstract class _$$GroceriesInitialStateCopyWith<$Res> {
  factory _$$GroceriesInitialStateCopyWith(_$GroceriesInitialState value,
          $Res Function(_$GroceriesInitialState) then) =
      __$$GroceriesInitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroceriesInitialStateCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesInitialState>
    implements _$$GroceriesInitialStateCopyWith<$Res> {
  __$$GroceriesInitialStateCopyWithImpl(_$GroceriesInitialState _value,
      $Res Function(_$GroceriesInitialState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GroceriesInitialState implements GroceriesInitialState {
  const _$GroceriesInitialState();

  @override
  String toString() {
    return 'GroceriesState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GroceriesInitialState);
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
  const factory GroceriesInitialState() = _$GroceriesInitialState;
}

/// @nodoc
abstract class _$$GroceriesLoadingStateCopyWith<$Res> {
  factory _$$GroceriesLoadingStateCopyWith(_$GroceriesLoadingState value,
          $Res Function(_$GroceriesLoadingState) then) =
      __$$GroceriesLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroceriesLoadingStateCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesLoadingState>
    implements _$$GroceriesLoadingStateCopyWith<$Res> {
  __$$GroceriesLoadingStateCopyWithImpl(_$GroceriesLoadingState _value,
      $Res Function(_$GroceriesLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GroceriesLoadingState implements GroceriesLoadingState {
  const _$GroceriesLoadingState();

  @override
  String toString() {
    return 'GroceriesState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GroceriesLoadingState);
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
  const factory GroceriesLoadingState() = _$GroceriesLoadingState;
}

/// @nodoc
abstract class _$$GroceriesErrorStateCopyWith<$Res> {
  factory _$$GroceriesErrorStateCopyWith(_$GroceriesErrorState value,
          $Res Function(_$GroceriesErrorState) then) =
      __$$GroceriesErrorStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GroceriesErrorStateCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesErrorState>
    implements _$$GroceriesErrorStateCopyWith<$Res> {
  __$$GroceriesErrorStateCopyWithImpl(
      _$GroceriesErrorState _value, $Res Function(_$GroceriesErrorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$GroceriesErrorState(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GroceriesErrorState implements GroceriesErrorState {
  const _$GroceriesErrorState(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GroceriesState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceriesErrorState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceriesErrorStateCopyWith<_$GroceriesErrorState> get copyWith =>
      __$$GroceriesErrorStateCopyWithImpl<_$GroceriesErrorState>(
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
      _$GroceriesErrorState;

  String get message;
  @JsonKey(ignore: true)
  _$$GroceriesErrorStateCopyWith<_$GroceriesErrorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroceriesLoadedStateCopyWith<$Res> {
  factory _$$GroceriesLoadedStateCopyWith(_$GroceriesLoadedState value,
          $Res Function(_$GroceriesLoadedState) then) =
      __$$GroceriesLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Food> foods});
}

/// @nodoc
class __$$GroceriesLoadedStateCopyWithImpl<$Res>
    extends _$GroceriesStateCopyWithImpl<$Res, _$GroceriesLoadedState>
    implements _$$GroceriesLoadedStateCopyWith<$Res> {
  __$$GroceriesLoadedStateCopyWithImpl(_$GroceriesLoadedState _value,
      $Res Function(_$GroceriesLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
  }) {
    return _then(_$GroceriesLoadedState(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
    ));
  }
}

/// @nodoc

class _$GroceriesLoadedState implements GroceriesLoadedState {
  const _$GroceriesLoadedState({required final List<Food> foods})
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroceriesLoadedState &&
            const DeepCollectionEquality().equals(other._foods, _foods));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_foods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroceriesLoadedStateCopyWith<_$GroceriesLoadedState> get copyWith =>
      __$$GroceriesLoadedStateCopyWithImpl<_$GroceriesLoadedState>(
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
      _$GroceriesLoadedState;

  List<Food> get foods;
  @JsonKey(ignore: true)
  _$$GroceriesLoadedStateCopyWith<_$GroceriesLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}
