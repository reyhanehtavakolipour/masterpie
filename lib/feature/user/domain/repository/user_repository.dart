



import 'package:dartz/dartz.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../model/google_signin_response_model.dart';
import '../model/profile_model.dart';
import '../model/user_credentials_model.dart';
import '../model/user_subscription_plan_model.dart';

abstract class UserRepository{

  Future<Either<Failure, String>> registerUserWithCredentialInRemote(String email, String password);

  Future<Either<Failure, GoogleSignInResponse>> registerUserWithGoogleInRemote();

  Future<Either<Failure, String>> loginUserWithCredentialInRemote(String email, String password);

  Future<Either<Failure, GoogleSignInResponse>> loginUserWithGoogleInRemote();

  Future<Either<Failure, Success>> saveUserIdInHive(String userId);

  Future<Either<Failure, Success>> setUserSubscriptionPlanAfterRegisterInRemote();


  Future<Either<Failure, Success>> updateFavoriteRequestsLeftInRemote();


  Future<Either<Failure, Success>> updateSuggestFoodRequestsLeftInRemote();


  Future<Either<Failure, Success>> updateFoodsPortionRequestsLeftInRemote();


  Future<Either<Failure, Success>> updateSubscriptionPlanInRemote(String plan);


  Future<Either<Failure, Success>> updateSubscriptionPlanAfterLoginIfNeededInRemote();


  Future<Either<Failure, UserSubscriptionPlan>> getUserSubscriptionPlanInRemote();


  Future<Either<Failure, Success>> saveUserEmailInHive(String email);

  Future<Either<Failure, Success>> saveUserPasswordInHive(String password);

  Future<Either<Failure, Success>> upsertProfileAfterRegisterInRemote(Profile profile);

  Future<Either<Failure, Success>> upsertProfileInLocal(Profile profile);

  Future<Either<Failure, Profile>> getProfileFromLocal(String email);

  Future<Either<Failure, Profile>> getProfileFromRemote(String email, String id);

  Future<Either<Failure, String>> getEmailFromHive();

  Future<Either<Failure, String>> getUserIdFromHive();

  Future<Either<Failure, UserCredentials>> getUserCredentialsFromHive();


  Future<Either<Failure, Success>> updateUserInfoInRemote(Profile profile);


  Future<Either<Failure, Success>> updateDailyMacroGoalInRemote(Profile profile);


  Future<Either<Failure, List<String>>> calculateDailyMacroGoalInRemote(Profile profile);


  Future<Either<Failure, Success>> updateUserInfoInLocal(Profile profile);


  Future<Either<Failure, Success>> updateDailyMacroGoalInLocal(Profile profile);


  Future<Either<Failure, Success>> updateDailyMacroAndInputsInRemote(Profile profile);


  Future<Either<Failure, Success>> updateDailyMacroAndInputsInLocal(Profile profile);


  Future<Either<Failure, Success>> logoutInRemote();


  Future<Either<Failure, Success>> logoutInHive();


  Future<Either<Failure, Success>> logoutInLocal();



}