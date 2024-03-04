


import 'package:dartz/dartz.dart';

import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';
import '../model/generic_food_remote_model.dart';

abstract class GroceryProductRemoteDataSource{


  Future<Either<Failure, List<GenericFoodRemote>>> getGroceryProductsFromFoodDataCentral(String query);

}