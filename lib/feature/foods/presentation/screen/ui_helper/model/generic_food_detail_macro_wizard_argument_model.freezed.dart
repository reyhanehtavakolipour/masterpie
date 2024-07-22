// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_food_detail_macro_wizard_argument_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericFoodDetailForMacroWizardArgumentModel {
  GenericFood? get food => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericFoodDetailForMacroWizardArgumentModelCopyWith<
          GenericFoodDetailForMacroWizardArgumentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericFoodDetailForMacroWizardArgumentModelCopyWith<$Res> {
  factory $GenericFoodDetailForMacroWizardArgumentModelCopyWith(
          GenericFoodDetailForMacroWizardArgumentModel value,
          $Res Function(GenericFoodDetailForMacroWizardArgumentModel) then) =
      _$GenericFoodDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
          GenericFoodDetailForMacroWizardArgumentModel>;
  @useResult
  $Res call({GenericFood? food, String type, int index});

  $GenericFoodCopyWith<$Res>? get food;
}

/// @nodoc
class _$GenericFoodDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
        $Val extends GenericFoodDetailForMacroWizardArgumentModel>
    implements $GenericFoodDetailForMacroWizardArgumentModelCopyWith<$Res> {
  _$GenericFoodDetailForMacroWizardArgumentModelCopyWithImpl(
      this._value, this._then);

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
              as GenericFood?,
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
abstract class _$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWith<$Res>
    implements $GenericFoodDetailForMacroWizardArgumentModelCopyWith<$Res> {
  factory _$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWith(
          _$GenericFoodDetailForMacroWizardArgumentModelImpl value,
          $Res Function(_$GenericFoodDetailForMacroWizardArgumentModelImpl)
              then) =
      __$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GenericFood? food, String type, int index});

  @override
  $GenericFoodCopyWith<$Res>? get food;
}

/// @nodoc
class __$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWithImpl<$Res>
    extends _$GenericFoodDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
        _$GenericFoodDetailForMacroWizardArgumentModelImpl>
    implements
        _$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWith<$Res> {
  __$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWithImpl(
      _$GenericFoodDetailForMacroWizardArgumentModelImpl _value,
      $Res Function(_$GenericFoodDetailForMacroWizardArgumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? type = null,
    Object? index = null,
  }) {
    return _then(_$GenericFoodDetailForMacroWizardArgumentModelImpl(
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as GenericFood?,
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

class _$GenericFoodDetailForMacroWizardArgumentModelImpl
    implements _GenericFoodDetailForMacroWizardArgumentModel {
  _$GenericFoodDetailForMacroWizardArgumentModelImpl(
      {this.food = null, this.type = '', this.index = 0});

  @override
  @JsonKey()
  final GenericFood? food;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'GenericFoodDetailForMacroWizardArgumentModel(food: $food, type: $type, index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericFoodDetailForMacroWizardArgumentModelImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, food, type, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWith<
          _$GenericFoodDetailForMacroWizardArgumentModelImpl>
      get copyWith =>
          __$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWithImpl<
                  _$GenericFoodDetailForMacroWizardArgumentModelImpl>(
              this, _$identity);
}

abstract class _GenericFoodDetailForMacroWizardArgumentModel
    implements GenericFoodDetailForMacroWizardArgumentModel {
  factory _GenericFoodDetailForMacroWizardArgumentModel(
      {final GenericFood? food,
      final String type,
      final int index}) = _$GenericFoodDetailForMacroWizardArgumentModelImpl;

  @override
  GenericFood? get food;
  @override
  String get type;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$GenericFoodDetailForMacroWizardArgumentModelImplCopyWith<
          _$GenericFoodDetailForMacroWizardArgumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
