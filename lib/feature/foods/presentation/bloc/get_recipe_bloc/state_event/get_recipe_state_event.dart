

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';

import '../../../../domain/model/food_model.dart';
part 'get_recipe_state_event.freezed.dart';



@freezed
abstract class GetRecipeEvent with _$GetRecipeEvent {

  const factory GetRecipeEvent.onGetRecipe(GenericFood genericFood) = GetRecipeDetailEvent;
  const factory GetRecipeEvent.onReset() = Reset;

}



@freezed
abstract class GetRecipeState with _$GetRecipeState{
  const factory GetRecipeState.initial()= GetRecipeInitialState;
  const factory GetRecipeState.loading()= GetRecipeLoadingState;
  const factory GetRecipeState.error(String message)= GetRecipeErrorState;
  const factory GetRecipeState.loaded({required GenericFood food})= GetRecipeLoadedState;
}

