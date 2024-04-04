

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';

import '../../../../domain/model/food_model.dart';
part 'recipes_state_event.freezed.dart';



@freezed
abstract class RecipesEvent with _$RecipesEvent {

  const factory RecipesEvent.onGetRecipes(String query) = GetRecipesEvent;
  const factory RecipesEvent.onReset() = Reset;

}



@freezed
abstract class RecipesState with _$RecipesState{
  const factory RecipesState.initial()= RecipesInitialState;
  const factory RecipesState.loading()= RecipesLoadingState;
  const factory RecipesState.error(String message)= RecipesErrorState;
  const factory RecipesState.loaded({required List<GenericFood> foods})= RecipesLoadedState;
}

