// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggested_food_remote_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SuggestedFoodRemote {
  List<String> get names => throw _privateConstructorUsedError;
  List<String> get nationalities => throw _privateConstructorUsedError;
  List<String> get ingredients => throw _privateConstructorUsedError;
  List<String> get diets => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestedFoodRemoteCopyWith<SuggestedFoodRemote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedFoodRemoteCopyWith<$Res> {
  factory $SuggestedFoodRemoteCopyWith(
          SuggestedFoodRemote value, $Res Function(SuggestedFoodRemote) then) =
      _$SuggestedFoodRemoteCopyWithImpl<$Res, SuggestedFoodRemote>;
  @useResult
  $Res call(
      {List<String> names,
      List<String> nationalities,
      List<String> ingredients,
      List<String> diets});
}

/// @nodoc
class _$SuggestedFoodRemoteCopyWithImpl<$Res, $Val extends SuggestedFoodRemote>
    implements $SuggestedFoodRemoteCopyWith<$Res> {
  _$SuggestedFoodRemoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? names = null,
    Object? nationalities = null,
    Object? ingredients = null,
    Object? diets = null,
  }) {
    return _then(_value.copyWith(
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nationalities: null == nationalities
          ? _value.nationalities
          : nationalities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      diets: null == diets
          ? _value.diets
          : diets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SuggestedFoodRemoteCopyWith<$Res>
    implements $SuggestedFoodRemoteCopyWith<$Res> {
  factory _$$_SuggestedFoodRemoteCopyWith(_$_SuggestedFoodRemote value,
          $Res Function(_$_SuggestedFoodRemote) then) =
      __$$_SuggestedFoodRemoteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> names,
      List<String> nationalities,
      List<String> ingredients,
      List<String> diets});
}

/// @nodoc
class __$$_SuggestedFoodRemoteCopyWithImpl<$Res>
    extends _$SuggestedFoodRemoteCopyWithImpl<$Res, _$_SuggestedFoodRemote>
    implements _$$_SuggestedFoodRemoteCopyWith<$Res> {
  __$$_SuggestedFoodRemoteCopyWithImpl(_$_SuggestedFoodRemote _value,
      $Res Function(_$_SuggestedFoodRemote) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? names = null,
    Object? nationalities = null,
    Object? ingredients = null,
    Object? diets = null,
  }) {
    return _then(_$_SuggestedFoodRemote(
      names: null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<String>,
      nationalities: null == nationalities
          ? _value._nationalities
          : nationalities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      diets: null == diets
          ? _value._diets
          : diets // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_SuggestedFoodRemote implements _SuggestedFoodRemote {
  _$_SuggestedFoodRemote(
      {final List<String> names = const [],
      final List<String> nationalities = const [],
      final List<String> ingredients = const [],
      final List<String> diets = const []})
      : _names = names,
        _nationalities = nationalities,
        _ingredients = ingredients,
        _diets = diets;

  final List<String> _names;
  @override
  @JsonKey()
  List<String> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  final List<String> _nationalities;
  @override
  @JsonKey()
  List<String> get nationalities {
    if (_nationalities is EqualUnmodifiableListView) return _nationalities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nationalities);
  }

  final List<String> _ingredients;
  @override
  @JsonKey()
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final List<String> _diets;
  @override
  @JsonKey()
  List<String> get diets {
    if (_diets is EqualUnmodifiableListView) return _diets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diets);
  }

  @override
  String toString() {
    return 'SuggestedFoodRemote(names: $names, nationalities: $nationalities, ingredients: $ingredients, diets: $diets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SuggestedFoodRemote &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._nationalities, _nationalities) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality().equals(other._diets, _diets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_nationalities),
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_diets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SuggestedFoodRemoteCopyWith<_$_SuggestedFoodRemote> get copyWith =>
      __$$_SuggestedFoodRemoteCopyWithImpl<_$_SuggestedFoodRemote>(
          this, _$identity);
}

abstract class _SuggestedFoodRemote implements SuggestedFoodRemote {
  factory _SuggestedFoodRemote(
      {final List<String> names,
      final List<String> nationalities,
      final List<String> ingredients,
      final List<String> diets}) = _$_SuggestedFoodRemote;

  @override
  List<String> get names;
  @override
  List<String> get nationalities;
  @override
  List<String> get ingredients;
  @override
  List<String> get diets;
  @override
  @JsonKey(ignore: true)
  _$$_SuggestedFoodRemoteCopyWith<_$_SuggestedFoodRemote> get copyWith =>
      throw _privateConstructorUsedError;
}
