import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/user/data/remote/model/subscription_plan_remote_model.dart';

part 'user_plan_remote_model.freezed.dart';


@freezed
class UserPlanRemote with _$UserPlanRemote{
  factory UserPlanRemote({
    @Default('') String id,
    @Default(true) bool isAutoPaymentOn,
    @Default('') String customerId,
    @Default('') String subscriptionId,
    @Default('') String interval,
    @Default('') String endsAt,
    @Default('') String updatedAt,
    @Default(true) bool cancelAtPeriodEnd,
    @Default(false) bool macroEdition,
    @Default('') String cancelReason,
    @Default(null) SubscriptionPlanRemote? subscriptionPlan,
    @Default(0) int favoriteFoodLeft,
    @Default(0) int cookBookFoodLeft,
    @Default(0) int suggestFoodRequestsLeft,
    @Default(0) int foodPortionRequestsLeft,
    @Default(0) int favoriteFoodsCreatedCount,
    @Default(0) int cookBookFoodsCreatedCount,

  })= _UserPlanRemote;

}