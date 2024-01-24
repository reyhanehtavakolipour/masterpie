import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';

part 'new_plan_info_model.freezed.dart';


@freezed
class NewPlanInfo with _$NewPlanInfo{
  factory NewPlanInfo({
    @Default([]) List<SubscriptionPlan> subscriptionPlans,
    @Default('') String customerId,
    @Default('') String subscriptionId,
    @Default('') String endsAt,
    @Default('') String interval,
    @Default('') String updatedAt,
  })= _NewPlanInfo;

}