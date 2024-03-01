

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
import '../../../../domain/model/food_type.dart';
part 'my_favorite_foods_state_event.freezed.dart';



@freezed
abstract class MyFavoriteFoodsEvent with _$MyFavoriteFoodsEvent {

  const factory MyFavoriteFoodsEvent.onGetMyFavoriteFoods(FoodType foodType, String query) = FavoriteFoods;
  const factory MyFavoriteFoodsEvent.onImmediateSearchInMyFavoriteFoods(Food food) = ImmediateSearchFavoriteFoods;
  const factory MyFavoriteFoodsEvent.onGetFavoriteFoodsImmediately() = GetFavoriteFoodsImmediately;
  const factory MyFavoriteFoodsEvent.onReset() = Reset;

}



@freezed
abstract class MyFavoriteFoodsState with _$MyFavoriteFoodsState{
  const factory MyFavoriteFoodsState.initial()= MyFavoriteFoodsInitialState;
  const factory MyFavoriteFoodsState.loading()= MyFavoriteFoodsLoadingState;
  const factory MyFavoriteFoodsState.error(String message)= MyFavoriteFoodsErrorState;
  const factory MyFavoriteFoodsState.loaded({required List<Food> foods})= MyFavoriteFoodsLoadedState;
  const factory MyFavoriteFoodsState.loadedImmediately({required List<Food> foods})= MyFavoriteFoodsLoadedImmediatelyState;
  const factory MyFavoriteFoodsState.immediateSearchInFavoritesLoaded({required String favoriteId})= ImmediateSearchInFoodsLoadedState;
}

