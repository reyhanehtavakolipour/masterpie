

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
part 'auto_generate_foods_state_event.freezed.dart';



@freezed
abstract class AutoGenerateFoodsEvent with _$AutoGenerateFoodsEvent {

  const factory AutoGenerateFoodsEvent.onAutoGenerateFoods() = AutoGenerateFoods;
  const factory AutoGenerateFoodsEvent.onReset() = Reset;

}



@freezed
abstract class AutoGenerateFoodsState with _$AutoGenerateFoodsState{
  const factory AutoGenerateFoodsState.initial()= AutoGenerateFoodsInitialState;
  const factory AutoGenerateFoodsState.loading()= AutoGenerateFoodsLoadingState;
  const factory AutoGenerateFoodsState.error(String message)= AutoGenerateFoodsErrorState;
  const factory AutoGenerateFoodsState.loaded({required List<GenericFood> foods})= AutoGenerateFoodsLoadedState;
}

