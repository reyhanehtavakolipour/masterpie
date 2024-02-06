


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/user/data/remote/model/user_plan_remote_model.dart';


import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/google_signin_remote_model.dart';
import '../model/profile_remote.dart';
import '../model/subscription_plan_remote_model.dart';

abstract class UserRemoteDataSource{


  Future<Either<Failure, String>> registerUserWithCredential(String email, String password);

  Future<Either<Failure, String>> loginUserWithCredential(String email, String password);

  Future<Either<Failure, GoogleSignInRemote>> signInUserWithGoogle();


  Future<Either<Failure, Success>> upsertProfileAfterRegister(ProfileRemote profileRemote);


  Future<Either<Failure, Success>> updateUserInfo(ProfileRemote profile);


  Future<Either<Failure, Success>> updateDailyMacroGoal(ProfileRemote profile);


  Future<Either<Failure, List<String>>> calculateDailyMacroGoal(ProfileRemote profile);


  Future<Either<Failure, ProfileRemote>> getProfile(String email);


  Future<Either<Failure, Success>> updateDailyMacroAndInputs(ProfileRemote profile);


  Future<Either<Failure, Success>> setUserSubscriptionPlanAfterRegister(String userId);


  Future<Either<Failure, Success>> updateFavoriteRequestsLeft(String userId, int requestsLeft);


  Future<Either<Failure, Success>> updateSuggestFoodRequestsLeft(String userId, int requestsLeft);


  Future<Either<Failure, Success>> updateFoodsPortionRequestsLeft(String userId, int requestsLeft);


  Future<Either<Failure, Success>> updateSubscriptionPlan(String userId, String plan);


  Future<Either<Failure, Success>> updateSubscriptionPlanAfterLoginIfNeeded(String userId);


  Future<Either<Failure, UserPlanRemote>> getUserPlan(String userId);


  Future<Either<Failure, List<SubscriptionPlanRemote>>> getSubscriptionPlans();


  Future<Either<Failure, Success>> logout();

  Future<Either<Failure, Success>> forgotPassword(String email);


}