

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/user/data/local/datasource/user_hive_keyvalue_datasource.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/constant/hive_constants.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/print.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../../../user/domain/repository/user_repository.dart';
import '../../domain/model/food_model.dart';
import '../../domain/model/suggested_foods_portion_model.dart';
import '../../domain/repository/foods_repository.dart';
import '../local/datasource/food_local_datasource.dart';
import '../mapper/foods_mapper.dart';
import '../remote/datasource/fooddatacentral_grocery_product_remote_datasource.dart';
import '../remote/datasource/masterpie_food_remote_datasource.dart';
import '../remote/datasource/openai_food_remote_datasource.dart';
import '../remote/model/food_remote_model.dart';

const ERROR_FREE_USER_SUGGEST_FOOD_NOT_ALLOWED= 'free user, not allowed to use suggest food';
const ERROR_FREE_USER_FOODS_PORTION_NOT_ALLOWED= 'free user, not allowed to use foods portion recommender';
const ERROR_PAID_USER_SUGGEST_FOOD_OVER_LIMIT= 'paid user, suggest foods over than limit';
const ERROR_PAID_USER_FOODS_PORTION_OVER_LIMIT= 'paid user, foods portion recommender over than limit';
const ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED= 'free user, not allowed to create a new favorite anymore';


class FoodsRepositoryImpl extends FoodsRepository{

  final foodLocalDataSource = serviceLocator<FoodLocalDataSource>();
  final openAIFoodRemoteDataSource = serviceLocator<OpenAIFoodRemoteDataSource>();
  final masterPieFoodRemoteDataSource = serviceLocator<MasterPieFoodRemoteDataSource>();
  final productRemoteDataSource = serviceLocator<GroceryProductRemoteDataSource>();
  final userHiveDataSource = serviceLocator<UserHiveDataSource>();
  final mapper = serviceLocator<FoodsMapper>();
  final userRepo = serviceLocator<UserRepository>();



  @override
  Future<Either<Failure, List<Food>>> getGroceryProductsFromLocalDb(String query) async {
    List<Food> foods = [];
    final productsLocal = await foodLocalDataSource.getSearchedGroceryProducts(query);
    if(productsLocal.isRight()){
      foods.addAll(mapper.fromGroceryProductsLocal(productsLocal.asRight()));
      return Right(foods);
    }
    return Left(productsLocal.asLeft());
  }

  @override
  Future<Either<Failure, List<Food>>> getMyGroceryProductsFromRemote(String query) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    List<Food> foods = [];
    final myGroceriesRemoteResponse = await masterPieFoodRemoteDataSource.getMyGroceryProducts(query, userId);
    if(myGroceriesRemoteResponse.isRight()){
      foods.addAll(mapper.fromGroceryProductsRemote(myGroceriesRemoteResponse.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, List<Food>>> getGroceryProductsFromRemote(String query) async{
    List<Food> foods = [];
    // remote source: Food Data Central
    final productsRemoteFromFoodDataCentral = await productRemoteDataSource.getGroceryProductsFromFoodDataCentral(query);
    if(productsRemoteFromFoodDataCentral.isRight()){
      if(productsRemoteFromFoodDataCentral.asRight().isNotEmpty){
        FoodRemote food = productsRemoteFromFoodDataCentral.asRight()[0];
        final userPlan= await userRepo.getUserPlanInRemote();
        if(userPlan.isRight()){
          if(userPlan.asRight().subscriptionPlan!.plan != FREE_LABEL){
            await saveUserSuggestedFoodInRemote(food.name, food.ingredients, '', '');
          }
        }
      }
      foods.addAll(mapper.fromGroceryProductsRemote(productsRemoteFromFoodDataCentral.asRight()));
    }

    return Right(foods);
  }

  @override
  Future<Either<Failure, Success>> saveGroceryProductsToLocalDb(List<Food> foods) async{
    final foodsLocal = mapper.toGroceryProductsLocal(foods);
    return await foodLocalDataSource.saveFoods(foodsLocal);
  }


  @override
  Future<Either<Failure, Food>> suggestMealFromRemote(List<String> mustIngredients, String nationality, List<String> allergies, String diet) async{
    await userRepo.checkSubscriptionInRemote();
    final userPlanResponse= await userRepo.getUserPlanInRemote();
    if(userPlanResponse.isRight()){
      if(userPlanResponse.asRight().subscriptionPlan!.plan == FREE_LABEL){
        if(userPlanResponse.asRight().suggestFoodRequestsLeft > 0){
          final suggestMealResponse= await openAIFoodRemoteDataSource.suggestMeal(mustIngredients, nationality, allergies, diet);
          if(suggestMealResponse.isRight()){
            userRepo.updateSuggestFoodRequestsLeftInRemote();
            return Right(mapper.fromMealRemote(suggestMealResponse.asRight()));
          }
          return Left(suggestMealResponse.asLeft());
        }else{
          return const Left(FailureResponse(ERROR_FREE_USER_SUGGEST_FOOD_NOT_ALLOWED));
        }
      }
      if(userPlanResponse.asRight().suggestFoodRequestsLeft > 0){
        final suggestMealResponse= await openAIFoodRemoteDataSource.suggestMeal(mustIngredients, nationality, allergies, diet);
        if(suggestMealResponse.isRight()){
          userRepo.updateSuggestFoodRequestsLeftInRemote();
          await saveUserSuggestedFoodInRemote(suggestMealResponse.asRight().name, suggestMealResponse.asRight().ingredients, '', '');
          return Right(mapper.fromMealRemote(suggestMealResponse.asRight()));
        }
        return Left(suggestMealResponse.asLeft());
      }else{
        return const Left(FailureResponse(ERROR_PAID_USER_SUGGEST_FOOD_OVER_LIMIT));
      }
    }
    return const Left(FailureResponse(ERROR_TRY_AGAIN));
  }

  @override
  Future<Either<Failure, Food>> getMealFromLocalDb(int mealId) async{
    final mealLocalDbResponse= await foodLocalDataSource.getMeal(mealId);
    if(mealLocalDbResponse.isRight()){
      return Right(mapper.fromMealLocal(mealLocalDbResponse.asRight()));
    }
    return Left(mealLocalDbResponse.asLeft());
  }

  @override
  Future<Either<Failure, int>> saveMealToLocalDb(Food food) async{
    final saveMealResponse= await foodLocalDataSource.saveFood(mapper.toMealLocal(food));
    if(saveMealResponse.isRight()){
      return Right(saveMealResponse.asRight());
    }
    return Left(saveMealResponse.asLeft());
  }

  @override
  Future<Either<Failure, List<Food>>> getLastSearchedGroceryProducts() async{
    List<Food> foods = [];
    final productsLocal = await foodLocalDataSource.getLastSearchedGroceryProducts();
    if(productsLocal.isRight()){
      foods.addAll(mapper.fromGroceryProductsLocal(productsLocal.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, List<Food>>> getMyGroceryProductsFromLocalDb(String query) async{
    List<Food> foods = [];
    final productsLocal = await foodLocalDataSource.getMyGroceryProducts(query);
    if(productsLocal.isRight()){
      foods.addAll(mapper.fromMyGroceryProductsLocal(productsLocal.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, List<Food>>> getMyMealsFromLocalDb(String query) async{
    List<Food> foods = [];
    final mealsLocal = await foodLocalDataSource.getMyMeals(query);
    if(mealsLocal.isRight()){
      foods.addAll(mapper.fromMyMealsLocal(mealsLocal.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, Success>> saveMyGroceryProductToRemote(Food food) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final userPlanResponse= await userRepo.getUserPlanInRemote();
    if(userPlanResponse.isRight()){
      if(userPlanResponse.asRight().subscriptionPlan!.plan == FREE_LABEL){
        if(userPlanResponse.asRight().favoriteFoodLeft > 0){
          final saveMyFoodsResponse= await masterPieFoodRemoteDataSource.saveToMyFavoriteGrocery(mapper.toGroceryRemote(food), userId);
          if(saveMyFoodsResponse.isRight()){
            userRepo.updateFavoriteRequestsLeftInRemote(true);
            return const Right(Success());
          }
          return Left(saveMyFoodsResponse.asLeft());
        }else{
          return const Left(FailureResponse(ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED));
        }
      }
      final saveMyFoodsResponse= await masterPieFoodRemoteDataSource.saveToMyFavoriteGrocery(mapper.toGroceryRemote(food), userId);
      if(saveMyFoodsResponse.isRight()){
        return const Right(Success());
      }
      return Left(saveMyFoodsResponse.asLeft());
    }
    return const Left(FailureResponse(ERROR_TRY_AGAIN));
  }

  @override
  Future<Either<Failure, Success>> saveMyMealToRemote(Food food) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final userPlanResponse= await userRepo.getUserPlanInRemote();
    if(userPlanResponse.isRight()){
      if(userPlanResponse.asRight().subscriptionPlan!.plan == FREE_LABEL){
        if(userPlanResponse.asRight().favoriteFoodLeft > 0){
          final saveMyFoodsResponse= await masterPieFoodRemoteDataSource.saveToMyFavoriteMeals(mapper.toMealRemote(food), userId);
          if(saveMyFoodsResponse.isRight()){
            userRepo.updateFavoriteRequestsLeftInRemote(true);
            return const Right(Success());
          }
          return Left(saveMyFoodsResponse.asLeft());
        }else{
          return const Left(FailureResponse(ERROR_FREE_USER_FAVORITE_FOOD_NOT_ALLOWED));
        }
      }
      final saveMyFoodsResponse= await masterPieFoodRemoteDataSource.saveToMyFavoriteMeals(mapper.toMealRemote(food), userId);
      if(saveMyFoodsResponse.isRight()){
        return const Right(Success());
      }
      return Left(saveMyFoodsResponse.asLeft());
    }
    return const Left(FailureResponse(ERROR_TRY_AGAIN));
  }

  @override
  Future<Either<Failure, Success>> saveSuggestedMealToRemote(Food food) async{
    final saveFoodResponse= await masterPieFoodRemoteDataSource.saveSuggestedMeal(mapper.toMealRemote(food));
    if(saveFoodResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveFoodResponse.asLeft());
  }

  @override
  Future<Either<Failure, List<Food>>> getInternationalMealsFromRemote(String query) async{
    List<Food> foods = [];
    final foodsRemoteResponse = await masterPieFoodRemoteDataSource.getInternationalMeals(query);
    if(foodsRemoteResponse.isRight()){
      foods.addAll(mapper.fromGroceryProductsRemote(foodsRemoteResponse.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, List<Food>>> getMyFoodsFromRemote(String query) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    List<Food> foods = [];
    final myFoodsRemoteResponse = await masterPieFoodRemoteDataSource.getMyFavoriteFoods(query, userId);
    if(myFoodsRemoteResponse.isRight()){
      foods.addAll(mapper.fromFoodsRemote(myFoodsRemoteResponse.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, Success>> saveInternationalMealsToLocalDb(List<Food> meals) async{
    final saveFoodsResponse= await foodLocalDataSource.saveInternationalMeals(mapper.toInternationalMealsLocal(meals));
    if(saveFoodsResponse.isRight()){
      return const Right(Success());
    }
    return Left(saveFoodsResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> saveMyFoodsToLocalDb(List<Food> foods) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final saveMyFoodsResponse= await foodLocalDataSource.saveMyFoods(mapper.toMyFoodsLocal(foods, userId));
    if(saveMyFoodsResponse.isRight()){
      return Right(saveMyFoodsResponse.asRight());
    }
    return Left(saveMyFoodsResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> saveMyGroceryProductsToLocalDb(List<Food> foods) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final saveMyFoodsResponse= await foodLocalDataSource.saveMyGroceries(mapper.toMyGroceryProductsLocal(foods, userId));
    if(saveMyFoodsResponse.isRight()){
      return Right(saveMyFoodsResponse.asRight());
    }
    return Left(saveMyFoodsResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> saveMyMealToLocalDb(Food meal) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final saveMealResponse= await foodLocalDataSource.saveMyFood(mapper.toMyMealLocal(meal, userId), userId);
    if(saveMealResponse.isRight()){
      return Right(saveMealResponse.asRight());
    }
    return Left(saveMealResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> saveMyGroceryToLocalDb(Food grocery) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final saveGroceryResponse= await foodLocalDataSource.saveMyFood(mapper.toMyGroceryLocal(grocery, userId), userId);
    if(saveGroceryResponse.isRight()){
      return Right(saveGroceryResponse.asRight());
    }
    return Left(saveGroceryResponse.asLeft());
  }

  @override
  Future<Either<Failure, List<Food>>> getMyFoodsFromLocalDb(String query) async{
    List<Food> foods = [];
    final foodsLocal = await foodLocalDataSource.getMyFoods(query);
    if(foodsLocal.isRight()){
      foods.addAll(mapper.fromMyFoodsLocal(foodsLocal.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, List<Food>>> getMyMealsFromRemote(String query) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    List<Food> foods = [];
    final myMealsRemoteResponse = await masterPieFoodRemoteDataSource.getMyFavoriteMeals(query, userId);
    if(myMealsRemoteResponse.isRight()){
      foods.addAll(mapper.fromGroceryProductsRemote(myMealsRemoteResponse.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, Success>> saveMyMealsToLocalDb(List<Food> foods) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final saveMealsResponse= await foodLocalDataSource.saveMyMeals(mapper.toMyMealsLocal(foods, userId));
    if(saveMealsResponse.isRight()){
      return Right(saveMealsResponse.asRight());
    }
    return Left(saveMealsResponse.asLeft());
  }

  @override
  Future<Either<Failure, List<Food>>> getInternationalMealsFromLocalDb(String query) async{
    List<Food> foods = [];
    final foodsLocal = await foodLocalDataSource.getInternationalMeals(query);
    if(foodsLocal.isRight()){
      foods.addAll(mapper.fromInternationalMealsLocal(foodsLocal.asRight()));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, Success>> updateMyGroceryInLocalDb(Food grocery) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final saveGroceryResponse= await foodLocalDataSource.updateMyFood(mapper.toMyGroceryLocal(grocery, userId));
    if(saveGroceryResponse.isRight()){
      return Right(saveGroceryResponse.asRight());
    }
    return Left(saveGroceryResponse.asLeft());
  }


  @override
  Future<Either<Failure, Success>> updateMyMealInLocalDb(Food meal) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final saveMealResponse= await foodLocalDataSource.updateMyFood(mapper.toMyMealLocal(meal, userId));
    if(saveMealResponse.isRight()){
      return Right(saveMealResponse.asRight());
    }
    return Left(saveMealResponse.asLeft());
  }

  @override
  Future<Either<Failure, bool>> isItInMyFavoritesLocalDb(String id) async{
    final isIsInMyFoodsResponse= await foodLocalDataSource.isItInMyFavorites(id);
    if(isIsInMyFoodsResponse.isRight()){
      return Right(isIsInMyFoodsResponse.asRight());
    }
    return Left(isIsInMyFoodsResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateFavoriteFieldOfGroceryLocalDb(Food food, bool isFavorite) async{
    final updateResponse= await foodLocalDataSource.updateFavoriteFieldOfFood(mapper.toGroceryLocal(food), isFavorite);
    if(updateResponse.isRight()){
      return const Right(Success());
    }
    return Left(updateResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateFavoriteFieldOfMealLocalDb(Food food, bool isFavorite) async{
    final updateResponse= await foodLocalDataSource.updateFavoriteFieldOfFood(mapper.toMealLocal(food), isFavorite);
    if(updateResponse.isRight()){
      return const Right(Success());
    }
    return Left(updateResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> removeGroceryFromMyFavoritesInLocalDb(Food grocery) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final removeGroceryResponse= await foodLocalDataSource.removeMyFood(mapper.toMyGroceryLocal(grocery, userId));
    if(removeGroceryResponse.isRight()){
      return Right(removeGroceryResponse.asRight());
    }
    return Left(removeGroceryResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> removeGroceryFromMyFavoritesInRemote(Food food) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final removeGroceryResponse= await masterPieFoodRemoteDataSource.removeFoodFromMyFavorites(mapper.toGroceryRemote(food), userId);
    if(removeGroceryResponse.isRight()){
      userRepo.updateFavoriteRequestsLeftInRemote(false);
      return Right(removeGroceryResponse.asRight());
    }
    return Left(removeGroceryResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> removeMealFromMyFavoritesInLocalDb(Food meal) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final removeMealResponse= await foodLocalDataSource.removeMyFood(mapper.toMyMealLocal(meal, userId));
    if(removeMealResponse.isRight()){
      return Right(removeMealResponse.asRight());
    }
    return Left(removeMealResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> removeMealFromMyFavoritesInRemote(Food food) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final removeGroceryResponse= await masterPieFoodRemoteDataSource.removeFoodFromMyFavorites(mapper.toMealRemote(food), userId);
    if(removeGroceryResponse.isRight()){
      return Right(removeGroceryResponse.asRight());
    }
    return Left(removeGroceryResponse.asLeft());
  }

  @override
  Future<Either<Failure, List<SuggestedFoodsPortion>>> suggestFoodsPortionsFromRemote(List<Food> foods, List<List<double>> servingRanges,
      List<List<double>> macroGoalsRange, List<String> restriction) async{
    await userRepo.checkSubscriptionInRemote();
    final userPlanResponse= await userRepo.getUserPlanInRemote();
    if(userPlanResponse.isRight()){
      if(userPlanResponse.asRight().subscriptionPlan!.plan == FREE_LABEL){
        if(userPlanResponse.asRight().foodPortionRequestsLeft > 0){
          final suggestedFoodsPortionResponse = await masterPieFoodRemoteDataSource.suggestFoodsPortions(mapper.toFoodsRemote(foods), servingRanges,
              macroGoalsRange, restriction);
          if(suggestedFoodsPortionResponse.isRight()){
            userRepo.updateFoodsPortionRequestsLeftInRemote();
            return Right(mapper.fromSuggestedFoodsPortionRemote(suggestedFoodsPortionResponse.asRight()));
          }
          return Left(suggestedFoodsPortionResponse.asLeft());
        }else{
          return const Left(FailureResponse(ERROR_FREE_USER_FOODS_PORTION_NOT_ALLOWED));
        }
      }
      if(userPlanResponse.asRight().foodPortionRequestsLeft > 0){
        final suggestedFoodsPortionResponse = await masterPieFoodRemoteDataSource.suggestFoodsPortions(mapper.toFoodsRemote(foods), servingRanges,
            macroGoalsRange, restriction);
        if(suggestedFoodsPortionResponse.isRight()){
          userRepo.updateFoodsPortionRequestsLeftInRemote();
          return Right(mapper.fromSuggestedFoodsPortionRemote(suggestedFoodsPortionResponse.asRight()));
        }
        return Left(suggestedFoodsPortionResponse.asLeft());
      }else{
        return const Left(FailureResponse(ERROR_PAID_USER_FOODS_PORTION_OVER_LIMIT));
      }
    }
    return const Left(FailureResponse(ERROR_TRY_AGAIN));
  }



  @override
  Future<Either<Failure, List<Food>>> logFoodsInRemote(List<Food> foods) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    final logFoodsResponse = await masterPieFoodRemoteDataSource.logFoods(mapper.toFoodsRemote(foods), formattedDate, userId);
    if(logFoodsResponse.isRight()){
      return Right(mapper.fromFoodsRemote(logFoodsResponse.asRight()));
    }
    return Left(logFoodsResponse.asLeft());
  }

  @override
  Future<Either<Failure, List<Food>>> getLoggedFoodsFromRemote(String date) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final loggedFoodsResponse = await masterPieFoodRemoteDataSource.getLoggedFoods(date, userId);
    if(loggedFoodsResponse.isRight()){
      return Right(mapper.fromFoodsRemote(loggedFoodsResponse.asRight()));
    }
    return Left(loggedFoodsResponse.asLeft());
  }


  @override
  Future<Either<Failure, List<Food>>> getLoggedFoodsFromLocalDb(String date) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final loggedFoodsResponse = await foodLocalDataSource.getLoggedFoods(date, userId);
    if(loggedFoodsResponse.isRight()){
      return Right(mapper.fromLoggedFoodsLocal(loggedFoodsResponse.asRight()));
    }
    return Left(loggedFoodsResponse.asLeft());
  }

  @override
  Future<Either<Failure, List<Food>>> saveLoggedFoodsToLocalDb(List<Food> foods, String date) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final foodsLocal = mapper.toLoggedFoodsLocal(foods, date, userId);
    await foodLocalDataSource.deleteLog(date);
    final result= await foodLocalDataSource.saveLoggedFoods(foodsLocal);
    return Right(mapper.fromLoggedFoodsLocal(result.asRight()));
  }

  @override
  Future<Either<Failure, Food>> getMealRecipeFromRemote(String name, List<String> mustIngredient, List<String> allergies) async{
    final mealResponse= await openAIFoodRemoteDataSource.getMealRecipe(name, mustIngredient, allergies);
    if(mealResponse.isRight()){
      return Right(mapper.fromMealRemote(mealResponse.asRight()));
    }
    return Left(mealResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateMyFavoriteGroceryInRemote(Food grocery) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final groceryUpdateResponse= await masterPieFoodRemoteDataSource.updateMyFavoriteGrocery(mapper.toGroceryRemote(grocery), userId);
    if(groceryUpdateResponse.isRight()){
      return const Right(Success());
    }
    return Left(groceryUpdateResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> updateMyFavoriteMealInRemote(Food meal) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final mealUpdateResponse= await masterPieFoodRemoteDataSource.updateMyFavoriteMeal(mapper.toMealRemote(meal), userId);
    if(mealUpdateResponse.isRight()){
      return const Right(Success());
    }
    return Left(mealUpdateResponse.asLeft());
  }

  @override
  Future<Either<Failure, Success>> saveUserSuggestedFoodInRemote(String name, List<String> ingredients, String diet, String nationality) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final mealUpdateResponse= await masterPieFoodRemoteDataSource.saveUserSuggestedFood(name, ingredients, diet, nationality, userId);
    if(mealUpdateResponse.isRight()){
      return const Right(Success());
    }
    return Left(mealUpdateResponse.asLeft());
  }

  @override
  Future<Either<Failure, String>> isFoodInMyFavoritesLocalDb(Food food) async{
    String userId = await userHiveDataSource.getString(KEY_USER_ID);
    final foodLocal = mapper.toMyFoodLocal(food, userId);
    return await foodLocalDataSource.isFoodInMyFavorites(foodLocal);
  }




}