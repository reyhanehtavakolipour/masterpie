// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wizard_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WizardResponseModel {
  List<SuggestedFoodsPortion> get foodsPortions =>
      throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;
  List<int> get macroGoal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WizardResponseModelCopyWith<WizardResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WizardResponseModelCopyWith<$Res> {
  factory $WizardResponseModelCopyWith(
          WizardResponseModel value, $Res Function(WizardResponseModel) then) =
      _$WizardResponseModelCopyWithImpl<$Res, WizardResponseModel>;
  @useResult
  $Res call(
      {List<SuggestedFoodsPortion> foodsPortions,
      List<String> messages,
      List<int> macroGoal});
}

/// @nodoc
class _$WizardResponseModelCopyWithImpl<$Res, $Val extends WizardResponseModel>
    implements $WizardResponseModelCopyWith<$Res> {
  _$WizardResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodsPortions = null,
    Object? messages = null,
    Object? macroGoal = null,
  }) {
    return _then(_value.copyWith(
      foodsPortions: null == foodsPortions
          ? _value.foodsPortions
          : foodsPortions // ignore: cast_nullable_to_non_nullable
              as List<SuggestedFoodsPortion>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      macroGoal: null == macroGoal
          ? _value.macroGoal
          : macroGoal // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WizardResponseModelImplCopyWith<$Res>
    implements $WizardResponseModelCopyWith<$Res> {
  factory _$$WizardResponseModelImplCopyWith(_$WizardResponseModelImpl value,
          $Res Function(_$WizardResponseModelImpl) then) =
      __$$WizardResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SuggestedFoodsPortion> foodsPortions,
      List<String> messages,
      List<int> macroGoal});
}

/// @nodoc
class __$$WizardResponseModelImplCopyWithImpl<$Res>
    extends _$WizardResponseModelCopyWithImpl<$Res, _$WizardResponseModelImpl>
    implements _$$WizardResponseModelImplCopyWith<$Res> {
  __$$WizardResponseModelImplCopyWithImpl(_$WizardResponseModelImpl _value,
      $Res Function(_$WizardResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodsPortions = null,
    Object? messages = null,
    Object? macroGoal = null,
  }) {
    return _then(_$WizardResponseModelImpl(
      foodsPortions: null == foodsPortions
          ? _value._foodsPortions
          : foodsPortions // ignore: cast_nullable_to_non_nullable
              as List<SuggestedFoodsPortion>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      macroGoal: null == macroGoal
          ? _value._macroGoal
          : macroGoal // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$WizardResponseModelImpl implements _WizardResponseModel {
  _$WizardResponseModelImpl(
      {final List<SuggestedFoodsPortion> foodsPortions = const [],
      final List<String> messages = const [],
      final List<int> macroGoal = const []})
      : _foodsPortions = foodsPortions,
        _messages = messages,
        _macroGoal = macroGoal;

  final List<SuggestedFoodsPortion> _foodsPortions;
  @override
  @JsonKey()
  List<SuggestedFoodsPortion> get foodsPortions {
    if (_foodsPortions is EqualUnmodifiableListView) return _foodsPortions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foodsPortions);
  }

  final List<String> _messages;
  @override
  @JsonKey()
  List<String> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  final List<int> _macroGoal;
  @override
  @JsonKey()
  List<int> get macroGoal {
    if (_macroGoal is EqualUnmodifiableListView) return _macroGoal;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_macroGoal);
  }

  @override
  String toString() {
    return 'WizardResponseModel(foodsPortions: $foodsPortions, messages: $messages, macroGoal: $macroGoal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WizardResponseModelImpl &&
            const DeepCollectionEquality()
                .equals(other._foodsPortions, _foodsPortions) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            const DeepCollectionEquality()
                .equals(other._macroGoal, _macroGoal));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foodsPortions),
      const DeepCollectionEquality().hash(_messages),
      const DeepCollectionEquality().hash(_macroGoal));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WizardResponseModelImplCopyWith<_$WizardResponseModelImpl> get copyWith =>
      __$$WizardResponseModelImplCopyWithImpl<_$WizardResponseModelImpl>(
          this, _$identity);
}

abstract class _WizardResponseModel implements WizardResponseModel {
  factory _WizardResponseModel(
      {final List<SuggestedFoodsPortion> foodsPortions,
      final List<String> messages,
      final List<int> macroGoal}) = _$WizardResponseModelImpl;

  @override
  List<SuggestedFoodsPortion> get foodsPortions;
  @override
  List<String> get messages;
  @override
  List<int> get macroGoal;
  @override
  @JsonKey(ignore: true)
  _$$WizardResponseModelImplCopyWith<_$WizardResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
