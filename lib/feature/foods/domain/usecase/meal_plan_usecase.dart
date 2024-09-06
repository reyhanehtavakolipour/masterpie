

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/meal_plan_model.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../repository/foods_repository.dart';

class MealPlanUseCase{

  final repo = serviceLocator<FoodsRepository>();
  final userRepo = serviceLocator<UserRepository>();


  Future<Either<Failure, Success>> saveMealPlan(MealPlan mealPlan) async{

    final idResponse = await userRepo.getUserIdFromHive();

    if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
      await repo.saveMealPlanToLocal(mealPlan);
      return const Right(Success());
    }

    await repo.saveMealPlanToLocal(mealPlan);
    await repo.saveMealPlanToRemote(mealPlan);
    return const Right(Success());
  }




  Future<Either<Failure, List<MealPlan>>> getMealPlans() async{

    final idResponse = await userRepo.getUserIdFromHive();

    if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
      final planResponse= await repo.getMealPlansFromLocal();
      return Right(planResponse.asRight());
    }

    final plansResponse= await repo.getMealPlansFromRemote();
    await repo.saveMealPlansToLocal(plansResponse.asRight());
    final localResponse= await repo.getMealPlansFromLocal();
    return Right(localResponse.asRight());
  }

}