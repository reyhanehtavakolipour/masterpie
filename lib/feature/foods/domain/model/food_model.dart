


import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_type.dart';
part 'food_model.freezed.dart';


@freezed
class Food with _$Food{

  factory Food({
    @Default('') String id,
    @Default(FoodType.groceryProduct) FoodType foodType,
    @Default('') String name,
    @Default('') String barcode,
    @Default('') String brandName,
    @Default('') String image,

    /// for both groceries and meals, (groceries: the first(the only item in the list) element is the value)
    @Default([]) List<String> calorie,
    @Default([]) List<String> protein,
    @Default([]) List<String> carb,
    @Default([]) List<String> fat,
    @Default([]) List<String> units,
    @Default([]) List<String> servingAmounts,


    ///only for meals
    @Default([]) List<String> ingredients,
    @Default('') String unit,
    @Default(0.0) double servingAmount,
    @Default('') String recipe,
    @Default('') String nationality,
    @Default('') String description,
    @Default([]) List<String> diets,
    @Default([]) List<String> allergies,
    @Default([]) List<String> servingIngredientsCount,
    @Default('') String prepTime,


    /// how many of the food(either meal or grocery)?
    @Default(0.0) double count,
    @Default(1) int createdFromFatSecretRecipes
  })= _Food;

}

