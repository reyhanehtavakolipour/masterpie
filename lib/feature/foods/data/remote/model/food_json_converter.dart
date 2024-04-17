

import 'package:masterpie/feature/foods/data/remote/model/food_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';

Map<String, dynamic> toFoodJson(FoodRemote foodRemote) {
  return {
    'name': foodRemote.name,
    'count': foodRemote.count.toString(),
    'food_type': foodRemote.foodTypeRemote.name,
    'calorie': foodRemote.calorie,
    'protein': foodRemote.protein,
    'carb': foodRemote.carb,
    'fat': foodRemote.fat,
    'serving_amounts': foodRemote.servingAmounts,
    'units': foodRemote.units,
    'serving_amount': foodRemote.servingAmount,
    'unit': foodRemote.unit,
    'serving_ingredients_count': foodRemote.servingIngredientsCount,
    'ingredients': foodRemote.ingredients,
    'recipe': foodRemote.recipe
  };
}


Map<String, dynamic> toFoodsJson(List<FoodRemote> foodsRemote, String date) {
  return {
    'foods': foodsRemote.map((food) => toFoodJson(food)).toList(),
    'date' : date
  };
}



FoodRemote fromFoodJson(Map<String, dynamic> food) {
  return FoodRemote(
    name: food['name'],
    count: double.parse(food['count'].toString()),
    foodTypeRemote: food['food_type'] == 'groceryProduct' ? FoodTypeRemote.groceryProduct : FoodTypeRemote.meal,
    calorie: (food['calorie'] as List<dynamic>).map((item) => item.toString()).toList(),
    protein: (food['protein'] as List<dynamic>).map((item) => item.toString()).toList(),
    carb: (food['carb'] as List<dynamic>).map((item) => item.toString()).toList(),
    fat: (food['fat'] as List<dynamic>).map((item) => item.toString()).toList(),
    servingAmounts: (food['serving_amounts'] as List<dynamic>).map((item) => item.toString()).toList(),
    units: (food['units'] as List<dynamic>).map((item) => item.toString()).toList(),
    servingAmount: food['serving_amount'],
    unit: food['unit'],
    servingIngredientsCount: (food['serving_ingredients_count'] as List<dynamic>).map((item) => item.toString()).toList(),
    ingredients: (food['ingredients'] as List<dynamic>).map((item) => item.toString()).toList(),
    recipe: food['recipe']
    );
}


List<FoodRemote> fromFoodsJson(Map<String, dynamic> data) {
  return (data['foods'] as List).map((food) => fromFoodJson(food)).toList();
}
