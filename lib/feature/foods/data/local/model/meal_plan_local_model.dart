

import 'package:masterpie/feature/foods/data/local/model/food_local_model.dart';


class MealPlanLocal{

  String mealPlanId;
  List<FoodLocal> foods;
  List<double> totalMacro;
  String name;




  MealPlanLocal({
    required this.mealPlanId,
    required this.foods,
    required this.totalMacro,
    required this.name
  });


  factory MealPlanLocal.fromJson(Map<String, dynamic> parsedJson) {
    var foodsList = parsedJson['foods'] as List;
    List<FoodLocal> foods = foodsList.map((food) => FoodLocal.fromJson(food)).toList();

    var totalMacroList = parsedJson['totalMacro'] as List;
    List<double> totalMacro = totalMacroList.map((macro) => double.parse(macro.toString())).toList();

    return MealPlanLocal(
      mealPlanId: parsedJson['mealPlanId'],
      foods: foods,
      totalMacro: totalMacro,
      name: parsedJson['name']
    );
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mealPlanId'] = mealPlanId;
    data['foods'] = foods;
    data['totalMacro'] = totalMacro;
    data['name'] = name;
    return data;
  }

  @override
  String toString() {
    return 'mealPlanId: $mealPlanId,'
        'foods: $foods,'
        'name: $name,'
        'totalMacro: $totalMacro';
  }

}