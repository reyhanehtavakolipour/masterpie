// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggested_foods_portion_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestedFoodsPortionRemote {
  List<FoodRemote> get foods => throw _privateConstructorUsedError;
  List<double> get totalMacro => throw _privateConstructorUsedError;
  int get accuracy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestedFoodsPortionRemoteCopyWith<SuggestedFoodsPortionRemote>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedFoodsPortionRemoteCopyWith<$Res> {
  factory $SuggestedFoodsPortionRemoteCopyWith(
          SuggestedFoodsPortionRemote value,
          $Res Function(SuggestedFoodsPortionRemote) then) =
      _$SuggestedFoodsPortionRemoteCopyWithImpl<$Res,
          SuggestedFoodsPortionRemote>;
  @useResult
  $Res call({List<FoodRemote> foods, List<double> totalMacro, int accuracy});
}

/// @nodoc
class _$SuggestedFoodsPortionRemoteCopyWithImpl<$Res,
        $Val extends SuggestedFoodsPortionRemote>
    implements $SuggestedFoodsPortionRemoteCopyWith<$Res> {
  _$SuggestedFoodsPortionRemoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? totalMacro = null,
    Object? accuracy = null,
  }) {
    return _then(_value.copyWith(
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<FoodRemote>,
      totalMacro: null == totalMacro
          ? _value.totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestedFoodsPortionRemoteImplCopyWith<$Res>
    implements $SuggestedFoodsPortionRemoteCopyWith<$Res> {
  factory _$$SuggestedFoodsPortionRemoteImplCopyWith(
          _$SuggestedFoodsPortionRemoteImpl value,
          $Res Function(_$SuggestedFoodsPortionRemoteImpl) then) =
      __$$SuggestedFoodsPortionRemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FoodRemote> foods, List<double> totalMacro, int accuracy});
}

/// @nodoc
class __$$SuggestedFoodsPortionRemoteImplCopyWithImpl<$Res>
    extends _$SuggestedFoodsPortionRemoteCopyWithImpl<$Res,
        _$SuggestedFoodsPortionRemoteImpl>
    implements _$$SuggestedFoodsPortionRemoteImplCopyWith<$Res> {
  __$$SuggestedFoodsPortionRemoteImplCopyWithImpl(
      _$SuggestedFoodsPortionRemoteImpl _value,
      $Res Function(_$SuggestedFoodsPortionRemoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foods = null,
    Object? totalMacro = null,
    Object? accuracy = null,
  }) {
    return _then(_$SuggestedFoodsPortionRemoteImpl(
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<FoodRemote>,
      totalMacro: null == totalMacro
          ? _value._totalMacro
          : totalMacro // ignore: cast_nullable_to_non_nullable
              as List<double>,
      accuracy: null == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SuggestedFoodsPortionRemoteImpl
    implements _SuggestedFoodsPortionRemote {
  _$SuggestedFoodsPortionRemoteImpl(
      {final List<FoodRemote> foods = const [],
      final List<double> totalMacro = const [],
      this.accuracy = 0})
      : _foods = foods,
        _totalMacro = totalMacro;

  final List<FoodRemote> _foods;
  @override
  @JsonKey()
  List<FoodRemote> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<double> _totalMacro;
  @override
  @JsonKey()
  List<double> get totalMacro {
    if (_totalMacro is EqualUnmodifiableListView) return _totalMacro;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_totalMacro);
  }

  @override
  @JsonKey()
  final int accuracy;

  @override
  String toString() {
    return 'SuggestedFoodsPortionRemote(foods: $foods, totalMacro: $totalMacro, accuracy: $accuracy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedFoodsPortionRemoteImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality()
                .equals(other._totalMacro, _totalMacro) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foods),
      const DeepCollectionEquality().hash(_totalMacro),
      accuracy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedFoodsPortionRemoteImplCopyWith<_$SuggestedFoodsPortionRemoteImpl>
      get copyWith => __$$SuggestedFoodsPortionRemoteImplCopyWithImpl<
          _$SuggestedFoodsPortionRemoteImpl>(this, _$identity);
}

abstract class _SuggestedFoodsPortionRemote
    implements SuggestedFoodsPortionRemote {
  factory _SuggestedFoodsPortionRemote(
      {final List<FoodRemote> foods,
      final List<double> totalMacro,
      final int accuracy}) = _$SuggestedFoodsPortionRemoteImpl;

  @override
  List<FoodRemote> get foods;
  @override
  List<double> get totalMacro;
  @override
  int get accuracy;
  @override
  @JsonKey(ignore: true)
  _$$SuggestedFoodsPortionRemoteImplCopyWith<_$SuggestedFoodsPortionRemoteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
