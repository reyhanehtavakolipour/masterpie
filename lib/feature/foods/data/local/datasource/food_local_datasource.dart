


import 'package:dartz/dartz.dart';
import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/food_local_model.dart';
import '../model/international_meal_local_model.dart';
import '../model/logged_foods_local_model.dart';
import '../model/my_food_local_model.dart';

abstract class FoodLocalDataSource{


  //source: table Food
  Future<Either<Failure, Success>> saveFoods(List<FoodLocal> foodsLocal);

  Future<Either<Failure, List<FoodLocal>>> getSearchedGroceryProducts(String query);

  Future<Either<Failure, List<FoodLocal>>> getLastSearchedGroceryProducts();

  Future<Either<Failure, Success>> updateFavoriteFieldOfFood(FoodLocal foodLocal, bool isFavorite);




  //source: table MyFood
  Future<Either<Failure, List<MyFoodLocal>>> getMyFoods(String query);

  Future<Either<Failure, List<MyFoodLocal>>> getMyCookBookFoods(String query);

  Future<Either<Failure, Success>> saveMyFood(MyFoodLocal myFoodLocal, String myId);

  Future<Either<Failure, Success>> removeMyFood(MyFoodLocal myFoodLocal);

  Future<Either<Failure, Success>> updateMyFood(MyFoodLocal myFoodLocal);

  Future<Either<Failure, Success>> saveMyFoods(List<MyFoodLocal> myFoodsLocal);


  Future<Either<Failure, Success>> saveMyCookBookFood(MyFoodLocal myFoodLocal, String myId);

  Future<Either<Failure, Success>> removeMyCookBookFood(MyFoodLocal myFoodLocal);

  Future<Either<Failure, Success>> updateMyCookBookFood(MyFoodLocal myFoodLocal);

  Future<Either<Failure, Success>> saveMyCookBookFoods(List<MyFoodLocal> myFoodsLocal);



  Future<Either<Failure, Success>> saveMyMeals(List<MyFoodLocal> myFoodsLocal);

  Future<Either<Failure, Success>> saveMyGroceries(List<MyFoodLocal> myFoodsLocal);

  Future<Either<Failure, List<MyFoodLocal>>> getMyGroceryProducts(String query);

  Future<Either<Failure, List<MyFoodLocal>>> getMyMeals(String query);

  Future<Either<Failure, bool>> isItInMyFavorites(String id);

  Future<Either<Failure, bool>> isItInMyCookBook(String id);


  Future<Either<Failure, String>> isFoodInMyFavorites(MyFoodLocal foodLocal);

  Future<Either<Failure, String>> isFoodInMyCookBook(MyFoodLocal foodLocal);



  //source: table InternationalRecipe
  Future<Either<Failure, Success>> saveInternationalMeals(List<InternationalMealLocal> meals);

  Future<Either<Failure, List<InternationalMealLocal>>> getInternationalMeals(String query);


  // source: table logged foods
  Future<Either<Failure, List<LoggedFoodsLocal>>> getAllLoggedFoods();

  Future<Either<Failure, List<LoggedFoodsLocal>>> getLoggedFoods(String date, String myId);

  Future<Either<Failure, List<LoggedFoodsLocal>>> saveLoggedFoods(List<LoggedFoodsLocal> foods);

  Future<Either<Failure, Success>> deleteLog(String date);

}