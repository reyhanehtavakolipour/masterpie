

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/helper/print.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/logged_foods_model.dart';
import '../repository/foods_repository.dart';

class GetLoggedFoodsUseCase{

  final repo = serviceLocator<FoodsRepository>();
  final userRepo = serviceLocator<UserRepository>();


  Future<Either<Failure, LoggedFoods>> getImmediateResponse(String date) async{
    late Either<Failure, List<Food>> foodsLocalDb;
    foodsLocalDb= await repo.getLoggedFoodsFromLocalDb(date);
    final userEmail= await userRepo.getEmailFromHive();
    final profileResponse = await userRepo.getProfileFromLocal(userEmail.asRight());
    if(profileResponse.isRight()){
      List<String> goals = profileResponse.asRight().dailyMacroGoal;
      if(goals.isEmpty){
        goals = ['0.0', '0.0', '0.0', '0.0'];
      }
      List<double> macroGoals= [];
      macroGoals.add(goals[0].isNotEmpty ? double.parse(goals[0]) : 0);
      macroGoals.add(goals[1].isNotEmpty ? double.parse(goals[1]) : 0);
      macroGoals.add(goals[2].isNotEmpty ? double.parse(goals[2]) : 0);
      macroGoals.add(goals[3].isNotEmpty ? double.parse(goals[3]) : 0);
      return Right(LoggedFoods(foods: foodsLocalDb.asRight(), date: date, goals: macroGoals));
    }
    return Left(getFailure(foodsLocalDb.asLeft()));
  }

  Future<Either<Failure, LoggedFoods>> getLoggedFoods(String date) async{
    final foodsResponseRemote = await repo.getLoggedFoodsFromRemote(date);
    if(foodsResponseRemote.isRight()){
      final result= await repo.saveLoggedFoodsToLocalDb(foodsResponseRemote.getOrElse(() => []), date);
      return await getImmediateResponse(date);
    }
    return Left(getFailure(foodsResponseRemote.asLeft()));
  }

}