

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/suggested_foods_portion_model.dart';
import '../repository/foods_repository.dart';

class SuggestFoodsPortionsUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, List<SuggestedFoodsPortion>>> suggestFoodsPortions(
      List<Food> foods,
      List<List<double>> servingRanges,
      List<List<double>> macroGoalsRange,
      List<String> restriction,
      String macroGoalType,
      List<double> macroPercentage
      ) async{
      final suggestedFoodsResponseRemote = await repo.suggestFoodsPortionsFromRemote(foods, servingRanges, macroGoalsRange, restriction, macroGoalType, macroPercentage);
      if(suggestedFoodsResponseRemote.isRight()){
          return Right(suggestedFoodsResponseRemote.asRight());
      }
      return Left(getFailure(suggestedFoodsResponseRemote.asLeft()));
  }

}