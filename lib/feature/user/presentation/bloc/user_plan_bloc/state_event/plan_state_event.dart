import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/subscription_plan_model.dart';
import '../../../../domain/model/user_plan_model.dart';
part 'plan_state_event.freezed.dart';



@freezed
abstract class UserPlanEvent with _$UserPlanEvent {

  const factory UserPlanEvent.onUpdateUserPlan(String plan) = UpdateUserPlanEvent;

  const factory UserPlanEvent.onGetUserPlan() = GetUserPlanEvent;

  const factory UserPlanEvent.onReset() = Reset;


}



@freezed
abstract class UserPlanState with _$UserPlanState{
  const factory UserPlanState.initial()= UserPlanInitialState;
  const factory UserPlanState.loading()= UserPlanLoadingState;
  const factory UserPlanState.error(String message)= UserPlanErrorState;
  const factory UserPlanState.loaded(UserPlan userSubscriptionPlan)= UserPlanLoadedState;
  const factory UserPlanState.updated()= UserPlanUpdatedState;
}

