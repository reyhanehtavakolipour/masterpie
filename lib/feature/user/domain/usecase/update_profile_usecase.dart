

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../model/profile_model.dart';
import '../repository/user_repository.dart';

class UpdateProfileUseCase{

  final repo = serviceLocator<UserRepository>();

  Future<Either<Failure, Success>> updateProfile(String gender, String weight, String height, String weightUnit, String heightUnit,
      String goalWeight, String age, String activityLevel, String weightChangeWeekly,   List<String> mainDishTypes, List<String> sideDishTypes,
      List<String> favoriteCategories, List<String> hateCategories, List<String> allergens) async{

    Profile profile = Profile(
      gender: gender,
      weight: weight,
      height: height,
      weightUnit: weightUnit,
      heightUnit: heightUnit,
      goalWeight: goalWeight,
      age: age,
      activityLevel: activityLevel,
      weightChangeWeekly: weightChangeWeekly,
      updateProfileShown: true,
      mainDishTypes: mainDishTypes,
      sideDishTypes: sideDishTypes,
      favoriteCategories: favoriteCategories,
      hateCategories: hateCategories,
      allergens: allergens
    );


    final userIdResponse= await repo.getUserIdFromHive();
    final userId= userIdResponse.isRight() ? userIdResponse.asRight() : '';

    if(userId.isNotEmpty){
      final upsertProfileResponse = await repo.upsertProfileInRemote(profile);

      if(upsertProfileResponse.isLeft()){
        return Left(getFailure(upsertProfileResponse.asLeft()));
      }

      profile= profile.copyWith(dailyMacroGoal: upsertProfileResponse.asRight().dailyMacroGoal);
      await repo.updateProfileInLocal(profile);
      return const Right(Success());
    }else{
      final calculateResponse = await repo.calculateDailyMacroGoalInRemote(profile);
      if(calculateResponse.isLeft()){
        return Left(getFailure(calculateResponse.asLeft()));
      }

      profile= profile.copyWith(dailyMacroGoal: calculateResponse.asRight());

      await repo.updateProfileInLocal(profile);
      return const Right(Success());

    }

  }



  Future<Either<Failure, Success>> updateMacroGoalsAndInputs(String gender,
      String weight, String height, String weightUnit, String heightUnit, String goalWeight, String age,
      String activityLevel, String weightChangeWeekly, String calorie, String protein, String carb, String fat) async{


    Profile profile = Profile(
        gender: gender,
        weight: weight,
        height: height,
        weightUnit: weightUnit,
        heightUnit: heightUnit,
        goalWeight: goalWeight,
        age: age,
        activityLevel: activityLevel,
        weightChangeWeekly: weightChangeWeekly,
        dailyMacroGoal: [calorie, protein, carb, fat]
    );


    final idResponse = await repo.getUserIdFromHive();

    if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
      final upsertProfileResponse = await repo.updateDailyMacroAndInputsInLocal(profile);
      if(upsertProfileResponse.isRight()){
        return const Right(Success());
      }
      return Left(getFailure(upsertProfileResponse.asLeft()));
    }


    final upsertProfileResponse = await repo.updateDailyMacroAndInputsInRemote(profile);
    if(upsertProfileResponse.isRight()){
      await repo.updateDailyMacroAndInputsInLocal(profile);
      return const Right(Success());
    }
    return Left(getFailure(upsertProfileResponse.asLeft()));
  }


  Future<Either<Failure, Success>> updateUserInfo(String firstName, String lastName) async{

    Profile profile = Profile(
      firstName: firstName,
      lastName: lastName,
    );

    final upsertProfileResponse = await repo.updateUserInfoInRemote(profile);
    if(upsertProfileResponse.isRight()){
      await repo.updateUserInfoInLocal(profile);
      return const Right(Success());
    }
    return Left(getFailure(upsertProfileResponse.asLeft()));
  }


  Future<Either<Failure, List<String>>> calculateDailyMacroGoal(String gender,
      String weight, String height, String weightUnit, String heightUnit, String goalWeight, String age, String activityLevel, String weightChangeWeekly) async{

    Profile profile = Profile(
        gender: gender,
        weight: weight,
        height: height,
        weightUnit: weightUnit,
        heightUnit: heightUnit,
        goalWeight: goalWeight,
        age: age,
        activityLevel: activityLevel,
        weightChangeWeekly: weightChangeWeekly
    );


    final upsertProfileResponse = await repo.calculateDailyMacroGoalInRemote(profile);
    if(upsertProfileResponse.isRight()){
      return Right(upsertProfileResponse.asRight());
    }
    return Left(getFailure(upsertProfileResponse.asLeft()));
  }



  Future<Either<Failure, Success>> updateDailyMacroGoal(String calorie, String protein, String carb, String fat) async{

    List<String> dailyMacroGoal = [calorie, protein, carb, fat];


    final idResponse = await repo.getUserIdFromHive();

    if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
      final upsertProfileResponse = await repo.updateDailyMacroGoalInLocal(dailyMacroGoal);
      if(upsertProfileResponse.isRight()){
        return const Right(Success());
      }
      return Left(getFailure(upsertProfileResponse.asLeft()));
    }

    Profile profile = Profile(
        dailyMacroGoal: dailyMacroGoal
    );

    final upsertProfileResponse = await repo.updateDailyMacroGoalInRemote(profile);
    if(upsertProfileResponse.isRight()){
      await repo.updateDailyMacroGoalInLocal(dailyMacroGoal);
      return const Right(Success());
    }
    return Left(getFailure(upsertProfileResponse.asLeft()));
  }




}