// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_detail_macro_wizard_argument_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FoodDetailForMacroWizardArgumentModel {
  Food? get food => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodDetailForMacroWizardArgumentModelCopyWith<
          FoodDetailForMacroWizardArgumentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodDetailForMacroWizardArgumentModelCopyWith<$Res> {
  factory $FoodDetailForMacroWizardArgumentModelCopyWith(
          FoodDetailForMacroWizardArgumentModel value,
          $Res Function(FoodDetailForMacroWizardArgumentModel) then) =
      _$FoodDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
          FoodDetailForMacroWizardArgumentModel>;
  @useResult
  $Res call({Food? food, String type, int index});

  $FoodCopyWith<$Res>? get food;
}

/// @nodoc
class _$FoodDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
        $Val extends FoodDetailForMacroWizardArgumentModel>
    implements $FoodDetailForMacroWizardArgumentModelCopyWith<$Res> {
  _$FoodDetailForMacroWizardArgumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? type = null,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FoodCopyWith<$Res>? get food {
    if (_value.food == null) {
      return null;
    }

    return $FoodCopyWith<$Res>(_value.food!, (value) {
      return _then(_value.copyWith(food: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodDetailForMacroWizardArgumentModelImplCopyWith<$Res>
    implements $FoodDetailForMacroWizardArgumentModelCopyWith<$Res> {
  factory _$$FoodDetailForMacroWizardArgumentModelImplCopyWith(
          _$FoodDetailForMacroWizardArgumentModelImpl value,
          $Res Function(_$FoodDetailForMacroWizardArgumentModelImpl) then) =
      __$$FoodDetailForMacroWizardArgumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Food? food, String type, int index});

  @override
  $FoodCopyWith<$Res>? get food;
}

/// @nodoc
class __$$FoodDetailForMacroWizardArgumentModelImplCopyWithImpl<$Res>
    extends _$FoodDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
        _$FoodDetailForMacroWizardArgumentModelImpl>
    implements _$$FoodDetailForMacroWizardArgumentModelImplCopyWith<$Res> {
  __$$FoodDetailForMacroWizardArgumentModelImplCopyWithImpl(
      _$FoodDetailForMacroWizardArgumentModelImpl _value,
      $Res Function(_$FoodDetailForMacroWizardArgumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? type = null,
    Object? index = null,
  }) {
    return _then(_$FoodDetailForMacroWizardArgumentModelImpl(
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as Food?,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FoodDetailForMacroWizardArgumentModelImpl
    implements _FoodDetailForMacroWizardArgumentModel {
  _$FoodDetailForMacroWizardArgumentModelImpl(
      {this.food = null, this.type = '', this.index = 0});

  @override
  @JsonKey()
  final Food? food;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'FoodDetailForMacroWizardArgumentModel(food: $food, type: $type, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodDetailForMacroWizardArgumentModelImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food, type, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodDetailForMacroWizardArgumentModelImplCopyWith<
          _$FoodDetailForMacroWizardArgumentModelImpl>
      get copyWith => __$$FoodDetailForMacroWizardArgumentModelImplCopyWithImpl<
          _$FoodDetailForMacroWizardArgumentModelImpl>(this, _$identity);
}

abstract class _FoodDetailForMacroWizardArgumentModel
    implements FoodDetailForMacroWizardArgumentModel {
  factory _FoodDetailForMacroWizardArgumentModel(
      {final Food? food,
      final String type,
      final int index}) = _$FoodDetailForMacroWizardArgumentModelImpl;

  @override
  Food? get food;
  @override
  String get type;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$FoodDetailForMacroWizardArgumentModelImplCopyWith<
          _$FoodDetailForMacroWizardArgumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
