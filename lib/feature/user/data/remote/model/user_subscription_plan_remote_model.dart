import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_subscription_plan_remote_model.freezed.dart';


@freezed
class UserSubscriptionPlanRemote with _$UserSubscriptionPlanRemote{

  factory UserSubscriptionPlanRemote({
    @Default('') String userId,
    @Default('') String plan,
    @Default('') String upgradeDate,
    @Default('') String planType,
    @Default(0) int favoriteFoodRequestsLeft,
    @Default(0) int suggestFoodRequestsLeft,
    @Default(0) int foodPortionRequestsLeft,
  })= _UserSubscriptionPlanRemote;

}