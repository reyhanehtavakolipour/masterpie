// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Food {
  String get id => throw _privateConstructorUsedError;
  FoodType get foodType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get barcode => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;

  /// for both groceries and meals, (groceries: the first(the only item in the list) element is the value)
  List<String> get calorie => throw _privateConstructorUsedError;
  List<String> get protein => throw _privateConstructorUsedError;
  List<String> get carb => throw _privateConstructorUsedError;
  List<String> get fat => throw _privateConstructorUsedError;
  List<String> get servingAmounts => throw _privateConstructorUsedError;
  List<String> get units => throw _privateConstructorUsedError;

  ///only for meals
  List<String> get ingredients => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  int get servingAmount => throw _privateConstructorUsedError;
  String get recipe => throw _privateConstructorUsedError;
  String get nationality => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get diets => throw _privateConstructorUsedError;
  List<String> get allergies => throw _privateConstructorUsedError;
  List<String> get servingIngredientsCount =>
      throw _privateConstructorUsedError;

  /// how many of the food(either meal or grocery)?
  double get count => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
  @useResult
  $Res call(
      {String id,
      FoodType foodType,
      String name,
      String barcode,
      String brandName,
      String image,
      List<String> calorie,
      List<String> protein,
      List<String> carb,
      List<String> fat,
      List<String> servingAmounts,
      List<String> units,
      List<String> ingredients,
      String unit,
      int servingAmount,
      String recipe,
      String nationality,
      String description,
      List<String> diets,
      List<String> allergies,
      List<String> servingIngredientsCount,
      double count});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? foodType = null,
    Object? name = null,
    Object? barcode = null,
    Object? brandName = null,
    Object? image = null,
    Object? calorie = null,
    Object? protein = null,
    Object? carb = null,
    Object? fat = null,
    Object? servingAmounts = null,
    Object? units = null,
    Object? ingredients = null,
    Object? unit = null,
    Object? servingAmount = null,
    Object? recipe = null,
    Object? nationality = null,
    Object? description = null,
    Object? diets = null,
    Object? allergies = null,
    Object? servingIngredientsCount = null,
    Object? count = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      foodType: null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      calorie: null == calorie
          ? _value.calorie
          : calorie // ignore: cast_nullable_to_non_nullable
              as List<String>,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as List<String>,
      carb: null == carb
          ? _value.carb
          : carb // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as List<String>,
      servingAmounts: null == servingAmounts
          ? _value.servingAmounts
          : servingAmounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      servingAmount: null == servingAmount
          ? _value.servingAmount
          : servingAmount // ignore: cast_nullable_to_non_nullable
              as int,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      diets: null == diets
          ? _value.diets
          : diets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergies: null == allergies
          ? _value.allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      servingIngredientsCount: null == servingIngredientsCount
          ? _value.servingIngredientsCount
          : servingIngredientsCount // ignore: cast_nullable_to_non_nullable
              as List<String>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FoodImplCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$FoodImplCopyWith(
          _$FoodImpl value, $Res Function(_$FoodImpl) then) =
      __$$FoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      FoodType foodType,
      String name,
      String barcode,
      String brandName,
      String image,
      List<String> calorie,
      List<String> protein,
      List<String> carb,
      List<String> fat,
      List<String> servingAmounts,
      List<String> units,
      List<String> ingredients,
      String unit,
      int servingAmount,
      String recipe,
      String nationality,
      String description,
      List<String> diets,
      List<String> allergies,
      List<String> servingIngredientsCount,
      double count});
}

/// @nodoc
class __$$FoodImplCopyWithImpl<$Res>
    extends _$FoodCopyWithImpl<$Res, _$FoodImpl>
    implements _$$FoodImplCopyWith<$Res> {
  __$$FoodImplCopyWithImpl(_$FoodImpl _value, $Res Function(_$FoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? foodType = null,
    Object? name = null,
    Object? barcode = null,
    Object? brandName = null,
    Object? image = null,
    Object? calorie = null,
    Object? protein = null,
    Object? carb = null,
    Object? fat = null,
    Object? servingAmounts = null,
    Object? units = null,
    Object? ingredients = null,
    Object? unit = null,
    Object? servingAmount = null,
    Object? recipe = null,
    Object? nationality = null,
    Object? description = null,
    Object? diets = null,
    Object? allergies = null,
    Object? servingIngredientsCount = null,
    Object? count = null,
  }) {
    return _then(_$FoodImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      foodType: null == foodType
          ? _value.foodType
          : foodType // ignore: cast_nullable_to_non_nullable
              as FoodType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      calorie: null == calorie
          ? _value._calorie
          : calorie // ignore: cast_nullable_to_non_nullable
              as List<String>,
      protein: null == protein
          ? _value._protein
          : protein // ignore: cast_nullable_to_non_nullable
              as List<String>,
      carb: null == carb
          ? _value._carb
          : carb // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fat: null == fat
          ? _value._fat
          : fat // ignore: cast_nullable_to_non_nullable
              as List<String>,
      servingAmounts: null == servingAmounts
          ? _value._servingAmounts
          : servingAmounts // ignore: cast_nullable_to_non_nullable
              as List<String>,
      units: null == units
          ? _value._units
          : units // ignore: cast_nullable_to_non_nullable
              as List<String>,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<String>,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      servingAmount: null == servingAmount
          ? _value.servingAmount
          : servingAmount // ignore: cast_nullable_to_non_nullable
              as int,
      recipe: null == recipe
          ? _value.recipe
          : recipe // ignore: cast_nullable_to_non_nullable
              as String,
      nationality: null == nationality
          ? _value.nationality
          : nationality // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      diets: null == diets
          ? _value._diets
          : diets // ignore: cast_nullable_to_non_nullable
              as List<String>,
      allergies: null == allergies
          ? _value._allergies
          : allergies // ignore: cast_nullable_to_non_nullable
              as List<String>,
      servingIngredientsCount: null == servingIngredientsCount
          ? _value._servingIngredientsCount
          : servingIngredientsCount // ignore: cast_nullable_to_non_nullable
              as List<String>,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$FoodImpl implements _Food {
  _$FoodImpl(
      {this.id = '',
      this.foodType = FoodType.groceryProduct,
      this.name = '',
      this.barcode = '',
      this.brandName = '',
      this.image = '',
      final List<String> calorie = const [],
      final List<String> protein = const [],
      final List<String> carb = const [],
      final List<String> fat = const [],
      final List<String> servingAmounts = const [],
      final List<String> units = const [],
      final List<String> ingredients = const [],
      this.unit = '',
      this.servingAmount = 0,
      this.recipe = '',
      this.nationality = '',
      this.description = '',
      final List<String> diets = const [],
      final List<String> allergies = const [],
      final List<String> servingIngredientsCount = const [],
      this.count = 0.0})
      : _calorie = calorie,
        _protein = protein,
        _carb = carb,
        _fat = fat,
        _servingAmounts = servingAmounts,
        _units = units,
        _ingredients = ingredients,
        _diets = diets,
        _allergies = allergies,
        _servingIngredientsCount = servingIngredientsCount;

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final FoodType foodType;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String barcode;
  @override
  @JsonKey()
  final String brandName;
  @override
  @JsonKey()
  final String image;

  /// for both groceries and meals, (groceries: the first(the only item in the list) element is the value)
  final List<String> _calorie;

  /// for both groceries and meals, (groceries: the first(the only item in the list) element is the value)
  @override
  @JsonKey()
  List<String> get calorie {
    if (_calorie is EqualUnmodifiableListView) return _calorie;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calorie);
  }

  final List<String> _protein;
  @override
  @JsonKey()
  List<String> get protein {
    if (_protein is EqualUnmodifiableListView) return _protein;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_protein);
  }

  final List<String> _carb;
  @override
  @JsonKey()
  List<String> get carb {
    if (_carb is EqualUnmodifiableListView) return _carb;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carb);
  }

  final List<String> _fat;
  @override
  @JsonKey()
  List<String> get fat {
    if (_fat is EqualUnmodifiableListView) return _fat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fat);
  }

  final List<String> _servingAmounts;
  @override
  @JsonKey()
  List<String> get servingAmounts {
    if (_servingAmounts is EqualUnmodifiableListView) return _servingAmounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servingAmounts);
  }

  final List<String> _units;
  @override
  @JsonKey()
  List<String> get units {
    if (_units is EqualUnmodifiableListView) return _units;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_units);
  }

  ///only for meals
  final List<String> _ingredients;

  ///only for meals
  @override
  @JsonKey()
  List<String> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  @JsonKey()
  final String unit;
  @override
  @JsonKey()
  final int servingAmount;
  @override
  @JsonKey()
  final String recipe;
  @override
  @JsonKey()
  final String nationality;
  @override
  @JsonKey()
  final String description;
  final List<String> _diets;
  @override
  @JsonKey()
  List<String> get diets {
    if (_diets is EqualUnmodifiableListView) return _diets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_diets);
  }

  final List<String> _allergies;
  @override
  @JsonKey()
  List<String> get allergies {
    if (_allergies is EqualUnmodifiableListView) return _allergies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allergies);
  }

  final List<String> _servingIngredientsCount;
  @override
  @JsonKey()
  List<String> get servingIngredientsCount {
    if (_servingIngredientsCount is EqualUnmodifiableListView)
      return _servingIngredientsCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_servingIngredientsCount);
  }

  /// how many of the food(either meal or grocery)?
  @override
  @JsonKey()
  final double count;

  @override
  String toString() {
    return 'Food(id: $id, foodType: $foodType, name: $name, barcode: $barcode, brandName: $brandName, image: $image, calorie: $calorie, protein: $protein, carb: $carb, fat: $fat, servingAmounts: $servingAmounts, units: $units, ingredients: $ingredients, unit: $unit, servingAmount: $servingAmount, recipe: $recipe, nationality: $nationality, description: $description, diets: $diets, allergies: $allergies, servingIngredientsCount: $servingIngredientsCount, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.foodType, foodType) ||
                other.foodType == foodType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.image, image) || other.image == image) &&
            const DeepCollectionEquality().equals(other._calorie, _calorie) &&
            const DeepCollectionEquality().equals(other._protein, _protein) &&
            const DeepCollectionEquality().equals(other._carb, _carb) &&
            const DeepCollectionEquality().equals(other._fat, _fat) &&
            const DeepCollectionEquality()
                .equals(other._servingAmounts, _servingAmounts) &&
            const DeepCollectionEquality().equals(other._units, _units) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.servingAmount, servingAmount) ||
                other.servingAmount == servingAmount) &&
            (identical(other.recipe, recipe) || other.recipe == recipe) &&
            (identical(other.nationality, nationality) ||
                other.nationality == nationality) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._diets, _diets) &&
            const DeepCollectionEquality()
                .equals(other._allergies, _allergies) &&
            const DeepCollectionEquality().equals(
                other._servingIngredientsCount, _servingIngredientsCount) &&
            (identical(other.count, count) || other.count == count));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        foodType,
        name,
        barcode,
        brandName,
        image,
        const DeepCollectionEquality().hash(_calorie),
        const DeepCollectionEquality().hash(_protein),
        const DeepCollectionEquality().hash(_carb),
        const DeepCollectionEquality().hash(_fat),
        const DeepCollectionEquality().hash(_servingAmounts),
        const DeepCollectionEquality().hash(_units),
        const DeepCollectionEquality().hash(_ingredients),
        unit,
        servingAmount,
        recipe,
        nationality,
        description,
        const DeepCollectionEquality().hash(_diets),
        const DeepCollectionEquality().hash(_allergies),
        const DeepCollectionEquality().hash(_servingIngredientsCount),
        count
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      __$$FoodImplCopyWithImpl<_$FoodImpl>(this, _$identity);
}

abstract class _Food implements Food {
  factory _Food(
      {final String id,
      final FoodType foodType,
      final String name,
      final String barcode,
      final String brandName,
      final String image,
      final List<String> calorie,
      final List<String> protein,
      final List<String> carb,
      final List<String> fat,
      final List<String> servingAmounts,
      final List<String> units,
      final List<String> ingredients,
      final String unit,
      final int servingAmount,
      final String recipe,
      final String nationality,
      final String description,
      final List<String> diets,
      final List<String> allergies,
      final List<String> servingIngredientsCount,
      final double count}) = _$FoodImpl;

  @override
  String get id;
  @override
  FoodType get foodType;
  @override
  String get name;
  @override
  String get barcode;
  @override
  String get brandName;
  @override
  String get image;
  @override

  /// for both groceries and meals, (groceries: the first(the only item in the list) element is the value)
  List<String> get calorie;
  @override
  List<String> get protein;
  @override
  List<String> get carb;
  @override
  List<String> get fat;
  @override
  List<String> get servingAmounts;
  @override
  List<String> get units;
  @override

  ///only for meals
  List<String> get ingredients;
  @override
  String get unit;
  @override
  int get servingAmount;
  @override
  String get recipe;
  @override
  String get nationality;
  @override
  String get description;
  @override
  List<String> get diets;
  @override
  List<String> get allergies;
  @override
  List<String> get servingIngredientsCount;
  @override

  /// how many of the food(either meal or grocery)?
  double get count;
  @override
  @JsonKey(ignore: true)
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
