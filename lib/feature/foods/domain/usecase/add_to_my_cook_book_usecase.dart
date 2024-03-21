

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/helper/request_api.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/food_type.dart';
import '../repository/foods_repository.dart';

class AddToMyCookBookUseCase{

  final repo = serviceLocator<FoodsRepository>();

  Future<Either<Failure, Food>> addToMyCookBook(Food food) async{
    food = checkFood(food);
    food= food.copyWith(
      id: generateRandomId()
    );
      final addToMyCookBookRemoteResponse = await repo.saveMealToMyCookBookRemote(food);
      if(addToMyCookBookRemoteResponse.isRight()){
        await repo.saveMyMealToLocalDb(food);
        return Right(food);
      }
      return Left(getFailure(addToMyCookBookRemoteResponse.asLeft()));
  }


  Future<Either<Failure, Food>> updateMyCookBookFood(Food food) async{
    food = checkFood(food);
    final updateCookBookRemoteResponse = await repo.updateMyCookBookMealInRemote(food);
    if(updateCookBookRemoteResponse.isRight()){
    await repo.updateMyMealInLocalDb(food);
    return Right(food);
    }
    return Left(getFailure(updateCookBookRemoteResponse.asLeft()));
  }


  Future<Either<Failure, Food>> addOrUpdateMyCookBookFood(Food food) async{
    final myCookBookFoodResponse = await repo.isItInMyCookBookInLocalDb(food.id);
    if (myCookBookFoodResponse.isRight()) {
      if(myCookBookFoodResponse.asRight()){
        return updateMyCookBookFood(food);
      }else{
        return addToMyCookBook(food);
      }
    }
    return Left(getFailure(myCookBookFoodResponse.asLeft()));
  }



  Food checkFood(Food food){

    List<String> ingredients= [];
    food.ingredients.forEach((element) {
      if(element.isEmpty){
        ingredients.add('-');
      }else{
        ingredients.add(element.replaceAll(',', ''));
      }
    });


    List<String> calorie= [];
    food.calorie.forEach((element) {
      if(element.isEmpty){
        calorie.add('0.0');
      }else{
        calorie.add(double.parse(element).toString());
      }
    });



    List<String> protein= [];
    food.protein.forEach((element) {
      if(element.isEmpty){
        protein.add('0.0');
      }else{
        protein.add(double.parse(element).toString());
      }
    });

    List<String> carb= [];
    food.carb.forEach((element) {
      if(element.isEmpty){
        carb.add('0.0');
      }else{
        carb.add(double.parse(element).toString());
      }
    });

    List<String> fat= [];
    food.fat.forEach((element) {
      if(element.isEmpty){
        fat.add('0.0');
      }else{
        fat.add(double.parse(element).toString());
      }
    });


    List<String> units= [];
    food.units.forEach((element) {
      if(element.isEmpty){
        units.add('g');
      }else{
        units.add(element.replaceAll(',', ''));
      }
    });

    List<String> servingAmounts= [];
    food.servingAmounts.forEach((element) {
      if(element.isEmpty){
        servingAmounts.add('100.0');
      }else{
        servingAmounts.add(double.parse(element).toString());
      }
    });

    food = food.copyWith(
      ingredients: ingredients,
      calorie: calorie,
      protein: protein,
      carb: carb,
      fat: fat,
      units: units,
      servingAmounts: servingAmounts,
      unit:  food.foodType == FoodType.meal && food.unit.isEmpty ? SERVING_LABEL : food.unit,
    );
    return food;
  }

}