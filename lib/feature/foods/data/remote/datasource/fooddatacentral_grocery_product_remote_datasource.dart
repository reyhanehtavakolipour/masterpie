


import 'package:dartz/dartz.dart';

import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';

abstract class GroceryProductRemoteDataSource{


  Future<Either<Failure, List<FoodRemote>>> getGroceryProductsFromFoodDataCentral(String query);

  Future<Either<Failure, List<FoodRemote>>> getGroceryProductsFromOpenFoodFacts(String query);


}