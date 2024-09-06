


import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_model.dart';

part 'meal_plan_model.freezed.dart';


@freezed
class MealPlan with _$MealPlan{

  factory MealPlan({
    @Default('') String mealPlanId,
    @Default([]) List<Food> foods,
    @Default('') String name,
    @Default([]) List<double> totalMacro,
  })= _MealPlan;

}

