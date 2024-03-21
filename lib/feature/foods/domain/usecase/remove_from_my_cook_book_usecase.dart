

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../repository/foods_repository.dart';

class RemoveFromMyCookBookUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, Food>> removeFromMyCookBook(Food food) async{
    final removeFromMyCookBookRemoteResponse = await repo.removeMealFromMyCookBookInRemote(food);
    if(removeFromMyCookBookRemoteResponse.isRight()){
      await repo.removeMealFromMyCookBookInLocalDb(food);
      return Right(food);
    }
    return Left(getFailure(removeFromMyCookBookRemoteResponse.asLeft()));
  }

}