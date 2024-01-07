

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/food_type.dart';
import '../repository/foods_repository.dart';

class GetMyFavoriteFoodsUseCase{

  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, List<Food>>> getImmediateResponse(FoodType foodsType, String query) async {
    if (foodsType == FoodType.meal) {
      final meals = await repo.getMyMealsFromLocalDb(query);
      return Right(meals.asRight());
    } else if (foodsType == FoodType.groceryProduct) {
      final groceries = await repo.getMyGroceryProductsFromLocalDb(query);
      return Right(groceries.asRight());
    } else {
      final foods = await repo.getMyFoodsFromLocalDb(query);
      return Right(foods.asRight());
    }
  }

  Future<Either<Failure, String>> searchFoodLocally(Food food) async {
    final exist = await repo.isFoodInMyFavoritesLocalDb(food);
    return Right(exist.asRight());
  }

  Future<Either<Failure, List<Food>>> getMyFavoriteFoods(FoodType foodsType, String query) async {
    if (foodsType == FoodType.meal) {
      final myFavoritesMealsRemoteResponse = await repo.getMyMealsFromRemote(
          query);
      if (myFavoritesMealsRemoteResponse.isRight()) {
        await repo.saveMyMealsToLocalDb(myFavoritesMealsRemoteResponse.asRight());
        return getImmediateResponse(foodsType, query);
      }
      return Left(getFailure(myFavoritesMealsRemoteResponse.asLeft()));
    } else if (foodsType == FoodType.groceryProduct) {
      final myFavoriteGroceriesRemoteResponse = await repo
          .getMyGroceryProductsFromRemote(query);
      if (myFavoriteGroceriesRemoteResponse.isRight()) {
        await repo.saveMyGroceryProductsToLocalDb(myFavoriteGroceriesRemoteResponse.asRight());
        return getImmediateResponse(foodsType, query);
      }
      return Left(getFailure(myFavoriteGroceriesRemoteResponse.asLeft()));
    } else {
      final myFavoritesRemoteResponse = await repo.getMyFoodsFromRemote(query);
      if (myFavoritesRemoteResponse.isRight()) {
        await repo.saveMyFoodsToLocalDb(myFavoritesRemoteResponse.asRight());
        return getImmediateResponse(foodsType, query);
      }
      return Left(getFailure(myFavoritesRemoteResponse.asLeft()));
    }
  }

}