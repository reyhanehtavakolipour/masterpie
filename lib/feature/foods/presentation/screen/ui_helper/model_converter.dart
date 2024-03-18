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
      name: food.name
  );
}