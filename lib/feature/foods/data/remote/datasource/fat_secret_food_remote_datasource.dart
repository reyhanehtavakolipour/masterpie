


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';

import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';
import '../model/generic_food_remote_model.dart';

abstract class FatSecretRemoteDataSource{


  Future<Either<Failure, List<GenericFoodRemote>>> getGroceries(String query);

  Future<Either<Failure, List<GenericFoodRemote>>> getRecipes(String query);

  Future<Either<Failure, GenericFoodRemote>> getRecipe(String recipeId);

  Future<Either<Failure, GenericFoodRemote>> getGroceryWithBarcode(String barcode);

}