

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';

import '../../../../domain/model/food_model.dart';
part 'auto_generate_foods_state_event.freezed.dart';



@freezed
abstract class AutoGenerateFoodsEvent with _$AutoGenerateFoodsEvent {

  const factory AutoGenerateFoodsEvent.onAutoGenerateFood(String type, int index, bool isMainDish) = AutoGenerateFood;
  const factory AutoGenerateFoodsEvent.onAutoGenerateFoodsForDay(List<String> mainDishType, List<String> sideDishTypes) = AutoGenerateFoodsForDay;
  const factory AutoGenerateFoodsEvent.onReset() = Reset;

}



@freezed
abstract class AutoGenerateFoodsState with _$AutoGenerateFoodsState{
  const factory AutoGenerateFoodsState.initial()= AutoGenerateFoodsInitialState;
  const factory AutoGenerateFoodsState.loading()= AutoGenerateFoodsLoadingState;
  const factory AutoGenerateFoodsState.error(String message)= AutoGenerateFoodsErrorState;
  const factory AutoGenerateFoodsState.foodsLoaded({required List<Food> foods})= AutoGenerateFoodsForDayLoadedState;
  const factory AutoGenerateFoodsState.foodLoaded({required Food food, required String type, required int index, required bool isMainDish})= AutoGenerateFoodLoadedState;
}

