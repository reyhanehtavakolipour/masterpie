



import '../../domain/model/google_signin_response_model.dart';
import '../../domain/model/profile_model.dart';
import '../../domain/model/user_subscription_plan_model.dart';
import '../local/model/profile_local.dart';
import '../remote/model/google_signin_remote_model.dart';
import '../remote/model/profile_remote.dart';
import '../remote/model/user_subscription_plan_remote_model.dart';
import 'user_mapper.dart';

class UserMapperImpl extends UserMapper{


  @override
  GoogleSignInResponse fromGoogleSignInResponseRemote(GoogleSignInRemote googleSignInRemote) {
    return GoogleSignInResponse(
      email: googleSignInRemote.email,
      id: googleSignInRemote.id
    );
  }

  @override
  ProfileLocal toProfileLocal(Profile profile) {
    return ProfileLocal(
        id: profile.id,
        email: profile.email,
        firstName: profile.firstName,
        lastName: profile.lastName,
        gender: profile.gender,
        weight: profile.weight,
        height: profile.height,
        weightUnit: profile.weightUnit,
        heightUnit: profile.heightUnit,
        goalWeight: profile.goalWeight,
        age: profile.age,
        activityLevel: profile.activityLevel,
        dailyMacroGoal: profile.dailyMacroGoal,
        weightChangeWeekly: profile.weightChangeWeekly
    );
  }

  @override
  ProfileRemote toProfileRemote(Profile profile) {
    return ProfileRemote(
        id: profile.id,
        email: profile.email,
        firstName: profile.firstName,
        lastName: profile.lastName,
        gender: profile.gender,
        weight: profile.weight,
        height: profile.height,
        weightUnit: profile.weightUnit,
        heightUnit: profile.heightUnit,
        goalWeight: profile.goalWeight,
        dailyMacroGoal: profile.dailyMacroGoal,
        age: profile.age,
        activityLevel: profile.activityLevel,
        weightChangeWeekly: profile.weightChangeWeekly
    );
  }

  @override
  Profile fromProfileLocal(ProfileLocal profile) {
    return Profile(
        id: profile.id,
        email: profile.email,
        firstName: profile.firstName,
        lastName: profile.lastName,
        gender: profile.gender,
        weight: profile.weight,
        height: profile.height,
        weightUnit: profile.weightUnit,
        heightUnit: profile.heightUnit,
        goalWeight: profile.goalWeight,
        dailyMacroGoal: profile.dailyMacroGoal,
        age: profile.age,
        activityLevel: profile.activityLevel,
        weightChangeWeekly: profile.weightChangeWeekly
    );
  }

  @override
  Profile fromProfileRemote(ProfileRemote profile) {
    return Profile(
        id: profile.id,
        email: profile.email,
        firstName: profile.firstName,
        lastName: profile.lastName,
        gender: profile.gender,
        weight: profile.weight,
        height: profile.height,
        weightUnit: profile.weightUnit,
        heightUnit: profile.heightUnit,
        goalWeight: profile.goalWeight,
        dailyMacroGoal: profile.dailyMacroGoal,
        age: profile.age,
        activityLevel: profile.activityLevel,
        weightChangeWeekly: profile.weightChangeWeekly
    );
  }

  @override
  UserSubscriptionPlan fromUserSubscriptionRemote(UserSubscriptionPlanRemote userSubscriptionPlanRemote) {
    return UserSubscriptionPlan(
      userId: userSubscriptionPlanRemote.userId,
      upgradeDate: userSubscriptionPlanRemote.upgradeDate,
      plan: userSubscriptionPlanRemote.plan,
      favoriteFoodRequestsLeft: userSubscriptionPlanRemote.favoriteFoodRequestsLeft,
      suggestFoodRequestsLeft: userSubscriptionPlanRemote.suggestFoodRequestsLeft,
      foodPortionRequestsLeft: userSubscriptionPlanRemote.foodPortionRequestsLeft,
      planType: userSubscriptionPlanRemote.planType
    );
  }


}