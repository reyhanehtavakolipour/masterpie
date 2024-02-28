
import 'package:freezed_annotation/freezed_annotation.dart';
import 'food_type_remote.dart';

part 'fat_secret_food_remote_model.freezed.dart';



@freezed
class FatSecretFoodRemote with _$FatSecretFoodRemote{

  factory FatSecretFoodRemote({
    // food id
    @Default('') String id,
    @Default(FoodTypeRemote.meal) FoodTypeRemote foodTypeRemote,
    @Default('') String name,
    @Default('') String barcode,
    @Default('') String brandName,
    @Default('') String description,
    @Default('') String nationality,
    @Default('') String image,
    @Default(0) int servingAmount,
    @Default('') String unit,
    @Default([]) List<String> ingredients,
    @Default([]) List<String> servingIngredientsCount,
    @Default('') String recipe,
    @Default([]) List<String> units,
    @Default([]) List<String> servingAmounts,
    @Default([]) List<String> calorie,
    @Default([]) List<String> protein,
    @Default([]) List<String> carb,
    @Default([]) List<String> fat,
    @Default([]) List<String> diets,
    @Default([]) List<String> allergies,
    /// how many of the food(either meal or grocery)?
    @Default(0.0) double count,
  })= _FatSecretFoodRemote;

}