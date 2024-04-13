


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';

import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_type.dart';
import '../repository/foods_repository.dart';



class GroceriesUseCase{

  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, List<GenericFood>>> getGroceries(String query) async{
    List<GenericFood> foods= [];
    final favoriteResponseRemote = await repo.getMyGroceryProductsFromLocalDb(query);
    final fatSecretResponseRemote = await repo.getGroceryProductsFromRemote(query);

    if(favoriteResponseRemote.isRight()){
      final groceries= toGenericFoods(favoriteResponseRemote.asRight());
      List<GenericFood> list= [];
      for (int i = 0; i < groceries.length; i++){
        list.add(
            groceries[i].copyWith(foodType: FoodType.groceryProduct)
        );
      }
      foods.addAll(list);
    }

    if(fatSecretResponseRemote.isRight()){
      foods.addAll(fatSecretResponseRemote.asRight());
    }

    if(fatSecretResponseRemote.isRight() || favoriteResponseRemote.isRight()){
      return Right(foods);
    }
    Failure failure= const FailureResponse(ERROR_TRY_AGAIN);
    if(favoriteResponseRemote.isLeft()){
      failure= favoriteResponseRemote.asLeft();
    }else{
      failure= fatSecretResponseRemote.asLeft();
    }
    return Left(getFailure(failure));
  }

  Future<Either<Failure, List<GenericFood>>> getGroceryWithBarcode(String barcodeId) async{
    final fatSecretResponseRemote = await repo.getGroceryWithBarcodeFromRemote(barcodeId);

    if(fatSecretResponseRemote.isRight()){
      return Right([fatSecretResponseRemote.asRight()]);
    }

    return Left(getFailure(fatSecretResponseRemote.asLeft()));
  }


}