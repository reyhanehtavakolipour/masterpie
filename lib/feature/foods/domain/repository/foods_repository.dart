

import 'package:dartz/dartz.dart';

import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../model/food_model.dart';
import '../model/suggested_foods_portion_model.dart';



abstract class FoodsRepository{


  //source: Foods Data
  // case 3
  Future<Either<Failure, List<Food>>> getGroceryProductsFromRemote(String query);


  //source: supabase

  //case 1 and case 2
  Future<Either<Failure, List<Food>>> getMyFoodsFromRemote(String query);


  //cloud
  Future<Either<Failure, List<SuggestedFoodsPortion>>> suggestFoodsPortionsFromRemote(List<Food> foods, List<List<double>> servingRanges,
      List<List<double>> macroGoalsRange, List<String> restriction);



  Future<Either<Failure, Success>> saveMyGroceryProductToRemote(Food food);

  Future<Either<Failure, Success>> removeGroceryFromMyFavoritesInRemote(Food food);

  Future<Either<Failure, Success>> saveMyMealToRemote(Food food);

  Future<Either<Failure, Success>> removeMealFromMyFavoritesInRemote(Food food);

  Future<Either<Failure, List<Food>>> logFoodsInRemote(List<Food> foods);

  Future<Either<Failure, List<Food>>> getLoggedFoodsFromRemote(String date);


  Future<Either<Failure, Success>> updateMyFavoriteMealInRemote(Food meal);


  Future<Either<Failure, Success>> updateMyFavoriteGroceryInRemote(Food grocery);

  //source: openAI
  Future<Either<Failure, Food>> suggestMealFromRemote(List<String> mustIngredients, String nationality, List<String> allergies, String diet);

  Future<Either<Failure, Food>> getMealRecipeFromRemote(String name, List<String> mustIngredient, List<String> allergies);


  // source: table LoggedFoods
  Future<Either<Failure, List<Food>>> getLoggedFoodsFromLocalDb(String date);

  Future<Either<Failure, List<Food>>> saveLoggedFoodsToLocalDb(List<Food> foods, String date);



  //source: table MyFood

  //case 4 and case 6
  Future<Either<Failure, List<Food>>> getMyMealsFromLocalDb(String query);

  //case 3 and case 5
  Future<Either<Failure, List<Food>>> getMyGroceryProductsFromLocalDb(String query);

  Future<Either<Failure, List<Food>>> getMyFoodsFromLocalDb(String query);

  Future<Either<Failure, Success>> saveMyMealToLocalDb(Food meal);

  Future<Either<Failure, Success>> removeMealFromMyFavoritesInLocalDb(Food meal);

  Future<Either<Failure, Success>> updateMyMealInLocalDb(Food meal);

  Future<Either<Failure, Success>> saveMyGroceryToLocalDb(Food grocery);

  Future<Either<Failure, Success>> removeGroceryFromMyFavoritesInLocalDb(Food grocery);

  Future<Either<Failure, Success>> updateMyGroceryInLocalDb(Food grocery);

  Future<Either<Failure, Success>> saveMyGroceryProductsToLocalDb(List<Food> foods);

  Future<Either<Failure, Success>> saveMyMealsToLocalDb(List<Food> foods);

  Future<Either<Failure, Success>> saveMyFoodsToLocalDb(List<Food> foods);

  Future<Either<Failure, bool>> isItInMyFavoritesLocalDb(String id);

  Future<Either<Failure, String>> isFoodInMyFavoritesLocalDb(Food food);





  // source: table InternationalMeal
  Future<Either<Failure, Success>> saveInternationalMealsToLocalDb(List<Food> meals);

  Future<Either<Failure, List<Food>>> getInternationalMealsFromLocalDb(String query);


  // source: table Food

  Future<Either<Failure, Success>> saveGroceryProductsToLocalDb(List<Food> foods);

  Future<Either<Failure, List<Food>>> getGroceryProductsFromLocalDb(String query);

  Future<Either<Failure, List<Food>>> getLastSearchedGroceryProducts();

  Future<Either<Failure, Success>> updateFavoriteFieldOfMealLocalDb(Food food, bool isFavorite);

  Future<Either<Failure, Success>> updateFavoriteFieldOfGroceryLocalDb(Food food, bool isFavorite);


  Future<Either<Failure, Success>> saveUserSuggestedFoodInRemote(String name, List<String> ingredients, String diet, String nationality);



}