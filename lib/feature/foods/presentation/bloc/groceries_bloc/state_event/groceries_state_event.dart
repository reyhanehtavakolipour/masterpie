

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';

import '../../../../domain/model/food_model.dart';
part 'groceries_state_event.freezed.dart';



@freezed
abstract class GroceriesEvent with _$GroceriesEvent {

  const factory GroceriesEvent.onGetGroceries(String query) = GetGroceriesEvent;
  const factory GroceriesEvent.onReset() = Reset;

}



@freezed
abstract class GroceriesState with _$GroceriesState{
  const factory GroceriesState.initial()= GroceriesInitialState;
  const factory GroceriesState.loading()= GroceriesLoadingState;
  const factory GroceriesState.error(String message)= GroceriesErrorState;
  const factory GroceriesState.loaded({required List<GenericFood> foods})= GroceriesLoadedState;
}

