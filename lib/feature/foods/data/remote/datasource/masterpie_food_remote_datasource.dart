

import 'package:dartz/dartz.dart';


import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/food_remote_model.dart';
import '../model/suggested_food_remote_model.dart';
import '../model/suggested_foods_portion_remote_model.dart';

abstract class MasterPieFoodRemoteDataSource{

  Future<Either<Failure, Success>> saveSearchedGroceryProducts(List<FoodRemote> groceries);


  Future<Either<Failure, List<FoodRemote>>> getPreviouslySearchedGroceries();


  Future<Either<Failure, Success>> saveToMyGroceries(List<FoodRemote> groceries);

  Future<Either<Failure, Success>> saveToMyFavoriteGrocery(FoodRemote grocery, String userId);

  Future<Either<Failure, List<FoodRemote>>> getMyGroceryProducts(String query, String userId);


  Future<Either<Failure, Success>> saveToMyFavoriteMeals(FoodRemote mealRemote, String userId);


  Future<Either<Failure, Success>> updateMyFavoriteMeal(FoodRemote meal, String userId);


  Future<Either<Failure, Success>> updateMyFavoriteGrocery(FoodRemote grocery, String userId);


  Future<Either<Failure, List<FoodRemote>>> getMyFavoriteMeals(String query, String userId);

  Future<Either<Failure, List<FoodRemote>>> getMyFavoriteFoods(String query, String userId);

  Future<Either<Failure, Success>> saveSuggestedMeal(FoodRemote mealRemote);


  Future<Either<Failure, List<FoodRemote>>> getPreviouslySuggestedMeals();


  Future<Either<Failure, List<FoodRemote>>> getInternationalMeals(String nationalityRemote);

  Future<Either<Failure, List<SuggestedFoodsPortionRemote>>> suggestFoodsPortions(List<FoodRemote> foods, List<List<double>> servingRanges,
      List<List<double>> macroGoalsRange, List<String> restriction);

  Future<Either<Failure, List<FoodRemote>>> logFoods(List<FoodRemote> foods, String date, String userId);


  Future<Either<Failure, List<FoodRemote>>> getLoggedFoods(String date, String userId);


  Future<Either<Failure, Success>> removeFoodFromMyFavorites(FoodRemote foodRemote, String userId);


  Future<Either<Failure, Success>> saveUserSuggestedFood(String foodName, List<String> ingredients, String diet, String nationality, String userId);

  Future<Either<Failure, SuggestedFoodRemote>> getUserSuggestedFoods(String userId);
}