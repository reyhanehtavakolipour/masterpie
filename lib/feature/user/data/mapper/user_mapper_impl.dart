



import 'package:masterpie/feature/user/data/remote/model/user_plan_remote_model.dart';

import 'package:masterpie/feature/user/domain/model/user_plan_model.dart';

import '../../domain/model/google_signin_response_model.dart';
import '../../domain/model/profile_model.dart';
import '../../domain/model/subscription_plan_model.dart';
import '../local/model/profile_local.dart';
import '../remote/model/google_signin_remote_model.dart';
import '../remote/model/profile_remote.dart';
import '../remote/model/subscription_plan_remote_model.dart';
import 'user_mapper.dart';

class UserMapperImpl extends UserMapper{


  @override
  GoogleSignInResponse fromGoogleSignInResponseRemote(GoogleSignInRemote googleSignInRemote) {
    return GoogleSignInResponse(
      email: googleSignInRemote.email,
      id: googleSignInRemote.id,
      updateProfileShown: googleSignInRemote.updateProfileShown
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
        weightChangeWeekly: profile.weightChangeWeekly,
      favoriteCategories: profile.favoriteCategories,
      hateCategories: profile.hateCategories,
        favoriteSubCategories: profile.favoriteSubCategories,
        hateSubCategories: profile.hateSubCategories,
      mainDishTypes: profile.mainDishTypes,
      sideDishTypes: profile.sideDishTypes,
      allergens: profile.allergens
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
        weightChangeWeekly: profile.weightChangeWeekly,
        updateProfileShown: profile.updateProfileShown,
        favoriteCategories: profile.favoriteCategories,
        hateCategories: profile.hateCategories,
        favoriteSubCategories: profile.favoriteSubCategories,
        hateSubCategories: profile.hateSubCategories,
        mainDishTypes: profile.mainDishTypes,
        sideDishTypes: profile.sideDishTypes,
        allergens: profile.allergens
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
        weightChangeWeekly: profile.weightChangeWeekly,
        favoriteCategories: profile.favoriteCategories,
        hateCategories: profile.hateCategories,
        favoriteSubCategories: profile.favoriteSubCategories,
        hateSubCategories: profile.hateSubCategories,
        mainDishTypes: profile.mainDishTypes,
        sideDishTypes: profile.sideDishTypes,
        allergens: profile.allergens
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
        weightChangeWeekly: profile.weightChangeWeekly,
        updateProfileShown: profile.updateProfileShown,
        favoriteCategories: profile.favoriteCategories,
        hateCategories: profile.hateCategories,
        favoriteSubCategories: profile.favoriteSubCategories,
        hateSubCategories: profile.hateSubCategories,
        mainDishTypes: profile.mainDishTypes,
        sideDishTypes: profile.sideDishTypes,
        allergens: profile.allergens
    );
  }


  @override
  List<SubscriptionPlan> fromSubscriptionPlansRemote(List<SubscriptionPlanRemote> subscriptionPlansRemote) {
    return subscriptionPlansRemote.map((subscriptionRemote) =>
        SubscriptionPlan(
          ids: subscriptionRemote.ids,
          plan: subscriptionRemote.plan,
          intervals: subscriptionRemote.intervals,
          prices: subscriptionRemote.prices,
          favoriteFoodLimit: subscriptionRemote.favoriteFoodLimit,
          suggestFoodRequestsLimit: subscriptionRemote.suggestFoodRequestsLimit,
          foodPortionRequestsLimit: subscriptionRemote.foodPortionRequestsLimit,
          cookBookFoodLimit: subscriptionRemote.cookBookFoodLimit
        )
    ).toList();
  }

  @override
  UserPlan fromUserPlanRemote(UserPlanRemote userPlanRemote) {
    return UserPlan(
        id: userPlanRemote.id,
        isAutoPaymentOn: userPlanRemote.isAutoPaymentOn,
        customerId: userPlanRemote.customerId,
        subscriptionId: userPlanRemote.subscriptionId,
        interval: userPlanRemote.interval,
        cancelReason: userPlanRemote.cancelReason,
        endsAt: userPlanRemote.endsAt,
        nextUpdateDate: userPlanRemote.nextUpdateDate,
        macroEdition: userPlanRemote.macroEdition,
        cancelAtPeriodEnd: userPlanRemote.cancelAtPeriodEnd,
        updatedAt: userPlanRemote.updatedAt,
        subscriptionPlan: fromSubscriptionPlanRemote(userPlanRemote.subscriptionPlan!),
        favoriteFoodLeft: userPlanRemote.favoriteFoodLeft,
        suggestFoodRequestsLeft: userPlanRemote.suggestFoodRequestsLeft,
        foodPortionRequestsLeft: userPlanRemote.foodPortionRequestsLeft,
      favoriteFoodsCreatedCount: userPlanRemote.favoriteFoodsCreatedCount,
      cookBookFoodLeft: userPlanRemote.cookBookFoodLeft,
      cookBookFoodsCreatedCount: userPlanRemote.cookBookFoodsCreatedCount
    );
  }

  @override
  SubscriptionPlan fromSubscriptionPlanRemote(SubscriptionPlanRemote subscriptionRemote) {
    return SubscriptionPlan(
        ids: subscriptionRemote.ids,
        plan: subscriptionRemote.plan,
        intervals: subscriptionRemote.intervals,
        prices: subscriptionRemote.prices,
        macroEdition: subscriptionRemote.macroEdition,
        favoriteFoodLimit: subscriptionRemote.favoriteFoodLimit,
        suggestFoodRequestsLimit: subscriptionRemote.suggestFoodRequestsLimit,
        foodPortionRequestsLimit: subscriptionRemote.foodPortionRequestsLimit,
      cookBookFoodLimit: subscriptionRemote.cookBookFoodLimit
    );
  }


}