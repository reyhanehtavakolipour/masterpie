// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'logged_foods_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoggedFoods {
  List<Food> get foods => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;
  List<double> get goals => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoggedFoodsCopyWith<LoggedFoods> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoggedFoodsCopyWith<$Res> {
  factory $LoggedFoodsCopyWith(
          LoggedFoods value, $Res Function(LoggedFoods) then) =
      _$LoggedFoodsCopyWithImpl<$Res, LoggedFoods>;
  @useResult
  $Res call({List<Food> foods, String date, List<double> goals});
}

/// @nodoc
class _$LoggedFoodsCopyWithImpl<$Res, $Val extends LoggedFoods>
    implements $LoggedFoodsCopyWith<$Res> {
  _$LoggedFoodsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? date = null,
    Object? goals = null,
  }) {
    return _then(_value.copyWith(
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      goals: null == goals
          ? _value.goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoggedFoodsImplCopyWith<$Res>
    implements $LoggedFoodsCopyWith<$Res> {
  factory _$$LoggedFoodsImplCopyWith(
          _$LoggedFoodsImpl value, $Res Function(_$LoggedFoodsImpl) then) =
      __$$LoggedFoodsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Food> foods, String date, List<double> goals});
}

/// @nodoc
class __$$LoggedFoodsImplCopyWithImpl<$Res>
    extends _$LoggedFoodsCopyWithImpl<$Res, _$LoggedFoodsImpl>
    implements _$$LoggedFoodsImplCopyWith<$Res> {
  __$$LoggedFoodsImplCopyWithImpl(
      _$LoggedFoodsImpl _value, $Res Function(_$LoggedFoodsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? date = null,
    Object? goals = null,
  }) {
    return _then(_$LoggedFoodsImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      goals: null == goals
          ? _value._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$LoggedFoodsImpl implements _LoggedFoods {
  _$LoggedFoodsImpl(
      {final List<Food> foods = const [],
      this.date = '',
      final List<double> goals = const []})
      : _foods = foods,
        _goals = goals;

  final List<Food> _foods;
  @override
  @JsonKey()
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  @JsonKey()
  final String date;
  final List<double> _goals;
  @override
  @JsonKey()
  List<double> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  @override
  String toString() {
    return 'LoggedFoods(foods: $foods, date: $date, goals: $goals)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedFoodsImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foods),
      date,
      const DeepCollectionEquality().hash(_goals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedFoodsImplCopyWith<_$LoggedFoodsImpl> get copyWith =>
      __$$LoggedFoodsImplCopyWithImpl<_$LoggedFoodsImpl>(this, _$identity);
}

abstract class _LoggedFoods implements LoggedFoods {
  factory _LoggedFoods(
      {final List<Food> foods,
      final String date,
      final List<double> goals}) = _$LoggedFoodsImpl;

  @override
  List<Food> get foods;
  @override
  String get date;
  @override
  List<double> get goals;
  @override
  @JsonKey(ignore: true)
  _$$LoggedFoodsImplCopyWith<_$LoggedFoodsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
