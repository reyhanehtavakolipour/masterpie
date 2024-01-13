

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/user/domain/model/subscription_plan_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../repository/user_repository.dart';

class SubscriptionPlansUseCase{

  final repo = serviceLocator<UserRepository>();


  Future<Either<Failure, List<SubscriptionPlan>>> getSubscriptionPlans() async{
    final plansResponse = await repo.getSubscriptionPlansInRemote();
    if(plansResponse.isRight()){
      return Right(plansResponse.asRight());
    }

    return Left(getFailure(plansResponse.asLeft()));
  }


}