

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/food_type.dart';
import '../repository/foods_repository.dart';

class RemoveFromMyFavoriteUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, Food>> removeFromMyFavorites(Food food) async{
    if(food.foodType == FoodType.meal){
      final removeFromMyFavoritesRemoteResponse = await repo.removeMealFromMyFavoritesInRemote(food);
      if(removeFromMyFavoritesRemoteResponse.isRight()){
        await repo.removeMealFromMyFavoritesInLocalDb(food);
        return Right(food);
      }
      return Left(getFailure(removeFromMyFavoritesRemoteResponse.asLeft()));
    }else{
      final removeFromMyFavoritesRemoteResponse = await repo.removeGroceryFromMyFavoritesInRemote(food);
      if(removeFromMyFavoritesRemoteResponse.isRight()){
        await repo.removeGroceryFromMyFavoritesInLocalDb(food);
        return Right(food);
      }
      return Left(getFailure(removeFromMyFavoritesRemoteResponse.asLeft()));
    }
  }

}