


import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_remote_model.dart';

part 'meal_plan_remote_model.freezed.dart';


@freezed
class MealPlanRemote with _$MealPlanRemote{

  factory MealPlanRemote({
    @Default('') String mealPlanId,
    @Default([]) List<FoodRemote> foods,
    @Default('') String name,
    @Default([]) List<double> totalMacro,
  })= _MealPlanRemote;

}

