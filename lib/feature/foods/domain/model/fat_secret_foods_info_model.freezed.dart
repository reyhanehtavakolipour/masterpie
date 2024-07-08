// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fat_secret_foods_info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FatSecretFoodsInfo {
  List<String> get recipeTypes => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FatSecretFoodsInfoCopyWith<FatSecretFoodsInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FatSecretFoodsInfoCopyWith<$Res> {
  factory $FatSecretFoodsInfoCopyWith(
          FatSecretFoodsInfo value, $Res Function(FatSecretFoodsInfo) then) =
      _$FatSecretFoodsInfoCopyWithImpl<$Res, FatSecretFoodsInfo>;
  @useResult
  $Res call(
      {List<String> recipeTypes,
      List<String> categories,
      List<String> allergens});
}

/// @nodoc
class _$FatSecretFoodsInfoCopyWithImpl<$Res, $Val extends FatSecretFoodsInfo>
    implements $FatSecretFoodsInfoCopyWith<$Res> {
  _$FatSecretFoodsInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeTypes = null,
    Object? categories = null,
    Object? allergens = null,
  }) {
    return _then(_value.copyWith(
      recipeTypes: null == recipeTypes
          ? _value.recipeTypes
          : recipeTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FatSecretFoodsInfoImplCopyWith<$Res>
    implements $FatSecretFoodsInfoCopyWith<$Res> {
  factory _$$FatSecretFoodsInfoImplCopyWith(_$FatSecretFoodsInfoImpl value,
          $Res Function(_$FatSecretFoodsInfoImpl) then) =
      __$$FatSecretFoodsInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> recipeTypes,
      List<String> categories,
      List<String> allergens});
}

/// @nodoc
class __$$FatSecretFoodsInfoImplCopyWithImpl<$Res>
    extends _$FatSecretFoodsInfoCopyWithImpl<$Res, _$FatSecretFoodsInfoImpl>
    implements _$$FatSecretFoodsInfoImplCopyWith<$Res> {
  __$$FatSecretFoodsInfoImplCopyWithImpl(_$FatSecretFoodsInfoImpl _value,
      $Res Function(_$FatSecretFoodsInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeTypes = null,
    Object? categories = null,
    Object? allergens = null,
  }) {
    return _then(_$FatSecretFoodsInfoImpl(
      recipeTypes: null == recipeTypes
          ? _value._recipeTypes
          : recipeTypes // ignore: cast_nullable_to_non_nullable
              as List<String>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergens: null == allergens
          ? _value._allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$FatSecretFoodsInfoImpl implements _FatSecretFoodsInfo {
  _$FatSecretFoodsInfoImpl(
      {final List<String> recipeTypes = const [],
      final List<String> categories = const [],
      final List<String> allergens = const []})
      : _recipeTypes = recipeTypes,
        _categories = categories,
        _allergens = allergens;

  final List<String> _recipeTypes;
  @override
  @JsonKey()
  List<String> get recipeTypes {
    if (_recipeTypes is EqualUnmodifiableListView) return _recipeTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeTypes);
  }

  final List<String> _categories;
  @override
  @JsonKey()
  List<String> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<String> _allergens;
  @override
  @JsonKey()
  List<String> get allergens {
    if (_allergens is EqualUnmodifiableListView) return _allergens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergens);
  }

  @override
  String toString() {
    return 'FatSecretFoodsInfo(recipeTypes: $recipeTypes, categories: $categories, allergens: $allergens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FatSecretFoodsInfoImpl &&
            const DeepCollectionEquality()
                .equals(other._recipeTypes, _recipeTypes) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._allergens, _allergens));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_recipeTypes),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_allergens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FatSecretFoodsInfoImplCopyWith<_$FatSecretFoodsInfoImpl> get copyWith =>
      __$$FatSecretFoodsInfoImplCopyWithImpl<_$FatSecretFoodsInfoImpl>(
          this, _$identity);
}

abstract class _FatSecretFoodsInfo implements FatSecretFoodsInfo {
  factory _FatSecretFoodsInfo(
      {final List<String> recipeTypes,
      final List<String> categories,
      final List<String> allergens}) = _$FatSecretFoodsInfoImpl;

  @override
  List<String> get recipeTypes;
  @override
  List<String> get categories;
  @override
  List<String> get allergens;
  @override
  @JsonKey(ignore: true)
  _$$FatSecretFoodsInfoImplCopyWith<_$FatSecretFoodsInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
