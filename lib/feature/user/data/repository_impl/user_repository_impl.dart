

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/user/data/local/datasource/user_hive_keyvalue_datasource.dart';
import 'package:masterpie/feature/user/data/local/datasource/user_local_datasource.dart';
import 'package:masterpie/feature/user/data/remote/datasource/user_remote_datasource.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/constant/hive_constants.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/helper.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../../domain/model/google_signin_response_model.dart';
import '../../domain/model/profile_model.dart';
import '../../domain/model/user_credentials_model.dart';
import '../../domain/model/user_subscription_plan_model.dart';
import '../../domain/repository/user_repository.dart';
import '../mapper/user_mapper.dart';

class UserRepositoryImpl extends UserRepository{

  final userHiveDataSource = serviceLocator<UserHiveDataSource>();
  final userLocalDataSource = serviceLocator<UserLocalDataSource>();
  final userRemoteDataSource = serviceLocator<UserRemoteDataSource>();
  final mapper = serviceLocator<UserMapper>();


  @override
  Future<Either<Failure, String>> registerUserWithCredentialInRemote(String email, String password) async{
    final registerRemoteResponse = await userRemoteDataSource.registerUserWithCredential(email, password);
    if(registerRemoteResponse.isRight()){
      return Right(registerRemoteResponse.asRight());
    }
    return Left(registerRemoteResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> saveUserEmailInHive(String email) async{
    userHiveDataSource.putString(KEY_EMAIL, email);
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> saveUserIdInHive(String userId) async{
    userHiveDataSource.putString(KEY_USER_ID, userId);
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> saveUserPasswordInHive(String password) async{
    userHiveDataSource.putString(KEY_PASSWORD, password);
    return const Right(Success());
  }


  @override
  Future<Either<Failure, GoogleSignInResponse>> registerUserWithGoogleInRemote() async{
    //register and sign-in with google functionality is both the same thing which is sign-in
    final registerRemoteResponse = await userRemoteDataSource.signInUserWithGoogle();
    if(registerRemoteResponse.isRight()){
      return Right(mapper.fromGoogleSignInResponseRemote(registerRemoteResponse.asRight()));
    }
    return Left(registerRemoteResponse.asLeft());
  }

  @override
  Future<Either<Failure, String>> loginUserWithCredentialInRemote(String email, String password) async{
    final loginRemoteResponse = await userRemoteDataSource.loginUserWithCredential(email, password);
    if(loginRemoteResponse.isRight()){
    return Right(loginRemoteResponse.asRight());
    }
    return Left(loginRemoteResponse.asLeft());
  }

  @override
  Future<Either<Failure, GoogleSignInResponse>> loginUserWithGoogleInRemote() async{
    //register and sign-in with google functionality is both the same thing which is sign-in
    final loginRemoteResponse = await userRemoteDataSource.signInUserWithGoogle();
    if(loginRemoteResponse.isRight()){
      return Right(mapper.fromGoogleSignInResponseRemote(loginRemoteResponse.asRight()));
    }
    return Left(loginRemoteResponse.asLeft());
  }


  @override
  Future<Either<Failure, Success>> upsertProfileAfterRegisterInRemote(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userRemoteDataSource.upsertProfileAfterRegister(mapper.toProfileRemote(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> upsertProfileInLocal(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userLocalDataSource.upsertProfileAfterRegister(mapper.toProfileLocal(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Profile>> getProfileFromLocal(String email) async{
    final profileResponse = await userLocalDataSource.getProfile(email);
    if(profileResponse.isRight()){
      return Right(mapper.fromProfileLocal(profileResponse.asRight()));
    }
    return Left(profileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Profile>> getProfileFromRemote(String email, String id) async{
    final profileResponse = await userRemoteDataSource.getProfile(email, id);
    if(profileResponse.isRight()){
      return Right(mapper.fromProfileRemote(profileResponse.asRight()));
    }
    return Left(profileResponse.asLeft());
  }


  @override
  Future<Either<Failure, String>> getEmailFromHive() async{
    String email = await userHiveDataSource.getString(KEY_EMAIL);
    return Right(email ?? '');
  }

  @override
  Future<Either<Failure, String>> getUserIdFromHive() async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    return Right(userId ?? '');
  }


  @override
  Future<Either<Failure, UserCredentials>> getUserCredentialsFromHive() async{
    String email = await userHiveDataSource.getString(KEY_EMAIL) ?? '';
    String password = await userHiveDataSource.getString(KEY_PASSWORD) ?? '';
    return Right(UserCredentials(email: email, password: password));
  }

  @override
  Future<Either<Failure, List<String>>> calculateDailyMacroGoalInRemote(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userRemoteDataSource.calculateDailyMacroGoal(mapper.toProfileRemote(profile));
    if(saveProfileResponse.isRight()){
      return Right(saveProfileResponse.asRight());
    }
    return Left(saveProfileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateDailyMacroGoalInRemote(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userRemoteDataSource.updateDailyMacroGoal(mapper.toProfileRemote(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateUserInfoInRemote(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userRemoteDataSource.updateUserInfo(mapper.toProfileRemote(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }


  @override
  Future<Either<Failure, Success>> updateDailyMacroGoalInLocal(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userLocalDataSource.updateDailyMacroGoal(mapper.toProfileLocal(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateUserInfoInLocal(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userLocalDataSource.updateUserInfo(mapper.toProfileLocal(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateDailyMacroAndInputsInLocal(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userLocalDataSource.updateDailyMacroAndInputs(mapper.toProfileLocal(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateDailyMacroAndInputsInRemote(Profile profile) async{
    final userId = await getUserIdFromHive();
    profile = profile.copyWith(id: userId.asRight());
    final saveProfileResponse = await userRemoteDataSource.updateDailyMacroAndInputs(mapper.toProfileRemote(profile));
    if(saveProfileResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveProfileResponse.asLeft());
  }


  @override
  Future<Either<Failure, Success>> logoutInHive() async{
    userHiveDataSource.putString(KEY_EMAIL, '');
    userHiveDataSource.putString(KEY_PASSWORD, '');
    userHiveDataSource.putString(KEY_USER_ID, '');
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> logoutInRemote() async{
    final logoutResponse = await userRemoteDataSource.logout();
    if(logoutResponse.isRight()){
      return const Right(Success());
    }
    return Left(logoutResponse.asLeft());
  }


  @override
  Future<Either<Failure, Success>> logoutInLocal() async{
    await userLocalDataSource.deleteAllTables();
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> setUserSubscriptionPlanAfterRegisterInRemote() async{
    final userId = await getUserIdFromHive();
    final planResponse = await userRemoteDataSource.setUserSubscriptionPlanAfterRegister(userId.asRight());
    if(planResponse.isRight()){
      return const Right(Success());
    }
    return Left(planResponse.asLeft());
  }

  @override
  Future<Either<Failure, UserSubscriptionPlan>> getUserSubscriptionPlanInRemote() async{
    final userId = await getUserIdFromHive();
    final planResponse = await userRemoteDataSource.getUserSubscriptionPlan(userId.asRight());
    if(planResponse.isRight()){
      return Right(mapper.fromUserSubscriptionRemote(planResponse.asRight()));
    }
    return Left(planResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateFavoriteRequestsLeftInRemote() async{
    final userId = await getUserIdFromHive();
    final planResponse = await userRemoteDataSource.getUserSubscriptionPlan(userId.asRight());
    if(planResponse.isRight()){
      return await userRemoteDataSource.updateFavoriteRequestsLeft(userId.asRight(), planResponse.asRight().favoriteFoodRequestsLeft -1);
    }
    return Left(planResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateFoodsPortionRequestsLeftInRemote() async{
    final userId = await getUserIdFromHive();
    final planResponse = await userRemoteDataSource.getUserSubscriptionPlan(userId.asRight());
    if(planResponse.isRight()){
      return await userRemoteDataSource.updateFavoriteRequestsLeft(userId.asRight(), planResponse.asRight().foodPortionRequestsLeft -1);
    }
    return Left(planResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateSubscriptionPlanAfterLoginIfNeededInRemote() async{
    final userId = await getUserIdFromHive();
    final planResponse = await userRemoteDataSource.getUserSubscriptionPlan(userId.asRight());
    if(planResponse.isRight()){
      DateTime today = DateTime.parse(DateFormat('yyyy-MM-dd').format(DateTime.now()));
      DateTime upgradeDate = DateTime.parse(planResponse.asRight().upgradeDate);
      int differenceInDays = calculateDifferenceInDays(today, upgradeDate);
      if(differenceInDays > 30){
        //todo handle check if the user had any payment , handle auto-payment
      }
      return const Right(Success());
    }
    return Left(planResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateSubscriptionPlanInRemote(String plan) async{
    final userId = await getUserIdFromHive();
    final planResponse = await userRemoteDataSource.updateSubscriptionPlan(userId.asRight(), plan);
    if(planResponse.isRight()){
      return const Right(Success());
    }
    return Left(planResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateSuggestFoodRequestsLeftInRemote() async{
    final userId = await getUserIdFromHive();
    final planResponse = await userRemoteDataSource.getUserSubscriptionPlan(userId.asRight());
    if(planResponse.isRight()){
      return await userRemoteDataSource.updateFavoriteRequestsLeft(userId.asRight(), planResponse.asRight().suggestFoodRequestsLeft -1);
    }
    return Left(planResponse.asLeft());
  }



}