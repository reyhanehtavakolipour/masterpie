

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../repository/foods_repository.dart';

class GetInternationalMealsUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, List<Food>>> getImmediateResponse(String query) async{
    late Either<Failure, List<Food>> foodsLocalDb;
      foodsLocalDb= await repo.getInternationalMealsFromLocalDb(query);
      if(foodsLocalDb.isRight()){
        return Right(foodsLocalDb.asRight());
      }
      return Left(getFailure(foodsLocalDb.asLeft()));
  }

  Future<Either<Failure, List<Food>>> getInternationalMeals(String query) async{
    // final foodsResponseRemote = await repo.getInternationalMealsFromRemote(query);
    // if(foodsResponseRemote.isRight()){
    //   await repo.saveInternationalMealsToLocalDb(foodsResponseRemote.getOrElse(() => []));
      return await getImmediateResponse(query);
    // }
    // return Left(getFailure(foodsResponseRemote.asLeft()));
  }

}