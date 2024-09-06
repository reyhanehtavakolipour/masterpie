// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_plan_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MealPlanRemote {
  String get mealPlanId => throw _privateConstructorUsedError;
  List<FoodRemote> get foods => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<double> get totalMacro => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealPlanRemoteCopyWith<MealPlanRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealPlanRemoteCopyWith<$Res> {
  factory $MealPlanRemoteCopyWith(
          MealPlanRemote value, $Res Function(MealPlanRemote) then) =
      _$MealPlanRemoteCopyWithImpl<$Res, MealPlanRemote>;
  @useResult
  $Res call(
      {String mealPlanId,
      List<FoodRemote> foods,
      String name,
      List<double> totalMacro});
}

/// @nodoc
class _$MealPlanRemoteCopyWithImpl<$Res, $Val extends MealPlanRemote>
    implements $MealPlanRemoteCopyWith<$Res> {
  _$MealPlanRemoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlanId = null,
    Object? foods = null,
    Object? name = null,
    Object? totalMacro = null,
  }) {
    return _then(_value.copyWith(
      mealPlanId: null == mealPlanId
          ? _value.mealPlanId
          : mealPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<FoodRemote>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalMacro: null == totalMacro
          ? _value.totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealPlanRemoteImplCopyWith<$Res>
    implements $MealPlanRemoteCopyWith<$Res> {
  factory _$$MealPlanRemoteImplCopyWith(_$MealPlanRemoteImpl value,
          $Res Function(_$MealPlanRemoteImpl) then) =
      __$$MealPlanRemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mealPlanId,
      List<FoodRemote> foods,
      String name,
      List<double> totalMacro});
}

/// @nodoc
class __$$MealPlanRemoteImplCopyWithImpl<$Res>
    extends _$MealPlanRemoteCopyWithImpl<$Res, _$MealPlanRemoteImpl>
    implements _$$MealPlanRemoteImplCopyWith<$Res> {
  __$$MealPlanRemoteImplCopyWithImpl(
      _$MealPlanRemoteImpl _value, $Res Function(_$MealPlanRemoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mealPlanId = null,
    Object? foods = null,
    Object? name = null,
    Object? totalMacro = null,
  }) {
    return _then(_$MealPlanRemoteImpl(
      mealPlanId: null == mealPlanId
          ? _value.mealPlanId
          : mealPlanId // ignore: cast_nullable_to_non_nullable
              as String,
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<FoodRemote>,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      totalMacro: null == totalMacro
          ? _value._totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$MealPlanRemoteImpl implements _MealPlanRemote {
  _$MealPlanRemoteImpl(
      {this.mealPlanId = '',
      final List<FoodRemote> foods = const [],
      this.name = '',
      final List<double> totalMacro = const []})
      : _foods = foods,
        _totalMacro = totalMacro;

  @override
  @JsonKey()
  final String mealPlanId;
  final List<FoodRemote> _foods;
  @override
  @JsonKey()
  List<FoodRemote> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  @override
  @JsonKey()
  final String name;
  final List<double> _totalMacro;
  @override
  @JsonKey()
  List<double> get totalMacro {
    if (_totalMacro is EqualUnmodifiableListView) return _totalMacro;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalMacro);
  }

  @override
  String toString() {
    return 'MealPlanRemote(mealPlanId: $mealPlanId, foods: $foods, name: $name, totalMacro: $totalMacro)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealPlanRemoteImpl &&
            (identical(other.mealPlanId, mealPlanId) ||
                other.mealPlanId == mealPlanId) &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._totalMacro, _totalMacro));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      mealPlanId,
      const DeepCollectionEquality().hash(_foods),
      name,
      const DeepCollectionEquality().hash(_totalMacro));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MealPlanRemoteImplCopyWith<_$MealPlanRemoteImpl> get copyWith =>
      __$$MealPlanRemoteImplCopyWithImpl<_$MealPlanRemoteImpl>(
          this, _$identity);
}

abstract class _MealPlanRemote implements MealPlanRemote {
  factory _MealPlanRemote(
      {final String mealPlanId,
      final List<FoodRemote> foods,
      final String name,
      final List<double> totalMacro}) = _$MealPlanRemoteImpl;

  @override
  String get mealPlanId;
  @override
  List<FoodRemote> get foods;
  @override
  String get name;
  @override
  List<double> get totalMacro;
  @override
  @JsonKey(ignore: true)
  _$$MealPlanRemoteImplCopyWith<_$MealPlanRemoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
