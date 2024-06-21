

import '../../domain/model/food_model.dart';
import '../../domain/model/food_type.dart';
import '../screen/ui_helper/model/edit_food_info_ui_model.dart';


class FoodCalculator{

  List<Food> visibleFoods= [];


  FoodCalculator({required this.visibleFoods});


  FoodInformation initFoodListBuilder(Food food){
    double calorie = 0;
    double protein = 0;
    double carb = 0;
    double fat = 0;
    double servingAmount = food.servingAmount;
    String foodUnit= food.unit;
    double quantity = food.count;

    if(food.foodType == FoodType.groceryProduct){
      calorie = double.parse(food.calorie[0]);
      protein = double.parse(food.protein[0]);
      carb = double.parse(food.carb[0]);
      fat = double.parse(food.fat[0]);

      String serving = food.servingAmounts[0];
      if(food.servingAmounts[0].isEmpty){
        serving = "0.0";
      }

      int? intValue = int.tryParse(serving);
      if (intValue != null) {
        servingAmount = double.parse(serving);
      } else {
        if(food.foodType == FoodType.meal){
          double doubleValue = double.parse(serving);
          servingAmount = doubleValue;
        }
      }

      foodUnit = food.units[0];
    }else{

      for (int i = 0; i < food.calorie.length; i++) {
        double servingCount = double.parse(food.servingIngredientsCount[i].isEmpty ? '1' : food.servingIngredientsCount[i]);
        calorie = calorie + double.parse(food.calorie[i].isEmpty ? '0' : food.calorie[i])*servingCount;
      }

      for (int i = 0; i < food.protein.length; i++) {
        double servingCount = double.parse(food.servingIngredientsCount[i].isEmpty ? '1' : food.servingIngredientsCount[i]);
        protein = protein + double.parse(food.protein[i].isEmpty ? '0' : food.protein[i])*servingCount;
      }

      for (int i = 0; i < food.carb.length; i++) {
        double servingCount = double.parse(food.servingIngredientsCount[i].isEmpty ? '1' : food.servingIngredientsCount[i]);
        carb = carb + double.parse(food.carb[i].isEmpty ? '0' : food.carb[i])*servingCount;
      }

      for (int i = 0; i < food.fat.length; i++) {
        double servingCount = double.parse(food.servingIngredientsCount[i].isEmpty ? '1' : food.servingIngredientsCount[i]);
        fat = fat + double.parse(food.fat[i].isEmpty ? '0' : food.fat[i])*servingCount;
      }
    }

    final totalCalorie = calorie * quantity;
    final totalProtein = protein * quantity;
    final totalCarb = carb * quantity;
    final totalFat = fat * quantity;


    return FoodInformation(
        calorie: calorie,
        protein: protein,
        carb: carb,
        fat: fat,
        quantity: quantity,
        totalCalorie: totalCalorie,
        totalProtein: totalProtein,
        totalCarb: totalCarb,
        totalFat: totalFat,
        servingQuantity: servingAmount,
        foodUnit: foodUnit,
        isFoodAdded: quantity > 0
    );
  }

  void updateFoodsChangedAfterEditingServingMacro(Food food, ServingMacroDialogValues value){
    if(isFoodChanged(food)){
      for (int i = 0; i < visibleFoods.length; i++) {
        if(visibleFoods[i].id == food.id){
          if(food.foodType == FoodType.groceryProduct){
            visibleFoods[i] = visibleFoods[i].copyWith(
                calorie: value.calorie,
                protein: value.protein,
                carb: value.carb,
                fat: value.fat,
                servingAmounts: [value.serving.toString()],
                units: [value.unit]
            );
          }else{
            visibleFoods[i] = visibleFoods[i].copyWith(
                calorie: value.calorie,
                protein: value.protein,
                carb: value.carb,
                fat: value.fat,
                servingAmount: value.serving,
                unit: value.unit
            );
          }
        }
      }
    }
  }


  void addFoodByOne(Food food){
    List<Food> foods = [];
    for(int i = 0; i < visibleFoods.length; i++){
      if(visibleFoods[i].id == food.id){
        Food food = visibleFoods[i];
        foods.add(food.copyWith(count: food.count + 1));
      }else{
        foods.add(visibleFoods[i]);
      }
    }
    visibleFoods= [];
    visibleFoods.addAll(foods);
  }


  void removeFoodByOne(Food food){
    List<Food> foods = [];
    for(int i = 0; i < visibleFoods.length; i++){
      if(visibleFoods[i].id == food.id){
        Food food = visibleFoods[i];
        foods.add(food.copyWith(count: food.count - 1 >= 0 ? food.count - 1 : 0));
      }else{
        foods.add(visibleFoods[i]);
      }
    }
    visibleFoods= [];
    visibleFoods.addAll(foods);
  }


  bool isFoodChanged(Food food){
    return visibleFoods.where((element) => element.id == food.id &&
        food.servingAmount== element.servingAmount &&
        food.unit== element.unit &&
        food.servingAmounts == element.servingAmounts &&
        food.units == element.units &&
        food.calorie == element.calorie &&
        food.protein == element.protein &&
        food.carb == element.carb &&
        food.fat == element.fat
    ).isNotEmpty;
  }

}