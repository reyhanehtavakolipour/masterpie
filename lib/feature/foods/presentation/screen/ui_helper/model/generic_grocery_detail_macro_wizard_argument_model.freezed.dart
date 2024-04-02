// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_grocery_detail_macro_wizard_argument_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericGroceryDetailForMacroWizardArgumentModel {
  GenericFood? get food => throw _privateConstructorUsedError;
  RequestWizardArgumentModel? get requestWizardArgumentModel =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericGroceryDetailForMacroWizardArgumentModelCopyWith<
          GenericGroceryDetailForMacroWizardArgumentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericGroceryDetailForMacroWizardArgumentModelCopyWith<$Res> {
  factory $GenericGroceryDetailForMacroWizardArgumentModelCopyWith(
          GenericGroceryDetailForMacroWizardArgumentModel value,
          $Res Function(GenericGroceryDetailForMacroWizardArgumentModel) then) =
      _$GenericGroceryDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
          GenericGroceryDetailForMacroWizardArgumentModel>;
  @useResult
  $Res call(
      {GenericFood? food,
      RequestWizardArgumentModel? requestWizardArgumentModel});

  $GenericFoodCopyWith<$Res>? get food;
  $RequestWizardArgumentModelCopyWith<$Res>? get requestWizardArgumentModel;
}

/// @nodoc
class _$GenericGroceryDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
        $Val extends GenericGroceryDetailForMacroWizardArgumentModel>
    implements $GenericGroceryDetailForMacroWizardArgumentModelCopyWith<$Res> {
  _$GenericGroceryDetailForMacroWizardArgumentModelCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? requestWizardArgumentModel = freezed,
  }) {
    return _then(_value.copyWith(
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as GenericFood?,
      requestWizardArgumentModel: freezed == requestWizardArgumentModel
          ? _value.requestWizardArgumentModel
          : requestWizardArgumentModel // ignore: cast_nullable_to_non_nullable
              as RequestWizardArgumentModel?,
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

  @override
  @pragma('vm:prefer-inline')
  $RequestWizardArgumentModelCopyWith<$Res>? get requestWizardArgumentModel {
    if (_value.requestWizardArgumentModel == null) {
      return null;
    }

    return $RequestWizardArgumentModelCopyWith<$Res>(
        _value.requestWizardArgumentModel!, (value) {
      return _then(_value.copyWith(requestWizardArgumentModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWith<
        $Res>
    implements $GenericGroceryDetailForMacroWizardArgumentModelCopyWith<$Res> {
  factory _$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWith(
          _$GenericGroceryDetailForMacroWizardArgumentModelImpl value,
          $Res Function(_$GenericGroceryDetailForMacroWizardArgumentModelImpl)
              then) =
      __$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GenericFood? food,
      RequestWizardArgumentModel? requestWizardArgumentModel});

  @override
  $GenericFoodCopyWith<$Res>? get food;
  @override
  $RequestWizardArgumentModelCopyWith<$Res>? get requestWizardArgumentModel;
}

/// @nodoc
class __$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWithImpl<$Res>
    extends _$GenericGroceryDetailForMacroWizardArgumentModelCopyWithImpl<$Res,
        _$GenericGroceryDetailForMacroWizardArgumentModelImpl>
    implements
        _$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWith<$Res> {
  __$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWithImpl(
      _$GenericGroceryDetailForMacroWizardArgumentModelImpl _value,
      $Res Function(_$GenericGroceryDetailForMacroWizardArgumentModelImpl)
          _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? food = freezed,
    Object? requestWizardArgumentModel = freezed,
  }) {
    return _then(_$GenericGroceryDetailForMacroWizardArgumentModelImpl(
      food: freezed == food
          ? _value.food
          : food // ignore: cast_nullable_to_non_nullable
              as GenericFood?,
      requestWizardArgumentModel: freezed == requestWizardArgumentModel
          ? _value.requestWizardArgumentModel
          : requestWizardArgumentModel // ignore: cast_nullable_to_non_nullable
              as RequestWizardArgumentModel?,
    ));
  }
}

/// @nodoc

class _$GenericGroceryDetailForMacroWizardArgumentModelImpl
    implements _GenericGroceryDetailForMacroWizardArgumentModel {
  _$GenericGroceryDetailForMacroWizardArgumentModelImpl(
      {this.food = null, this.requestWizardArgumentModel = null});

  @override
  @JsonKey()
  final GenericFood? food;
  @override
  @JsonKey()
  final RequestWizardArgumentModel? requestWizardArgumentModel;

  @override
  String toString() {
    return 'GenericGroceryDetailForMacroWizardArgumentModel(food: $food, requestWizardArgumentModel: $requestWizardArgumentModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenericGroceryDetailForMacroWizardArgumentModelImpl &&
            (identical(other.food, food) || other.food == food) &&
            (identical(other.requestWizardArgumentModel,
                    requestWizardArgumentModel) ||
                other.requestWizardArgumentModel ==
                    requestWizardArgumentModel));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, food, requestWizardArgumentModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWith<
          _$GenericGroceryDetailForMacroWizardArgumentModelImpl>
      get copyWith =>
          __$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWithImpl<
                  _$GenericGroceryDetailForMacroWizardArgumentModelImpl>(
              this, _$identity);
}

abstract class _GenericGroceryDetailForMacroWizardArgumentModel
    implements GenericGroceryDetailForMacroWizardArgumentModel {
  factory _GenericGroceryDetailForMacroWizardArgumentModel(
          {final GenericFood? food,
          final RequestWizardArgumentModel? requestWizardArgumentModel}) =
      _$GenericGroceryDetailForMacroWizardArgumentModelImpl;

  @override
  GenericFood? get food;
  @override
  RequestWizardArgumentModel? get requestWizardArgumentModel;
  @override
  @JsonKey(ignore: true)
  _$$GenericGroceryDetailForMacroWizardArgumentModelImplCopyWith<
          _$GenericGroceryDetailForMacroWizardArgumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
