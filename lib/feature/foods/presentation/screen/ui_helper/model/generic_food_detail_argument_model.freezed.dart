// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_food_detail_argument_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericFoodDetailArgumentModel {
  GenericFood? get food => throw _privateConstructorUsedError;
  bool get macroEdition => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericFoodDetailArgumentModelCopyWith<GenericFoodDetailArgumentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericFoodDetailArgumentModelCopyWith<$Res> {
  factory $GenericFoodDetailArgumentModelCopyWith(
          GenericFoodDetailArgumentModel value,
          $Res Function(GenericFoodDetailArgumentModel) then) =
      _$GenericFoodDetailArgumentModelCopyWithImpl<$Res,
          GenericFoodDetailArgumentModel>;
  @useResult
  $Res call({GenericFood? food, bool macroEdition});

  $GenericFoodCopyWith<$Res>? get food;
}

/// @nodoc
class _$GenericFoodDetailArgumentModelCopyWithImpl<$Res,
        $Val extends GenericFoodDetailArgumentModel>
    implements $GenericFoodDetailArgumentModelCopyWith<$Res> {
  _$GenericFoodDetailArgumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? macroEdition = null,
  }) {
    return _then(_value.copyWith(
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as GenericFood?,
      macroEdition: null == macroEdition
          ? _value.macroEdition
          : macroEdition // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GenericFoodCopyWith<$Res>? get food {
    if (_value.food == null) {
      return null;
    }

    return $GenericFoodCopyWith<$Res>(_value.food!, (value) {
      return _then(_value.copyWith(food: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenericFoodDetailArgumentModelImplCopyWith<$Res>
    implements $GenericFoodDetailArgumentModelCopyWith<$Res> {
  factory _$$GenericFoodDetailArgumentModelImplCopyWith(
          _$GenericFoodDetailArgumentModelImpl value,
          $Res Function(_$GenericFoodDetailArgumentModelImpl) then) =
      __$$GenericFoodDetailArgumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GenericFood? food, bool macroEdition});

  @override
  $GenericFoodCopyWith<$Res>? get food;
}

/// @nodoc
class __$$GenericFoodDetailArgumentModelImplCopyWithImpl<$Res>
    extends _$GenericFoodDetailArgumentModelCopyWithImpl<$Res,
        _$GenericFoodDetailArgumentModelImpl>
    implements _$$GenericFoodDetailArgumentModelImplCopyWith<$Res> {
  __$$GenericFoodDetailArgumentModelImplCopyWithImpl(
      _$GenericFoodDetailArgumentModelImpl _value,
      $Res Function(_$GenericFoodDetailArgumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? macroEdition = null,
  }) {
    return _then(_$GenericFoodDetailArgumentModelImpl(
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as GenericFood?,
      macroEdition: null == macroEdition
          ? _value.macroEdition
          : macroEdition // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GenericFoodDetailArgumentModelImpl
    implements _GenericFoodDetailArgumentModel {
  _$GenericFoodDetailArgumentModelImpl(
      {this.food = null, this.macroEdition = false});

  @override
  @JsonKey()
  final GenericFood? food;
  @override
  @JsonKey()
  final bool macroEdition;

  @override
  String toString() {
    return 'GenericFoodDetailArgumentModel(food: $food, macroEdition: $macroEdition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericFoodDetailArgumentModelImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.macroEdition, macroEdition) ||
                other.macroEdition == macroEdition));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food, macroEdition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericFoodDetailArgumentModelImplCopyWith<
          _$GenericFoodDetailArgumentModelImpl>
      get copyWith => __$$GenericFoodDetailArgumentModelImplCopyWithImpl<
          _$GenericFoodDetailArgumentModelImpl>(this, _$identity);
}

abstract class _GenericFoodDetailArgumentModel
    implements GenericFoodDetailArgumentModel {
  factory _GenericFoodDetailArgumentModel(
      {final GenericFood? food,
      final bool macroEdition}) = _$GenericFoodDetailArgumentModelImpl;

  @override
  GenericFood? get food;
  @override
  bool get macroEdition;
  @override
  @JsonKey(ignore: true)
  _$$GenericFoodDetailArgumentModelImplCopyWith<
          _$GenericFoodDetailArgumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
