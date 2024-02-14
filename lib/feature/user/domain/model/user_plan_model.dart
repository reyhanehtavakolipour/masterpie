import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';

part 'user_plan_model.freezed.dart';


@freezed
class UserPlan with _$UserPlan{
  factory UserPlan({
    @Default('') String id,
    @Default(true) bool isAutoPaymentOn,
    @Default('') String customerId,
    @Default('') String subscriptionId,
    @Default('') String interval,
    @Default('') String endsAt,
    @Default('') String updatedAt,
    @Default('') String cancelReason,
    @Default(true) bool cancelAtPeriodEnd,
    @Default(false) bool macroEdition,
    @Default(null) SubscriptionPlan? subscriptionPlan,
    @Default(0) int favoriteFoodLeft,
    @Default(0) int suggestFoodRequestsLeft,
    @Default(0) int foodPortionRequestsLeft,
    @Default(0) int favoriteFoodsCreatedCount,
  })= _UserPlan;

}