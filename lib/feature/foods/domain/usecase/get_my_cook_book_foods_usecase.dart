

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/helper/print.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../repository/foods_repository.dart';

class GetMyCookBookFoodsUseCase{

  final foodRepo = serviceLocator<FoodsRepository>();

  final userRepo = serviceLocator<UserRepository>();


  Future<Either<Failure, List<Food>>> getImmediateResponse(String query) async {
    final meals = await foodRepo.getMyCookBookFoodsFromLocalDb(query);
    return Right(meals.asRight());
  }

  Future<Either<Failure, String>> searchFoodLocally(Food food) async {
    final exist = await foodRepo.isFoodInMyCookBookLocalDb(food);
    return Right(exist.asRight());
  }

  Future<Either<Failure, bool>> isMacroEditionAvailable() async {
    final enabled = await userRepo.isMacroEditionAvailableInRemote();
    return Right(enabled.asRight());
  }

  Future<Either<Failure, List<Food>>> getMyCookBookFoods(String query) async {
    final idResponse = await userRepo.getUserIdFromHive();
    if((idResponse.isRight() ?  idResponse.asRight() : '').isNotEmpty){
      final myCookBookRemoteResponse = await foodRepo.getMyCookBookFoodsFromRemote(query);
      if (myCookBookRemoteResponse.isRight()) {
        await foodRepo.saveMyCookBookFoodsToLocalDb(myCookBookRemoteResponse.asRight());
        return getImmediateResponse(query);
      }
      return Left(getFailure(myCookBookRemoteResponse.asLeft()));
    }
    return getImmediateResponse(query);
  }

}