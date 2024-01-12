import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_subscription_plan_model.freezed.dart';


@freezed
class UserSubscriptionPlan with _$UserSubscriptionPlan{
  factory UserSubscriptionPlan({
    @Default('') String userId,
    @Default('') String plan,
    @Default('') String upgradeDate,
    @Default('') String planType,
    @Default(0) int favoriteFoodRequestsLeft,
    @Default(0) int suggestFoodRequestsLeft,
    @Default(0) int foodPortionRequestsLeft,
  })= _UserSubscriptionPlan;

}