import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';

part 'user_plan_model.freezed.dart';


@freezed
class UserPlan with _$UserPlan{
  factory UserPlan({
    @Default('') String id,
    @Default(true) bool isAutoPaymentOn,
    @Default(null) SubscriptionPlan? subscriptionPlan,
    @Default(0) int favoriteFoodLeft,
    @Default(0) int suggestFoodRequestsLeft,
    @Default(0) int foodPortionRequestsLeft,
  })= _UserPlan;

}