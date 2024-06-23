// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wizard_response_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WizardResponseRemoteModel {
  List<SuggestedFoodsPortionRemote> get foodsPortions =>
      throw _privateConstructorUsedError;
  List<String> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WizardResponseRemoteModelCopyWith<WizardResponseRemoteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WizardResponseRemoteModelCopyWith<$Res> {
  factory $WizardResponseRemoteModelCopyWith(WizardResponseRemoteModel value,
          $Res Function(WizardResponseRemoteModel) then) =
      _$WizardResponseRemoteModelCopyWithImpl<$Res, WizardResponseRemoteModel>;
  @useResult
  $Res call(
      {List<SuggestedFoodsPortionRemote> foodsPortions, List<String> messages});
}

/// @nodoc
class _$WizardResponseRemoteModelCopyWithImpl<$Res,
        $Val extends WizardResponseRemoteModel>
    implements $WizardResponseRemoteModelCopyWith<$Res> {
  _$WizardResponseRemoteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodsPortions = null,
    Object? messages = null,
  }) {
    return _then(_value.copyWith(
      foodsPortions: null == foodsPortions
          ? _value.foodsPortions
          : foodsPortions // ignore: cast_nullable_to_non_nullable
              as List<SuggestedFoodsPortionRemote>,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WizardResponseRemoteModelImplCopyWith<$Res>
    implements $WizardResponseRemoteModelCopyWith<$Res> {
  factory _$$WizardResponseRemoteModelImplCopyWith(
          _$WizardResponseRemoteModelImpl value,
          $Res Function(_$WizardResponseRemoteModelImpl) then) =
      __$$WizardResponseRemoteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SuggestedFoodsPortionRemote> foodsPortions, List<String> messages});
}

/// @nodoc
class __$$WizardResponseRemoteModelImplCopyWithImpl<$Res>
    extends _$WizardResponseRemoteModelCopyWithImpl<$Res,
        _$WizardResponseRemoteModelImpl>
    implements _$$WizardResponseRemoteModelImplCopyWith<$Res> {
  __$$WizardResponseRemoteModelImplCopyWithImpl(
      _$WizardResponseRemoteModelImpl _value,
      $Res Function(_$WizardResponseRemoteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodsPortions = null,
    Object? messages = null,
  }) {
    return _then(_$WizardResponseRemoteModelImpl(
      foodsPortions: null == foodsPortions
          ? _value._foodsPortions
          : foodsPortions // ignore: cast_nullable_to_non_nullable
              as List<SuggestedFoodsPortionRemote>,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$WizardResponseRemoteModelImpl implements _WizardResponseRemoteModel {
  _$WizardResponseRemoteModelImpl(
      {final List<SuggestedFoodsPortionRemote> foodsPortions = const [],
      final List<String> messages = const []})
      : _foodsPortions = foodsPortions,
        _messages = messages;

  final List<SuggestedFoodsPortionRemote> _foodsPortions;
  @override
  @JsonKey()
  List<SuggestedFoodsPortionRemote> get foodsPortions {
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

  @override
  String toString() {
    return 'WizardResponseRemoteModel(foodsPortions: $foodsPortions, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WizardResponseRemoteModelImpl &&
            const DeepCollectionEquality()
                .equals(other._foodsPortions, _foodsPortions) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_foodsPortions),
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WizardResponseRemoteModelImplCopyWith<_$WizardResponseRemoteModelImpl>
      get copyWith => __$$WizardResponseRemoteModelImplCopyWithImpl<
          _$WizardResponseRemoteModelImpl>(this, _$identity);
}

abstract class _WizardResponseRemoteModel implements WizardResponseRemoteModel {
  factory _WizardResponseRemoteModel(
      {final List<SuggestedFoodsPortionRemote> foodsPortions,
      final List<String> messages}) = _$WizardResponseRemoteModelImpl;

  @override
  List<SuggestedFoodsPortionRemote> get foodsPortions;
  @override
  List<String> get messages;
  @override
  @JsonKey(ignore: true)
  _$$WizardResponseRemoteModelImplCopyWith<_$WizardResponseRemoteModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
