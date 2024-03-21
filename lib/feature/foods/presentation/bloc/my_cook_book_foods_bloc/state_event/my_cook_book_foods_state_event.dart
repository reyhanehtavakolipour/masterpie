

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'my_cook_book_foods_state_event.freezed.dart';



@freezed
abstract class MyCookBookFoodsEvent with _$MyCookBookFoodsEvent {

  const factory MyCookBookFoodsEvent.onGetMyCookBookFoods(String query) = CookBookFoods;
  const factory MyCookBookFoodsEvent.onImmediateSearchInMyCookBookFoods(Food food) = ImmediateSearchCookBookFoods;
  const factory MyCookBookFoodsEvent.onGetCookBookFoodsImmediately() = GetCookBookFoodsImmediately;
  const factory MyCookBookFoodsEvent.onReset() = Reset;

}



@freezed
abstract class MyCookBookFoodsState with _$MyCookBookFoodsState{
  const factory MyCookBookFoodsState.initial()= MyCookBookFoodsInitialState;
  const factory MyCookBookFoodsState.loading()= MyCookBookFoodsLoadingState;
  const factory MyCookBookFoodsState.error(String message)= MyCookBookFoodsErrorState;
  const factory MyCookBookFoodsState.loaded({required List<Food> foods})= MyCookBookFoodsLoadedState;
  const factory MyCookBookFoodsState.loadedImmediately({required List<Food> foods})= MyCookBookFoodsLoadedImmediatelyState;
  const factory MyCookBookFoodsState.immediateSearchInCookBookLoaded({required String cookBookId})= ImmediateSearchInFoodsLoadedState;
}

