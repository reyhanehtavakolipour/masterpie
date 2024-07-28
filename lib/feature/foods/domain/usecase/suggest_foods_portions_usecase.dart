

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/wizard_response_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/suggested_foods_portion_model.dart';
import '../repository/foods_repository.dart';

class SuggestFoodsPortionsUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, WizardResponseModel>> suggestFoodsPortions(
      List<Food> foods,
      List<bool> isMainDishList,
      List<List<double>> servingRanges,
      List<List<double>> macroGoalsRange,
      List<String> restriction,
      String macroGoalType,
      List<double> macroPercentage
      ) async{
      final suggestedFoodsResponseRemote = await repo.suggestFoodsPortionsFromRemote(foods, isMainDishList, servingRanges, macroGoalsRange, restriction, macroGoalType, macroPercentage);
      if(suggestedFoodsResponseRemote.isRight()){
          return Right(suggestedFoodsResponseRemote.asRight());
      }
      return Left(getFailure(suggestedFoodsResponseRemote.asLeft()));
  }

}