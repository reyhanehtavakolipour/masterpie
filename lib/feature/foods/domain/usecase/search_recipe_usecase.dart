


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/food_type.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';

import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../repository/foods_repository.dart';



class RecipesUseCase{

  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, List<GenericFood>>> getRecipes(String query) async{
    List<GenericFood> foods= [];
    final favoriteResponseRemote = await repo.getMyMealsFromLocalDb(query);
    final cookBookResponseRemote = await repo.getMyCookBookFoodsFromLocalDb(query);
    final fatSecretResponseRemote = await repo.getRecipesFromRemote(query);

    if(favoriteResponseRemote.isRight()){
      final meals= toGenericFoods(favoriteResponseRemote.asRight());
      List<GenericFood> list= [];
      for (int i = 0; i < meals.length; i++){
        list.add(
          meals[i].copyWith(isFromFatSecret: false, foodType: FoodType.meal)
        );
      }
      foods.addAll(list);
    }

    if(cookBookResponseRemote.isRight()){
      final meals= toGenericFoods(cookBookResponseRemote.asRight());
      List<GenericFood> list= [];
      for (int i = 0; i < meals.length; i++){
        list.add(
            meals[i].copyWith(isFromFatSecret: false, foodType: FoodType.meal)
        );
      }
      foods.addAll(list);
    }

    if(fatSecretResponseRemote.isRight()){
      final meals= fatSecretResponseRemote.asRight();
      List<GenericFood> list= [];
      for (int i = 0; i < meals.length; i++){
        list.add(
            meals[i].copyWith(isFromFatSecret: true, foodType: FoodType.meal)
        );
      }
      foods.addAll(list);
    }

    if(fatSecretResponseRemote.isRight() || favoriteResponseRemote.isRight() || cookBookResponseRemote.isRight()){
      return Right(foods);
    }
    Failure failure= const FailureResponse(ERROR_TRY_AGAIN);
    if(favoriteResponseRemote.isLeft()){
      failure= favoriteResponseRemote.asLeft();
    }else if(fatSecretResponseRemote.isLeft()){
      failure= fatSecretResponseRemote.asLeft();
    }else{
      failure= cookBookResponseRemote.asLeft();
    }
    return Left(getFailure(failure));
  }


}