

import 'package:dartz/dartz.dart';

import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';



abstract class OpenAIFoodRemoteDataSource{


  Future<Either<Failure, FoodRemote>> suggestMeal(List<String> mustIngredients, String nationality, List<String> allergies, String diet);


  Future<Either<Failure, FoodRemote>> getMealRecipe(String mealName);


}