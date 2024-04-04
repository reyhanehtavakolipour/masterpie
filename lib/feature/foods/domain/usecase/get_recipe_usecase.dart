


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/response/failure.dart';
import '../repository/foods_repository.dart';



class GetRecipeUseCase{

  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, GenericFood>> getRecipe(GenericFood genericFood) async{
    final recipeResponse = await repo.getGroceryFromRemote(genericFood.id);
    if(recipeResponse.isLeft()){
      return Left(recipeResponse.asLeft());
    }

    return Right(recipeResponse.asRight());
  }


}