

import 'package:masterpie/feature/foods/data/remote/model/food_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';
import 'package:masterpie/feature/foods/data/remote/model/meal_plan_remote_model.dart';
import 'package:masterpie/util/core/helper/request_api.dart';

Map<String, dynamic> toMealPlanJson(MealPlanRemote mealPlanRemote) {
  return {
    'id': generateRandomId(),
    'name': mealPlanRemote.name,
    'total_macro': mealPlanRemote.totalMacro,
    'foods': mealPlanRemote.foods.map((food) => {
      'id': food.id,
      'name': food.name,
      'type': food.foodTypeRemote == FoodTypeRemote.groceryProduct ? 'grocery' : 'meal',
      'count': food.count,
      'calorie': food.calorie.map((item) => item.toString()).toList(),
      'protein': food.protein.map((item) => item.toString()).toList(),
      'carb': food.carb.map((item) => item.toString()).toList(),
      'fat': food.fat.map((item) => item.toString()).toList(),
      'serving_ing_count': food.servingIngredientsCount.map((item) => item.toString()).toList(),
      'serving_amounts': food.servingAmounts.map((item) => item.toString()).toList(),
      'units': food.units.map((item) => item.toString()).toList(),
      'dish_type': food.dishType
    }).toList(),
  };
}


List<Map<String, dynamic>> toMealPlansJson(List<MealPlanRemote> mealPlansRemote) {
  return mealPlansRemote.map((plan) => toMealPlanJson(plan)).toList();
}



MealPlanRemote fromMealPlanJson(Map<String, dynamic> plan) {
  return MealPlanRemote(
    mealPlanId: plan['id'],
    name: plan['name'],
    totalMacro: (plan['total_macro'] as List<dynamic>).map((item) => double.parse(item.toString())).toList(),
    foods: (plan['foods'] as List<dynamic>).map((food) =>
        FoodRemote(
          id: food['id'],
          name: food['name'],
          foodTypeRemote: food['type'].toString() == 'grocery' ? FoodTypeRemote.groceryProduct : FoodTypeRemote.meal,
          count: food['count'],
          calorie: (food['calorie'] as List<dynamic>).map((item) => item.toString()).toList(),
          protein: (food['protein'] as List<dynamic>).map((item) => item.toString()).toList(),
          carb: (food['carb'] as List<dynamic>).map((item) => item.toString()).toList(),
          fat: (food['fat'] as List<dynamic>).map((item) => item.toString()).toList(),
          servingIngredientsCount: (food['serving_ing_count'] as List<dynamic>).map((item) => item.toString()).toList(),
          servingAmounts: (food['serving_amounts'] as List<dynamic>).map((item) => item.toString()).toList(),
          units: (food['units'] as List<dynamic>).map((item) => item.toString()).toList(),
          dishType: food['dish_type']
        )
    ).toList()
    );
}


List<MealPlanRemote> fromMealPlansJson(List<dynamic> data) {
  return (data).map((plan) => fromMealPlanJson(plan)).toList();
}
