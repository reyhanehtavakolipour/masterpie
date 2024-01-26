import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_plan_remote_model.freezed.dart';


@freezed
class SubscriptionPlanRemote with _$SubscriptionPlanRemote{

  factory SubscriptionPlanRemote({
    @Default([]) List<String> ids,
    @Default('') String plan,
    @Default([]) List<String> intervals,
    @Default([]) List<double> prices,
    @Default(false) bool macroEdition,
    @Default(0) int favoriteFoodLimit,
    @Default(0) int suggestFoodRequestsLimit,
    @Default(0) int foodPortionRequestsLimit,
  })= _SubscriptionPlanRemote;

}


