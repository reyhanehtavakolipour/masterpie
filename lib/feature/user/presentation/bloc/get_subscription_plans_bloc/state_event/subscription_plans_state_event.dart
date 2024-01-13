import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';

part 'subscription_plans_state_event.freezed.dart';



@freezed
abstract class SubscriptionPlanEvent with _$SubscriptionPlanEvent {

  const factory SubscriptionPlanEvent.onGetPlans() = GetAllPlansEvent;

  const factory SubscriptionPlanEvent.onReset() = Reset;


}



@freezed
abstract class SubscriptionPlansState with _$SubscriptionPlansState{
  const factory SubscriptionPlansState.initial()= SubscriptionPlansInitialState;
  const factory SubscriptionPlansState.loading()= SubscriptionPlansLoadingState;
  const factory SubscriptionPlansState.error(String message)= SubscriptionPlansErrorState;
  const factory SubscriptionPlansState.loaded(List<SubscriptionPlan> subscriptions)= SubscriptionPlansLoadedState;
}

