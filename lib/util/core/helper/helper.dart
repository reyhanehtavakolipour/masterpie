

import 'dart:math';

import 'package:masterpie/feature/foods/data/remote/model/food_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';
import 'package:masterpie/feature/foods/data/remote/model/generic_food_remote_model.dart';

int calculateDifferenceInDays(DateTime date1, DateTime date2) {

  Duration difference = date2.difference(date1);

  int differenceInDays = difference.inDays;

  return differenceInDays;
}


int generateRandomNumber(int length) {
  Random random = Random();
  int randomNumber = random.nextInt(length);
  print('random_number: $randomNumber');
  return randomNumber;
}

List<String> sortAlphabetically(List<String> inputList) {
  List<String> sortedList = List.from(inputList);
  sortedList.sort((a, b) => a.compareTo(b));
  return sortedList;
}

DateTime calculateNextDate(DateTime inputDate, int interval, String intervalType) {
  if (interval <= 0) {
    return DateTime.now();
  }
  DateTime resultDate;

  switch (intervalType) {
    case 'month':
      resultDate = DateTime.utc(
        inputDate.year,
        inputDate.month + interval,
        inputDate.day,
        inputDate.hour,
        inputDate.minute,
        inputDate.second,
        inputDate.millisecond,
        inputDate.microsecond,
      );
      break;
    case 'year':
      resultDate = DateTime.utc(
        inputDate.year + interval,
        inputDate.month,
        inputDate.day,
        inputDate.hour,
        inputDate.minute,
        inputDate.second,
        inputDate.millisecond,
        inputDate.microsecond,
      );
      break;
    default:
      return DateTime.now();
  }

  if(intervalType == 'month'){
    while (resultDate.month != (inputDate.month + interval) % 12) {
      resultDate = resultDate.subtract(const Duration(days: 1));
    }
  }

  if (inputDate.month == 2 && inputDate.day == 29 && !isLeapYear(resultDate.year)) {
    resultDate = DateTime.utc(resultDate.year, 2, 28);
  }

  return resultDate;
}

bool isLeapYear(int year) {
  if (year % 4 != 0) {
    return false;
  } else if (year % 100 != 0) {
    return true;
  } else if (year % 400 != 0) {
    return false;
  } else {
    return true;
  }
}



int getIngredientAmountInGrams(String unit){
  if(unit.contains('oz')){
    return 28;
  }else if(unit.contains('tsp')){
    return 5;
  }else if(unit.contains('tbsp') || unit.contains('tablespoon')){
    return 15;
  }else if(unit.contains('cup')){
    return 240;
  }else if(unit.contains('pt')){
    return 480;
  }else if(unit.contains('qt')){
    return 960;
  }else if(unit.contains('gl')){
    return 3840;
  }else if(unit.contains('stick')){
    return 113;
  }else if(unit.contains('lb')){
    return 454;
  }else if(unit.contains('package')){
    return 280;
  }
  return 0;
}

double roundToQuarter(double number) {
  return (number * 4).round() / 4;
}

FoodRemote fromGenericRecipeRemote(GenericFoodRemote food){

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



  return FoodRemote(
      id: food.id,
      calorie: calorie,
      protein: protein,
      carb: carb,
      fat: fat,
      units: units,
      foodTypeRemote: FoodTypeRemote.meal,
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