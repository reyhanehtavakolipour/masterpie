import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/user_subscription_plan_model.dart';
part 'plan_state_event.freezed.dart';



@freezed
abstract class PlanEvent with _$PlanEvent {

  const factory PlanEvent.onUpdateUserPlan(String plan) = UpdateUserPlanEvent;

  const factory PlanEvent.onGetUserPlan() = GetUserPlanEvent;

  const factory PlanEvent.onReset() = Reset;


}



@freezed
abstract class PlanState with _$PlanState{
  const factory PlanState.initial()= PlanInitialState;
  const factory PlanState.loading()= PlanLoadingState;
  const factory PlanState.error(String message)= PlanErrorState;
  const factory PlanState.loaded(UserSubscriptionPlan userSubscriptionPlan)= PlanLoadedState;
  const factory PlanState.updated()= PlanUpdatedState;
}

