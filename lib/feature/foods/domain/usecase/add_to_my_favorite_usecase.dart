

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/helper/request_api.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../model/food_type.dart';
import '../repository/foods_repository.dart';

class AddToMyFavoriteUseCase{

  final repo = serviceLocator<FoodsRepository>();
  final userRepo = serviceLocator<UserRepository>();


  Future<Either<Failure, Food>> addToMyFavorites(Food food) async{
    food = checkFood(food);
    food= food.copyWith(
      id: generateRandomId()
    );

    final idResponse = await userRepo.getUserIdFromHive();

    if(food.foodType == FoodType.meal){

      if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
        await repo.saveMyMealToLocalDb(food);
        return Right(food);
      }

      final addToMyFavoritesRemoteResponse = await repo.saveMyMealToRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
        await repo.saveMyMealToLocalDb(food);
        return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }else{

      if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
        await repo.saveMyGroceryToLocalDb(food);
        return Right(food);
      }

      final addToMyFavoritesRemoteResponse = await repo.saveMyGroceryProductToRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
        await repo.saveMyGroceryToLocalDb(food);
        return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }
  }


  Future<Either<Failure, Food>> updateMyFavoriteFood(Food food) async{
    food = checkFood(food);
    final idResponse = await userRepo.getUserIdFromHive();

    if(food.foodType == FoodType.meal){

      if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
        await repo.updateMyMealInLocalDb(food);
        return Right(food);
      }

      final addToMyFavoritesRemoteResponse = await repo.updateMyFavoriteMealInRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
      await repo.updateMyMealInLocalDb(food);
      return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }else{

      if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
        await repo.updateMyGroceryInLocalDb(food);
        return Right(food);
      }

      final addToMyFavoritesRemoteResponse = await repo.updateMyFavoriteGroceryInRemote(food);
      if(addToMyFavoritesRemoteResponse.isRight()){
      await repo.updateMyGroceryInLocalDb(food);
      return Right(food);
      }
      return Left(getFailure(addToMyFavoritesRemoteResponse.asLeft()));
    }
  }


  Future<Either<Failure, Food>> addOrUpdateMyFavoriteFood(Food food) async{
    final myFavoriteFoodResponse = await repo.isItInMyFavoritesLocalDb(food.id);
    if (myFavoriteFoodResponse.isRight()) {
      if(myFavoriteFoodResponse.asRight()){
        // existed in my favorite food
        return updateMyFavoriteFood(food);
      }else{
        return addToMyFavorites(food);
      }
    }
    return Left(getFailure(myFavoriteFoodResponse.asLeft()));
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

    food = food.copyWith(
      ingredients: ingredients,
      calorie: calorie,
      protein: protein,
      carb: carb,
      fat: fat,
      units: units,
      unit:  food.foodType == FoodType.meal && food.unit.isEmpty ? SERVING_LABEL : food.unit,
    );
    return food;
  }

}