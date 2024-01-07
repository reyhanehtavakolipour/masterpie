

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
import '../../../../domain/model/suggested_foods_portion_model.dart';

part 'suggest_portion_state_event.freezed.dart';



@freezed
abstract class SuggestFoodsPortionEvent with _$SuggestFoodsPortionEvent {

  const factory SuggestFoodsPortionEvent.onReset() = Reset;


  const factory SuggestFoodsPortionEvent.onSuggestFoodsPortion(
      List<Food> foods,
      List<List<double>> servingsRange,
      List<List<double>> macroGoalsRange,
      List<String> restriction
      ) = SuggestPortionsEvent;

}



@freezed
abstract class SuggestFoodsPortionState with _$SuggestFoodsPortionState{
  const factory SuggestFoodsPortionState.initial()= SuggestFoodsPortionInitialState;
  const factory SuggestFoodsPortionState.loading()= SuggestFoodsPortionLoadingState;
  const factory SuggestFoodsPortionState.error(String message)= SuggestFoodsPortionErrorState;
  const factory SuggestFoodsPortionState.loaded({required List<SuggestedFoodsPortion> suggestedFoodsPortions})= SuggestFoodsPortionLoadedState;
}