import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_plan_model.freezed.dart';


@freezed
class SubscriptionPlan with _$SubscriptionPlan{
  factory SubscriptionPlan({
    @Default('') String id,
    @Default('') String plan,
    @Default([]) List<String> intervals,
    @Default([]) List<int> prices,
    @Default(0) int favoriteFoodLimit,
    @Default(0) int suggestFoodRequestsLimit,
    @Default(0) int foodPortionRequestsLimit,
  })= _SubscriptionPlan;

}