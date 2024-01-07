

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'log_foods_state_event.freezed.dart';



@freezed
abstract class LogFoodsEvent with _$LogFoodsEvent {

  const factory LogFoodsEvent.onLogFoods(List<Food> foods) = LogAllFoodsEvent;
  const factory LogFoodsEvent.onReset() = Reset;

}



@freezed
abstract class LogFoodsState with _$LogFoodsState{
  const factory LogFoodsState.initial()= LogFoodsInitialState;
  const factory LogFoodsState.loading()= LogFoodsLoadingState;
  const factory LogFoodsState.error(String message)= LogFoodsErrorState;
  const factory LogFoodsState.loaded()= LogFoodsLoadedState;
}

