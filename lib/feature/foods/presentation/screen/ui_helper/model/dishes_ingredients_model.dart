


import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'dishes_ingredients_model.freezed.dart';


@freezed
class DishesIngredientsModel with _$DishesIngredientsModel{

  factory DishesIngredientsModel({
    @Default([]) List<List<String>> dishIngredients,
    @Default([]) List<Food> newMainDishesFoods,
    @Default([]) List<Food> newSideDishesFoods,
    @Default([]) List<String> newMainDishTypes,
    @Default([]) List<String> newSideDishTypes
  })= _DishesIngredientsModell;

}

