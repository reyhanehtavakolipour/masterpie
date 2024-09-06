

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/data/remote/model/wizard_response_remote_model.dart';


import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../../../../user/data/remote/model/profile_remote.dart';
import '../model/food_remote_model.dart';
import '../model/generic_food_remote_model.dart';
import '../model/meal_plan_remote_model.dart';
import '../model/suggested_food_remote_model.dart';
import '../model/suggested_foods_portion_remote_model.dart';

abstract class MasterPieFoodRemoteDataSource{


  Future<Either<Failure, Success>> saveToMyFavoriteGrocery(FoodRemote grocery, String userId);


  Future<Either<Failure, Success>> saveToMyFavoriteMeals(FoodRemote mealRemote, String userId);

  Future<Either<Failure, Success>> saveToMyCookBookMeals(FoodRemote mealRemote, String userId);

  Future<Either<Failure, Success>> saveToMyCookBook(List<FoodRemote> foods, String userId);

  Future<Either<Failure, Success>> saveToMyFavorite(List<FoodRemote> foods, String userId);

  Future<Either<Failure, Success>> updateMyFavoriteMeal(FoodRemote meal, String userId);

  Future<Either<Failure, Success>> updateMyCookBookMeal(FoodRemote meal, String userId);


  Future<Either<Failure, Success>> updateMyFavoriteGrocery(FoodRemote grocery, String userId);


  Future<Either<Failure, List<FoodRemote>>> getMyFavoriteFoods(String query, String userId);


  Future<Either<Failure, List<FoodRemote>>> getMyCookBookFoods(String query, String userId);



  Future<Either<Failure, WizardResponseRemoteModel>> suggestFoodsPortions(List<FoodRemote> foods, List<bool> isMainDishList, List<List<double>> servingRanges,
      List<List<double>> macroGoalsRange, List<String> restriction, String macroGoalType, List<double> macroPercentage);

  Future<Either<Failure, List<FoodRemote>>> logFoods(List<FoodRemote> foods, String date, String userId);


  Future<Either<Failure, List<FoodRemote>>> getLoggedFoods(String date, String userId);


  Future<Either<Failure, Success>> removeFoodFromMyFavorites(FoodRemote foodRemote, String userId);

  Future<Either<Failure, Success>> removeFoodFromMyCookBook(FoodRemote foodRemote, String userId);



  Future<Either<Failure, Success>> saveUserSuggestedFood(String foodName, List<String> ingredients, String diet, String nationality, String userId);

  Future<Either<Failure, SuggestedFoodRemote>> getUserSuggestedFoods(String userId);


  Future<Either<Failure, Success>> saveMealPlan(MealPlanRemote mealPlanRemote, String userId);

  Future<Either<Failure, Success>> saveMealPlans(List<MealPlanRemote> mealPlans, String userId);

  Future<Either<Failure, List<MealPlanRemote>>> getMealPlans(String userId);

}