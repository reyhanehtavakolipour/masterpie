

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'remove_from_cook_book_state_event.freezed.dart';



@freezed
abstract class RemoveFromMyCookBookEvent with _$RemoveFromMyCookBookEvent {

  const factory RemoveFromMyCookBookEvent.onRemoveFromMyFavorite(Food food) = RemoveFoodFromMyCookBook;

  const factory RemoveFromMyCookBookEvent.onReset() = Reset;

}



@freezed
abstract class RemoveFromMyCookBookState with _$RemoveFromMyCookBookState{
  const factory RemoveFromMyCookBookState.initial()= RemoveFromMyCookBookInitialState;
  const factory RemoveFromMyCookBookState.loading()= RemoveFromMyCookBookLoadingState;
  const factory RemoveFromMyCookBookState.error(String message)= RemoveFromMyCookBookErrorState;
  const factory RemoveFromMyCookBookState.loaded(Food food)= RemoveFromMyCookBookLoadedState;
}

