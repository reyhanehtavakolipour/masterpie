


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';

import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../repository/foods_repository.dart';


class GroceriesUseCase{

  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, List<GenericFood>>> getGroceries(String query) async{
    final foodsResponseRemote = await repo.getGroceryProductsFromRemote(query);
    if(foodsResponseRemote.isRight()){
      return Right(foodsResponseRemote.asRight());
    }
    return Left(getFailure(foodsResponseRemote.asLeft()));
  }


}