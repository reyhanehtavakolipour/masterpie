

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';

part 'suggest_food_state_event.freezed.dart';



@freezed
abstract class SuggestFoodEvent with _$SuggestFoodEvent {

  const factory SuggestFoodEvent.onReset() = Reset;


  const factory SuggestFoodEvent.onSuggestFood(
      List<String>? ingredientsIncluded,
      List<String>? allergies,
      String? nationality,
      String? diet
      ) = SuggestMealEvent;

}



@freezed
abstract class SuggestFoodState with _$SuggestFoodState{
  const factory SuggestFoodState.initial()= SuggestFoodStateInitialState;
  const factory SuggestFoodState.loading()= SuggestFoodStateLoadingState;
  const factory SuggestFoodState.error(String message)= SuggestFoodStateErrorState;
  const factory SuggestFoodState.loaded({required Food food})= SuggestFoodStateLoadedState;
}