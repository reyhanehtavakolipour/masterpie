

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../repository/foods_repository.dart';

class SuggestFoodUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, Food>> suggestFood(
      List<String>? ingredientsIncluded,
      List<String>? allergies,
      String? nationality,
      String? diet
      ) async{

      final foodResponseRemote = await repo.suggestMealFromRemote(ingredientsIncluded ?? [], nationality ?? '', allergies ?? [], diet ?? '');
      if(foodResponseRemote.isRight()){
        final foodDetailResponseRemote = await repo.getMealRecipeFromRemote(foodResponseRemote.asRight().name);
        if(foodDetailResponseRemote.isRight()){
          return Right(foodDetailResponseRemote.asRight());
        }
        return Left(getFailure(foodDetailResponseRemote.asLeft()));
      }
      return Left(getFailure(foodResponseRemote.asLeft()));
  }

}