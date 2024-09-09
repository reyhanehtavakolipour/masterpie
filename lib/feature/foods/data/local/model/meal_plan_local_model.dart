

import 'dart:convert';

import 'package:masterpie/feature/foods/data/local/model/food_local_model.dart';
import 'package:masterpie/util/core/helper/request_api.dart';


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
    return MealPlanLocal(
      mealPlanId: parsedJson['mealPlanId'],
      foods: (jsonDecode(parsedJson['foods']) as List)
          .map((foodJson) => FoodLocal.fromJson(foodJson))
          .toList(),
      totalMacro: (jsonDecode(parsedJson['totalMacro']) as List<dynamic>)
          .map((item) => item as double)
          .toList(),
      name: parsedJson['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mealPlanId'] = generateRandomId();
    data['foods'] = jsonEncode(foods.map((food) => food.toJson()).toList());
    data['totalMacro'] = jsonEncode(totalMacro);
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