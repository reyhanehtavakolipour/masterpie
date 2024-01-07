

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'international_meals_state_event.freezed.dart';



@freezed
abstract class InternationalMealsEvent with _$InternationalMealsEvent {

  const factory InternationalMealsEvent.onGetInternationalMeals(String query) = GetInternationalMealsEvent;
  const factory InternationalMealsEvent.onReset() = Reset;

}



@freezed
abstract class InternationalMealsState with _$InternationalMealsState{
  const factory InternationalMealsState.initial()= InternationalMealsInitialState;
  const factory InternationalMealsState.loading()= InternationalMealsLoadingState;
  const factory InternationalMealsState.error(String message)= InternationalMealsErrorState;
  const factory InternationalMealsState.loaded({required List<Food> foods})= InternationalMealsLoadedState;
}

