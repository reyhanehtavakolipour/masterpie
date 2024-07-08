

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/fat_secret_foods_info_model.dart';

part 'get_fat_secret_foods_info_state_event.freezed.dart';



@freezed
abstract class GetFatSecretFoodsInfoEvent with _$GetFatSecretFoodsInfoEvent {

  const factory GetFatSecretFoodsInfoEvent.onGetFatSecretFoodsInfo() = GetFatSecretFoodsInfo;

  const factory GetFatSecretFoodsInfoEvent.onReset() = Reset;

}



@freezed
abstract class GetFatSecretFoodsInfoState with _$GetFatSecretFoodsInfoState{
  const factory GetFatSecretFoodsInfoState.initial()= FatSecretFoodInfoInitialState;
  const factory GetFatSecretFoodsInfoState.loading()= FatSecretFoodInfoLoadingState;
  const factory GetFatSecretFoodsInfoState.error(String message)= FatSecretFoodInfoErrorState;
  const factory GetFatSecretFoodsInfoState.loaded(FatSecretFoodsInfo fatSecretFoodsInfo)= FatSecretFoodInfoLoadedState;
}

