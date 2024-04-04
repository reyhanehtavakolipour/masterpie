import '../../../domain/model/food_model.dart';
import '../../../domain/model/food_type.dart';
import '../../../domain/model/generic_food_model.dart';

Food fromGenericFood(GenericFood food){
  return Food(
      id: food.id,
      calorie: food.calorie[0],
      protein: food.protein[0],
      carb: food.carb[0],
      fat: food.fat[0],
      servingAmounts: food.servingAmounts[0],
      units: food.units[0],
      foodType: FoodType.groceryProduct,
      count: food.count,
      name: food.name,
    ingredients: food.ingredients,
    servingAmount: food.servingAmount[0],
    unit: food.unit[0],
    recipe: food.recipe,
    servingIngredientsCount: food.servingIngredientsCount[0]
  );
}


GenericFood toGenericFood(Food food){
  return GenericFood(
      id: food.id,
      calorie: [food.calorie],
      protein: [food.protein],
      carb: [food.carb],
      fat: [food.fat],
      servingAmounts: [food.servingAmounts],
      units: [food.units],
      foodType: FoodType.groceryProduct,
      count: food.count,
      name: food.name
  );
}


List<GenericFood> toGenericFoods(List<Food> foods) {
  return foods.map((food) =>
      toGenericFood(food)
  ).toList();
}