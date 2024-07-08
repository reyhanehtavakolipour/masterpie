// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fat_secret_foods_info_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FatSecretFoodsInfoRemote {
  List<String> get recipeTypes => throw _privateConstructorUsedError;
  List<String> get categories => throw _privateConstructorUsedError;
  List<String> get allergens => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FatSecretFoodsInfoRemoteCopyWith<FatSecretFoodsInfoRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FatSecretFoodsInfoRemoteCopyWith<$Res> {
  factory $FatSecretFoodsInfoRemoteCopyWith(FatSecretFoodsInfoRemote value,
          $Res Function(FatSecretFoodsInfoRemote) then) =
      _$FatSecretFoodsInfoRemoteCopyWithImpl<$Res, FatSecretFoodsInfoRemote>;
  @useResult
  $Res call(
      {List<String> recipeTypes,
      List<String> categories,
      List<String> allergens});
}

/// @nodoc
class _$FatSecretFoodsInfoRemoteCopyWithImpl<$Res,
        $Val extends FatSecretFoodsInfoRemote>
    implements $FatSecretFoodsInfoRemoteCopyWith<$Res> {
  _$FatSecretFoodsInfoRemoteCopyWithImpl(this._value, this._then);

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
abstract class _$$FatSecretFoodsInfoRemoteImplCopyWith<$Res>
    implements $FatSecretFoodsInfoRemoteCopyWith<$Res> {
  factory _$$FatSecretFoodsInfoRemoteImplCopyWith(
          _$FatSecretFoodsInfoRemoteImpl value,
          $Res Function(_$FatSecretFoodsInfoRemoteImpl) then) =
      __$$FatSecretFoodsInfoRemoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> recipeTypes,
      List<String> categories,
      List<String> allergens});
}

/// @nodoc
class __$$FatSecretFoodsInfoRemoteImplCopyWithImpl<$Res>
    extends _$FatSecretFoodsInfoRemoteCopyWithImpl<$Res,
        _$FatSecretFoodsInfoRemoteImpl>
    implements _$$FatSecretFoodsInfoRemoteImplCopyWith<$Res> {
  __$$FatSecretFoodsInfoRemoteImplCopyWithImpl(
      _$FatSecretFoodsInfoRemoteImpl _value,
      $Res Function(_$FatSecretFoodsInfoRemoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeTypes = null,
    Object? categories = null,
    Object? allergens = null,
  }) {
    return _then(_$FatSecretFoodsInfoRemoteImpl(
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

class _$FatSecretFoodsInfoRemoteImpl implements _FatSecretFoodsInfoRemote {
  _$FatSecretFoodsInfoRemoteImpl(
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
    return 'FatSecretFoodsInfoRemote(recipeTypes: $recipeTypes, categories: $categories, allergens: $allergens)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FatSecretFoodsInfoRemoteImpl &&
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
  _$$FatSecretFoodsInfoRemoteImplCopyWith<_$FatSecretFoodsInfoRemoteImpl>
      get copyWith => __$$FatSecretFoodsInfoRemoteImplCopyWithImpl<
          _$FatSecretFoodsInfoRemoteImpl>(this, _$identity);
}

abstract class _FatSecretFoodsInfoRemote implements FatSecretFoodsInfoRemote {
  factory _FatSecretFoodsInfoRemote(
      {final List<String> recipeTypes,
      final List<String> categories,
      final List<String> allergens}) = _$FatSecretFoodsInfoRemoteImpl;

  @override
  List<String> get recipeTypes;
  @override
  List<String> get categories;
  @override
  List<String> get allergens;
  @override
  @JsonKey(ignore: true)
  _$$FatSecretFoodsInfoRemoteImplCopyWith<_$FatSecretFoodsInfoRemoteImpl>
      get copyWith => throw _privateConstructorUsedError;
}
