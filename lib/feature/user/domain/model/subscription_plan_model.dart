import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_plan_model.freezed.dart';


@ freezed
class SubscriptionPlan with _$SubscriptionPlan{
  factory SubscriptionPlan({
    @Default([]) List<String> ids,
    @Default('') String plan,
    @Default([]) List<String> intervals,
    @Default([]) List<double> prices,
    @Default(false) bool macroEdition,
    @Default(0) int favoriteFoodLimit,
    @Default(0) int suggestFoodRequestsLimit,
    @Default(0) int foodPortionRequestsLimit,
  })= _SubscriptionPlan;

}