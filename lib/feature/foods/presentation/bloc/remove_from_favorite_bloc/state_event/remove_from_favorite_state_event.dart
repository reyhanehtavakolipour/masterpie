

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'remove_from_favorite_state_event.freezed.dart';



@freezed
abstract class RemoveFromMyFavoriteEvent with _$RemoveFromMyFavoriteEvent {

  const factory RemoveFromMyFavoriteEvent.onRemoveFromMyFavorite(Food food) = RemoveFoodFromMyFavorites;

  const factory RemoveFromMyFavoriteEvent.onReset() = Reset;

}



@freezed
abstract class RemoveFromMyFavoriteState with _$RemoveFromMyFavoriteState{
  const factory RemoveFromMyFavoriteState.initial()= RemoveFromMyFavoriteInitialState;
  const factory RemoveFromMyFavoriteState.loading()= RemoveFromMyFavoriteLoadingState;
  const factory RemoveFromMyFavoriteState.error(String message)= RemoveFromMyFavoriteErrorState;
  const factory RemoveFromMyFavoriteState.loaded(Food food)= RemoveFromMyFavoriteLoadedState;
}

