

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/logged_foods_model.dart';
part 'get_logged_foods_state_event.freezed.dart';



@freezed
abstract class GetLoggedFoodsEvent with _$GetLoggedFoodsEvent {

  const factory GetLoggedFoodsEvent.onGetLoggedFoods(String date) = GetAllLoggedFoodsEvent;
  const factory GetLoggedFoodsEvent.onGetImmediateLoggedFoods(String date) = GetImmediateLoggedFoodsEvent;
  const factory GetLoggedFoodsEvent.onReset() = Reset;

}



@freezed
abstract class GetLoggedFoodsState with _$GetLoggedFoodsState{
  const factory GetLoggedFoodsState.initial()= GetLoggedFoodsInitialState;
  const factory GetLoggedFoodsState.loading()= GetLoggedFoodsLoadingState;
  const factory GetLoggedFoodsState.error(String message)= GetLoggedFoodsErrorState;
  const factory GetLoggedFoodsState.loaded({required LoggedFoods loggedFoods})= GetLoggedFoodsLoadedState;
  const factory GetLoggedFoodsState.loadedImmediateResponse({required LoggedFoods loggedFoods})= GetImmediateLoggedFoodsState;
}

