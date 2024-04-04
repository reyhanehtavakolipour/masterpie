


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/food_type.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/response/failure.dart';
import '../repository/foods_repository.dart';



class GetRecipeUseCase{

  final repo = serviceLocator<FoodsRepository>();


  Future<Either<Failure, GenericFood>> getRecipe(GenericFood genericFood) async{


    List<String> ingredients= [];
    List<List<String>> calorie= [];
    List<List<String>> protein= [];
    List<List<String>> carb= [];
    List<List<String>> fat= [];
    List<List<String>> servingAmounts= [];
    List<List<String>> units= [];


    await Future.forEach(genericFood.ingredients, (ingredientId) async {
      final ingredientResponse = await repo.getGroceryFromRemote(ingredientId);
      if(ingredientResponse.isRight()){
        ingredients.add(ingredientResponse.asRight().name);
        calorie.add([ingredientResponse.asRight().calorie[0][0]]);
        protein.add([ingredientResponse.asRight().protein[0][0]]);
        carb.add([ingredientResponse.asRight().carb[0][0]]);
        fat.add([ingredientResponse.asRight().fat[0][0]]);
        servingAmounts.add([ingredientResponse.asRight().servingAmounts[0][0]]);
        units.add([ingredientResponse.asRight().units[0][0]]);
      }
    });


    genericFood = genericFood.copyWith(
      foodType: FoodType.meal,
      ingredients: ingredients,
      calorie: calorie,
      protein: protein,
      carb: carb,
      fat: fat,
      servingAmounts: servingAmounts,
      units: units
    );

    print('sdfsds: ${genericFood}');

    return Right(genericFood);
  }


}