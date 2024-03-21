

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'add_or_update_my_cook_book_state_event.freezed.dart';



@freezed
abstract class AddOrUpdateMyCookBookEvent with _$AddOrUpdateMyCookBookEvent {

  const factory AddOrUpdateMyCookBookEvent.onAddToMyCookBook(Food food) = AddFoodToMyCookBook;

  const factory AddOrUpdateMyCookBookEvent.onUpdateMyCookBook(Food food) = UpdateMyCookBookFood;

  const factory AddOrUpdateMyCookBookEvent.onAddOrUpdateMyCookBook(Food food) = AddOrUpdateFoodMyCookBook;

  const factory AddOrUpdateMyCookBookEvent.onReset() = Reset;

}



@freezed
abstract class AddOrUpdateMyCookBookState with _$AddOrUpdateMyCookBookState{
  const factory AddOrUpdateMyCookBookState.initial()= AddOrUpdateMyCookBookInitialState;
  const factory AddOrUpdateMyCookBookState.loading()= AddOrUpdateMyCookBookLoadingState;
  const factory AddOrUpdateMyCookBookState.error(String message)= AddOrUpdateMyCookBookErrorState;
  const factory AddOrUpdateMyCookBookState.loaded(Food food)= AddOrUpdateMyCookBookLoadedState;
}

