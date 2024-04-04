import '../../../domain/model/food_model.dart';
import '../../../domain/model/food_type.dart';
import '../../../domain/model/generic_food_model.dart';

Food fromGenericGrocery(GenericFood food){
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
  );
}


Food fromGenericRecipe(GenericFood food){

  List<String> calorie= [];
  List<String> protein= [];
  List<String> carb= [];
  List<String> fat= [];
  List<String> servingAmounts= [];
  List<String> units= [];
  List<String> servingIngredientsCount= [];


  for (int i = 0; i < food.ingredients.length; i++){
    calorie.add(food.calorie[i][0]);
    protein.add(food.protein[i][0]);
    carb.add(food.carb[i][0]);
    fat.add(food.fat[i][0]);
    servingAmounts.add(food.servingAmounts[i][0]);
    units.add(food.units[i][0]);
    servingIngredientsCount.add(food.servingIngredientsCount[i][0]);
  }


  return Food(
      id: food.id,
      calorie: calorie,
      protein: protein,
      carb: carb,
      fat: fat,
      servingAmounts: servingAmounts,
      units: units,
      foodType: FoodType.meal,
      count: food.count,
      name: food.name,
      ingredients: food.ingredients,
      servingAmount: food.servingAmount[0],
      unit: food.unit[0],
      recipe: food.recipe,
      servingIngredientsCount: servingIngredientsCount
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