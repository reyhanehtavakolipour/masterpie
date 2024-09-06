

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/meal_plan_model.dart';

part 'meal_plan_state_event.freezed.dart';



@freezed
abstract class MealPlanEvent with _$MealPlanEvent {

  const factory MealPlanEvent.onSaveMealPlan(MealPlan mealPlan) = SaveMealPlan;

  const factory MealPlanEvent.onGetMealPlans() = GetMealPLans;

  const factory MealPlanEvent.onReset() = Reset;

}



@freezed
abstract class MealPlanState with _$MealPlanState{
  const factory MealPlanState.initial()= MealPlanInitialState;
  const factory MealPlanState.loading()= MealPlanLoadingState;
  const factory MealPlanState.error(String message)= MealPlanErrorState;
  const factory MealPlanState.loaded()= MealPlanSavedState;
  const factory MealPlanState.plansLoaded(List<MealPlan> mealPlans)= MealPlansLoadedState;

}

