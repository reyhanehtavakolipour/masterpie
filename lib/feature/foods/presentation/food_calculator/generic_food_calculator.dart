

import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/edit_generic_food_info_ui_model.dart';

import '../../domain/model/food_type.dart';


class GenericFoodCalculator{

   List<GenericFood> visibleFoods= [];


   GenericFoodCalculator({required this.visibleFoods});


  GenericFoodInformation initFoodListBuilder(GenericFood food){
    List<List<double>> calorie = [];
    List<List<double>> protein = [];
    List<List<double>> carb = [];
    List<List<double>> fat = [];
    List<double> servingAmount = [];
    List<List<double>> servingAmounts = [];
    List<String> unit= [];
    List<List<String>> units= [];
    double count = food.count;

      if(food.foodType == FoodType.groceryProduct){

        List<double> groceryCalorie= [];
        food.calorie[0].forEach((element) {
          groceryCalorie.add(double.parse(element));
        });
        calorie= [groceryCalorie];

        List<double> groceryProtein= [];
        food.protein[0].forEach((element) {
          groceryProtein.add(double.parse(element));
        });
        protein= [groceryProtein];

        List<double> groceryCarb= [];
        food.carb[0].forEach((element) {
          groceryCarb.add(double.parse(element));
        });
        carb= [groceryCarb];

        List<double> groceryFat= [];
        food.fat[0].forEach((element) {
          groceryFat.add(double.parse(element));
        });
        fat= [groceryFat];


        List<double> groceryServingAmounts= [];
        food.servingAmounts[0].forEach((element) {
          if(element.isEmpty){
            groceryServingAmounts.add(0.0);
          }else{
            groceryServingAmounts.add(double.parse(element));
          }
        });
        servingAmounts= [groceryServingAmounts];

        List<String> groceryUnits= [];
        food.units[0].forEach((element) {
          groceryUnits.add(element);
        });
        units= [groceryUnits];

      }else{

        for (int i = 0; i < food.calorie.length; i++) {
          List<double> ingredientCalorie= [];
          for(int j = 0; j < food.calorie[i].length; j++){
            double servingCount = double.parse(food.servingIngredientsCount[i][j].isEmpty ? '1' : food.servingIngredientsCount[i][j]);
            ingredientCalorie.add(double.parse(food.calorie[i][j].isEmpty ? '0' : food.calorie[i][j])*servingCount);
          }
          calorie.add(ingredientCalorie);
        }

        for (int i = 0; i < food.protein.length; i++) {
          List<double> ingredientProtein= [];
          for(int j = 0; j < food.protein[i].length; j++){
            double servingCount = double.parse(food.servingIngredientsCount[i][j].isEmpty ? '1' : food.servingIngredientsCount[i][j]);
            ingredientProtein.add(double.parse(food.protein[i][j].isEmpty ? '0' : food.protein[i][j])*servingCount);
          }
          protein.add(ingredientProtein);
        }

        for (int i = 0; i < food.carb.length; i++) {
          List<double> ingredientCarb= [];
          for(int j = 0; j < food.carb[i].length; j++){
            double servingCount = double.parse(food.servingIngredientsCount[i][j].isEmpty ? '1' : food.servingIngredientsCount[i][j]);
            ingredientCarb.add(double.parse(food.carb[i][j].isEmpty ? '0' : food.carb[i][j])*servingCount);
          }
          carb.add(ingredientCarb);
        }

        for (int i = 0; i < food.fat.length; i++) {
          List<double> ingredientFat= [];
          for(int j = 0; j < food.calorie[i].length; j++){
            double servingCount = double.parse(food.servingIngredientsCount[i][j].isEmpty ? '1' : food.servingIngredientsCount[i][j]);
            ingredientFat.add(double.parse(food.fat[i][j].isEmpty ? '0' : food.fat[i][j])*servingCount);
          }
          fat.add(ingredientFat);
        }
      }




      return GenericFoodInformation(
          calorie: calorie,
          protein: protein,
          carb: carb,
          fat: fat,
          count: count,
          servingAmounts: servingAmounts,
          servingAmount: servingAmount,
          unit: unit,
          units: units,
          isFoodAdded: count > 0
      );
  }


  void addFoodByOne(GenericFood food){
    List<GenericFood> foods = [];
    for(int i = 0; i < visibleFoods.length; i++){
      if(visibleFoods[i].id == food.id){
        GenericFood food = visibleFoods[i];
        foods.add(food.copyWith(count: food.count + 1));
      }else{
        foods.add(visibleFoods[i]);
      }
    }
    visibleFoods= [];
    visibleFoods.addAll(foods);
  }


  void removeFoodByOne(GenericFood food){
    List<GenericFood> foods = [];
    for(int i = 0; i < visibleFoods.length; i++){
      if(visibleFoods[i].id == food.id){
        GenericFood food = visibleFoods[i];
        foods.add(food.copyWith(count: food.count - 1 >= 0 ? food.count - 1 : 0));
      }else{
        foods.add(visibleFoods[i]);
      }
    }
    visibleFoods= [];
    visibleFoods.addAll(foods);
  }


}


