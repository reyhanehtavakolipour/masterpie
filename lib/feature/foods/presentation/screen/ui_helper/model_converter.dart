import '../../../domain/model/food_model.dart';
import '../../../domain/model/food_type.dart';
import '../../../domain/model/generic_food_model.dart';

Food fromGenericGrocery(GenericFood food){
  return Food(
      id: food.id,
      calorie: [food.calorie[0][0]],
      protein: [food.protein[0][0]],
      carb: [food.carb[0][0]],
      fat: [food.fat[0][0]],
      units: [food.units[0][0]],
      foodType: FoodType.groceryProduct,
      count: food.count,
      name: food.name,
    createdFromFatSecretRecipes: 0
  );
}


Food fromGenericRecipe(GenericFood food){

  List<String> calorie= [];
  List<String> protein= [];
  List<String> carb= [];
  List<String> fat= [];
  List<String> units= [];
  List<String> servingIngredientsCount= [];


  for (int i = 0; i < food.calorie.length; i++){
    calorie.add(food.calorie[i][0]);
    protein.add(food.protein[i][0]);
    carb.add(food.carb[i][0]);
    fat.add(food.fat[i][0]);
    if(i < food.units.length){
      units.add(food.units[i][0]);
      servingIngredientsCount.add(food.servingIngredientsCount[i][0]);
    }
  }



  return Food(
      id: food.id,
      calorie: calorie,
      protein: protein,
      carb: carb,
      fat: fat,
      units: units,
      foodType: FoodType.meal,
      count: food.count,
      name: food.name,
      ingredients: food.ingredients,
      servingAmount: food.servingAmount[0],
      unit: food.unit[0],
      recipe: food.recipe,
      servingIngredientsCount: servingIngredientsCount,
      createdFromFatSecretRecipes: food.createdFromFatSecretRecipes
  );
}


GenericFood toGenericFood(Food food){

  List<List<String>> calorie= [];
  List<List<String>> protein= [];
  List<List<String>> carb= [];
  List<List<String>> fat= [];
  List<List<String>> units= [];
  List<List<String>> servingIngredientsCount= [];


  for (int i = 0; i < food.calorie.length; i++){
    calorie.add([food.calorie[i]]);
    protein.add([food.protein[i]]);
    carb.add([food.carb[i]]);
    fat.add([food.fat[i]]);
    units.add([food.units[i]]);
    servingIngredientsCount.add(food.foodType == FoodType.meal ? [food.servingIngredientsCount[i]] : []);
  }



  return GenericFood(
      id: food.id,
      calorie: calorie,
      protein: protein,
      carb: carb,
      fat: fat,
      units: units,
      count: food.count,
      servingIngredientsCount: servingIngredientsCount,
      ingredients: food.ingredients,
      servingAmount: [food.servingAmount],
      recipe: food.recipe,
      unit: [food.unit],
      name: food.name,
    createdFromFatSecretRecipes:food.createdFromFatSecretRecipes
  );
}


List<GenericFood> toGenericFoods(List<Food> foods) {
  return foods.map((food) =>
      toGenericFood(food)
  ).toList();
}