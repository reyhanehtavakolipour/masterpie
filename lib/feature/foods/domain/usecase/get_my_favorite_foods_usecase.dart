

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/food_type.dart';
import '../repository/foods_repository.dart';

class GetMyFavoriteFoodsUseCase{

  final foodRepo = serviceLocator<FoodsRepository>();

  final userRepo = serviceLocator<UserRepository>();


  Future<Either<Failure, List<Food>>> getImmediateResponse(FoodType foodsType, String query) async {
    if (foodsType == FoodType.meal) {
      final meals = await foodRepo.getMyMealsFromLocalDb(query);
      return Right(meals.asRight());
    } else if (foodsType == FoodType.groceryProduct) {
      final groceries = await foodRepo.getMyGroceryProductsFromLocalDb(query);
      return Right(groceries.asRight());
    } else {
      final foods = await foodRepo.getMyFoodsFromLocalDb(query);
      return Right(foods.asRight());
    }
  }

  Future<Either<Failure, String>> searchFoodLocally(Food food) async {
    final exist = await foodRepo.isFoodInMyFavoritesLocalDb(food);
    return Right(exist.asRight());
  }

  Future<Either<Failure, bool>> isMacroEditionAvailable() async {
    final enabled = await userRepo.isMacroEditionAvailableInRemote();
    return Right(enabled.asRight());
  }

  Future<Either<Failure, List<Food>>> getMyFavoriteFoods(FoodType foodsType, String query) async {
    if (foodsType == FoodType.meal) {
      final myFavoritesMealsRemoteResponse = await foodRepo.getMyMealsFromRemote(
          query);
      if (myFavoritesMealsRemoteResponse.isRight()) {
        await foodRepo.saveMyMealsToLocalDb(myFavoritesMealsRemoteResponse.asRight());
        return getImmediateResponse(foodsType, query);
      }
      return Left(getFailure(myFavoritesMealsRemoteResponse.asLeft()));
    } else if (foodsType == FoodType.groceryProduct) {
      final myFavoriteGroceriesRemoteResponse = await foodRepo
          .getMyGroceryProductsFromRemote(query);
      if (myFavoriteGroceriesRemoteResponse.isRight()) {
        await foodRepo.saveMyGroceryProductsToLocalDb(myFavoriteGroceriesRemoteResponse.asRight());
        return getImmediateResponse(foodsType, query);
      }
      return Left(getFailure(myFavoriteGroceriesRemoteResponse.asLeft()));
    } else {
      final myFavoritesRemoteResponse = await foodRepo.getMyFoodsFromRemote(query);
      if (myFavoritesRemoteResponse.isRight()) {
        await foodRepo.saveMyFoodsToLocalDb(myFavoritesRemoteResponse.asRight());
        return getImmediateResponse(foodsType, query);
      }
      return Left(getFailure(myFavoritesRemoteResponse.asLeft()));
    }
  }

}