

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/fat_secret_foods_info_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';

import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../repository/foods_repository.dart';

class GetFatSecretFoodsInfoUseCase{

  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, FatSecretFoodsInfo>> getFatSecretFoodsInfo() async{
    final getFatSecretFoodInfoRemoteResponse = await repo.getFatSecretFoodsInfoFromRemote();
    if(getFatSecretFoodInfoRemoteResponse.isRight()){
      return Right(getFatSecretFoodInfoRemoteResponse.asRight());
    }
    return Left(getFailure(getFatSecretFoodInfoRemoteResponse.asLeft()));
  }

}