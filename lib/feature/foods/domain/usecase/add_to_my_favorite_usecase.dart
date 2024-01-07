

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/food_type.dart';
import '../repository/foods_repository.dart';

class AddToMyFavoriteUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, Food>> addToMyFavorites(Food food) async{
    if(food.foodType == FoodType.meal){
      final addToMyFavoritesRemoteResponse = await repo.saveMyMealToRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
        await repo.saveMyMealToLocalDb(food);
        return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }else{
      final addToMyFavoritesRemoteResponse = await repo.saveMyGroceryProductToRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
        await repo.saveMyGroceryToLocalDb(food);
        return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }
  }


  Future<Either<Failure, Food>> updateMyFavoriteFood(Food food) async{
    if(food.foodType == FoodType.meal){
      final addToMyFavoritesRemoteResponse = await repo.updateMyFavoriteMealInRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
      await repo.updateMyMealInLocalDb(food);
      return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }else{
      final addToMyFavoritesRemoteResponse = await repo.updateMyFavoriteGroceryInRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
      await repo.updateMyGroceryInLocalDb(food);
      return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }
  }


  Future<Either<Failure, Food>> addOrUpdateMyFavoriteFood(Food food) async{
    final myFavoriteFoodResponse = await repo.isItInMyFavoritesLocalDb(food.id);
    if (myFavoriteFoodResponse.isRight()) {
      if(myFavoriteFoodResponse.asRight()){
        // existed in my favorite food
        return updateMyFavoriteFood(food);
      }else{
        return addToMyFavorites(food);
      }
    }
    return Left(getFailure(myFavoriteFoodResponse.asLeft()));
  }

}