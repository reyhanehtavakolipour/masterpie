

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../model/user_subscription_plan_model.dart';
import '../repository/user_repository.dart';

class PlanUseCase{

  final repo = serviceLocator<UserRepository>();


  Future<Either<Failure, UserSubscriptionPlan>> getUserPlan() async{
    final planResponse = await repo.getUserSubscriptionPlanInRemote();
    if(planResponse.isRight()){
      return Right(planResponse.asRight());
    }

    return Left(getFailure(planResponse.asLeft()));
  }


  Future<Either<Failure, Success>> updateUserPlan(String plan) async{
    final planResponse = await repo.updateSubscriptionPlanInRemote(plan);
    if(planResponse.isRight()){
      return Right(planResponse.asRight());
    }

    return Left(getFailure(planResponse.asLeft()));
  }

}