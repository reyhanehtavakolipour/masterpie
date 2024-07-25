
import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_type.dart';

part 'generic_food_model.freezed.dart';



@freezed
class GenericFood with _$GenericFood{

  factory GenericFood({
    @Default('') String id,
    @Default(FoodType.meal) FoodType foodType,
    @Default('') String name,
    @Default('') String barcode,
    @Default('') String brandName,
    @Default('') String description,
    @Default('') String nationality,
    @Default('') String image,
    @Default([]) List<double> servingAmount,
    @Default([]) List<String> unit,
    @Default([]) List<String> ingredients,
    @Default([]) List<List<String>> servingIngredientsCount,
    @Default('') String recipe,
    @Default([]) List<List<String>> units,
    @Default([]) List<List<String>> calorie,
    @Default([]) List<List<String>> protein,
    @Default([]) List<List<String>> carb,
    @Default([]) List<List<String>> fat,
    @Default([]) List<String> diets,
    @Default([]) List<String> allergies,
    @Default(0.0) double count,
    @Default(1) int createdFromFatSecretRecipes
  })= _GenericFood;

}