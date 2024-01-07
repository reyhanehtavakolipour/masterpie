

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'add_or_update_my_favorite_state_event.freezed.dart';



@freezed
abstract class AddOrUpdateMyFavoriteEvent with _$AddOrUpdateMyFavoriteEvent {

  const factory AddOrUpdateMyFavoriteEvent.onAddToMyFavorite(Food food) = AddFoodToMyFavorites;

  const factory AddOrUpdateMyFavoriteEvent.onUpdateMyFavorite(Food food) = UpdateMyFavoriteFood;

  const factory AddOrUpdateMyFavoriteEvent.onAddOrUpdateMyFavorite(Food food) = AddOrUpdateFoodMyFavorites;

  const factory AddOrUpdateMyFavoriteEvent.onReset() = Reset;

}



@freezed
abstract class AddOrUpdateMyFavoriteState with _$AddOrUpdateMyFavoriteState{
  const factory AddOrUpdateMyFavoriteState.initial()= AddOrUpdateMyFavoriteInitialState;
  const factory AddOrUpdateMyFavoriteState.loading()= AddOrUpdateMyFavoriteLoadingState;
  const factory AddOrUpdateMyFavoriteState.error(String message)= AddOrUpdateMyFavoriteErrorState;
  const factory AddOrUpdateMyFavoriteState.loaded(Food food)= AddOrUpdateMyFavoriteLoadedState;
}

