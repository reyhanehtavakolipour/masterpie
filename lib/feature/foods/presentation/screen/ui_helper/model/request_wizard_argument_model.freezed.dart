// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_wizard_argument_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RequestWizardArgumentModel {
  List<List<double>> get macroGoalRanges => throw _privateConstructorUsedError;
  List<String> get restriction => throw _privateConstructorUsedError;
  List<Food> get foods => throw _privateConstructorUsedError;
  List<RangeValues> get servingRanges => throw _privateConstructorUsedError;
  String get goalType => throw _privateConstructorUsedError;
  List<double> get macroPercentage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RequestWizardArgumentModelCopyWith<RequestWizardArgumentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestWizardArgumentModelCopyWith<$Res> {
  factory $RequestWizardArgumentModelCopyWith(RequestWizardArgumentModel value,
          $Res Function(RequestWizardArgumentModel) then) =
      _$RequestWizardArgumentModelCopyWithImpl<$Res,
          RequestWizardArgumentModel>;
  @useResult
  $Res call(
      {List<List<double>> macroGoalRanges,
      List<String> restriction,
      List<Food> foods,
      List<RangeValues> servingRanges,
      String goalType,
      List<double> macroPercentage});
}

/// @nodoc
class _$RequestWizardArgumentModelCopyWithImpl<$Res,
        $Val extends RequestWizardArgumentModel>
    implements $RequestWizardArgumentModelCopyWith<$Res> {
  _$RequestWizardArgumentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macroGoalRanges = null,
    Object? restriction = null,
    Object? foods = null,
    Object? servingRanges = null,
    Object? goalType = null,
    Object? macroPercentage = null,
  }) {
    return _then(_value.copyWith(
      macroGoalRanges: null == macroGoalRanges
          ? _value.macroGoalRanges
          : macroGoalRanges // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      restriction: null == restriction
          ? _value.restriction
          : restriction // ignore: cast_nullable_to_non_nullable
              as List<String>,
      foods: null == foods
          ? _value.foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      servingRanges: null == servingRanges
          ? _value.servingRanges
          : servingRanges // ignore: cast_nullable_to_non_nullable
              as List<RangeValues>,
      goalType: null == goalType
          ? _value.goalType
          : goalType // ignore: cast_nullable_to_non_nullable
              as String,
      macroPercentage: null == macroPercentage
          ? _value.macroPercentage
          : macroPercentage // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RequestWizardArgumentModelImplCopyWith<$Res>
    implements $RequestWizardArgumentModelCopyWith<$Res> {
  factory _$$RequestWizardArgumentModelImplCopyWith(
          _$RequestWizardArgumentModelImpl value,
          $Res Function(_$RequestWizardArgumentModelImpl) then) =
      __$$RequestWizardArgumentModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<List<double>> macroGoalRanges,
      List<String> restriction,
      List<Food> foods,
      List<RangeValues> servingRanges,
      String goalType,
      List<double> macroPercentage});
}

/// @nodoc
class __$$RequestWizardArgumentModelImplCopyWithImpl<$Res>
    extends _$RequestWizardArgumentModelCopyWithImpl<$Res,
        _$RequestWizardArgumentModelImpl>
    implements _$$RequestWizardArgumentModelImplCopyWith<$Res> {
  __$$RequestWizardArgumentModelImplCopyWithImpl(
      _$RequestWizardArgumentModelImpl _value,
      $Res Function(_$RequestWizardArgumentModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? macroGoalRanges = null,
    Object? restriction = null,
    Object? foods = null,
    Object? servingRanges = null,
    Object? goalType = null,
    Object? macroPercentage = null,
  }) {
    return _then(_$RequestWizardArgumentModelImpl(
      macroGoalRanges: null == macroGoalRanges
          ? _value._macroGoalRanges
          : macroGoalRanges // ignore: cast_nullable_to_non_nullable
              as List<List<double>>,
      restriction: null == restriction
          ? _value._restriction
          : restriction // ignore: cast_nullable_to_non_nullable
              as List<String>,
      foods: null == foods
          ? _value._foods
          : foods // ignore: cast_nullable_to_non_nullable
              as List<Food>,
      servingRanges: null == servingRanges
          ? _value._servingRanges
          : servingRanges // ignore: cast_nullable_to_non_nullable
              as List<RangeValues>,
      goalType: null == goalType
          ? _value.goalType
          : goalType // ignore: cast_nullable_to_non_nullable
              as String,
      macroPercentage: null == macroPercentage
          ? _value._macroPercentage
          : macroPercentage // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc

class _$RequestWizardArgumentModelImpl implements _RequestWizardArgumentModel {
  _$RequestWizardArgumentModelImpl(
      {final List<List<double>> macroGoalRanges = const [],
      final List<String> restriction = const [],
      final List<Food> foods = const [],
      final List<RangeValues> servingRanges = const [],
      this.goalType = BY_PERCENTAGE_LABEL,
      final List<double> macroPercentage = const []})
      : _macroGoalRanges = macroGoalRanges,
        _restriction = restriction,
        _foods = foods,
        _servingRanges = servingRanges,
        _macroPercentage = macroPercentage;

  final List<List<double>> _macroGoalRanges;
  @override
  @JsonKey()
  List<List<double>> get macroGoalRanges {
    if (_macroGoalRanges is EqualUnmodifiableListView) return _macroGoalRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_macroGoalRanges);
  }

  final List<String> _restriction;
  @override
  @JsonKey()
  List<String> get restriction {
    if (_restriction is EqualUnmodifiableListView) return _restriction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restriction);
  }

  final List<Food> _foods;
  @override
  @JsonKey()
  List<Food> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<RangeValues> _servingRanges;
  @override
  @JsonKey()
  List<RangeValues> get servingRanges {
    if (_servingRanges is EqualUnmodifiableListView) return _servingRanges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servingRanges);
  }

  @override
  @JsonKey()
  final String goalType;
  final List<double> _macroPercentage;
  @override
  @JsonKey()
  List<double> get macroPercentage {
    if (_macroPercentage is EqualUnmodifiableListView) return _macroPercentage;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_macroPercentage);
  }

  @override
  String toString() {
    return 'RequestWizardArgumentModel(macroGoalRanges: $macroGoalRanges, restriction: $restriction, foods: $foods, servingRanges: $servingRanges, goalType: $goalType, macroPercentage: $macroPercentage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestWizardArgumentModelImpl &&
            const DeepCollectionEquality()
                .equals(other._macroGoalRanges, _macroGoalRanges) &&
            const DeepCollectionEquality()
                .equals(other._restriction, _restriction) &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality()
                .equals(other._servingRanges, _servingRanges) &&
            (identical(other.goalType, goalType) ||
                other.goalType == goalType) &&
            const DeepCollectionEquality()
                .equals(other._macroPercentage, _macroPercentage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_macroGoalRanges),
      const DeepCollectionEquality().hash(_restriction),
      const DeepCollectionEquality().hash(_foods),
      const DeepCollectionEquality().hash(_servingRanges),
      goalType,
      const DeepCollectionEquality().hash(_macroPercentage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestWizardArgumentModelImplCopyWith<_$RequestWizardArgumentModelImpl>
      get copyWith => __$$RequestWizardArgumentModelImplCopyWithImpl<
          _$RequestWizardArgumentModelImpl>(this, _$identity);
}

abstract class _RequestWizardArgumentModel
    implements RequestWizardArgumentModel {
  factory _RequestWizardArgumentModel(
      {final List<List<double>> macroGoalRanges,
      final List<String> restriction,
      final List<Food> foods,
      final List<RangeValues> servingRanges,
      final String goalType,
      final List<double> macroPercentage}) = _$RequestWizardArgumentModelImpl;

  @override
  List<List<double>> get macroGoalRanges;
  @override
  List<String> get restriction;
  @override
  List<Food> get foods;
  @override
  List<RangeValues> get servingRanges;
  @override
  String get goalType;
  @override
  List<double> get macroPercentage;
  @override
  @JsonKey(ignore: true)
  _$$RequestWizardArgumentModelImplCopyWith<_$RequestWizardArgumentModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
