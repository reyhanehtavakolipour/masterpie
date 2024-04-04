

import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';
import 'package:masterpie/feature/foods/data/remote/model/generic_food_remote_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';
import 'fat_secret_food_remote_datasource.dart';


class FatSecretFoodRemoteDataSourceImpl extends FatSecretRemoteDataSource{


  @override
  Future<Either<Failure, List<GenericFoodRemote>>> getGroceries(String query) async{

    final productsRemote = <GenericFoodRemote>[];

    try {

      final clientResponse = await authFatSecret();

      if(clientResponse.isLeft()){
        return const Left(FailureResponse('oauth2 failed'));
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      Map<String, dynamic> params = {
        'method': 'foods.search.v3',
        'search_expression': query,
        'format': 'json',
        // 'page_number': 0,
        'max_result': 50,
        'include_sub_categories': true,
        'flag_default_serving' : true
      };

      final response= await request.postParams(FAT_SECRET_URL, params: params);

      if(response.statusCode == SUCCESS_API_CODE){

        final data = response.data;

        final foods = data['foods_search']['results']['food'];

        foods.forEach((element) {

          List<String> calorie = [];
          List<String> protein = [];
          List<String> carb = [];
          List<String> fat = [];
          List<String> units = [];
          List<String> servingAmounts = [];
          List<String> servingIngredientsCount = [];


          (element['servings']['serving'] as List).forEach((serving) {
            calorie.add(double.parse(serving['calories']).toString());
            protein.add(double.parse(serving['protein']).toString());
            carb.add(double.parse(serving['carbohydrate']).toString());
            fat.add(double.parse(serving['fat']).toString());
            servingAmounts.add(double.parse(serving['number_of_units']).toStringAsFixed(2));
            units.add(serving['measurement_description']);
            servingIngredientsCount.add('1.0');
          });

          final product = GenericFoodRemote(
            id: element['food_id'],
            name: element['food_name'],
            foodType: FoodTypeRemote.groceryProduct,
            calorie: [calorie],
            protein: [protein],
            carb: [carb],
            fat: [fat],
            servingAmounts: [servingAmounts],
            units: [units],
            servingIngredientsCount: [servingIngredientsCount]
          );
          productsRemote.add(product);
        });


        return Right(productsRemote);
      }else{
        return  Left(RemoteFailure(response.statusCode, response.data['message']));
      }

    } catch (e) {
      return Left(ExceptionFailure(e));
    }

  }

  @override
  Future<Either<Failure, List<GenericFoodRemote>>> getRecipes(String query) async{

    final productsRemote = <GenericFoodRemote>[];

    try {

      final clientResponse = await authFatSecret();

      if(clientResponse.isLeft()){
        return const Left(FailureResponse('oauth2 failed'));
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      Map<String, dynamic> params = {
        'search_expression': query,
        'format': 'json',
        'method': 'recipes.search.v3',
        'max_result': 20,
      };

      /// first api to get recipe id
      final response= await request.postParams(FAT_SECRET_URL, params: params);

      if(response.statusCode == SUCCESS_API_CODE){

        final data = response.data;

        final foods = data['recipes']['recipe'];


        await Future.forEach(foods, (element) async {

          final recipe= (element as dynamic);

          Map<String, dynamic> recipeParams = {
            'recipe_id': recipe['recipe_id'],
            'format': 'json',
            'method': 'recipe.get.v2',
          };



          /// second api to get recipe detail
          final recipeDetailResponse= await request.postParams(FAT_SECRET_URL, params: recipeParams);
          if(recipeDetailResponse.statusCode == SUCCESS_API_CODE){


            final servingNumber= double.parse(recipeDetailResponse.data['recipe']['number_of_servings']);


            // ingredients ids
            List<String> ingredients = [];
            List<List<String>> servingIngredientsCount = [];
            (recipeDetailResponse.data['recipe']['ingredients']['ingredient'] as List).forEach((ingredient) {
              ingredients.add(ingredient['food_id']);
              servingIngredientsCount.add([ingredient['number_of_units']]);
            });


            String recipeInstruction = '';
            final recipeDirection= recipeDetailResponse.data['recipe']['directions']['direction'] as List;
            for (int i = 0; i < recipeDirection.length; i++){
              recipeInstruction= '${i+1}- ${recipeDirection[i]['direction_description']}\n';
            }


            (recipeDetailResponse.data['recipe']['ingredients']['ingredient'] as List).forEach((ingredient) {
              ingredients.add(ingredient['food_id']);
            });

          final product = GenericFoodRemote(
                id: element['recipe_id'],
                name: element['recipe_name'],
                foodType: FoodTypeRemote.groceryProduct,
                calorie: [[(double.parse(recipe['recipe_nutrition']['calories'].toString()) * servingNumber).toString()]],
                protein: [['0.0']],
                carb: [['0.0']],
                fat: [['0.0']],
                recipe: recipeInstruction,
                ingredients: ingredients,
                servingIngredientsCount: servingIngredientsCount,
                servingAmount: [servingNumber],
                unit: ['serving']
            );
            productsRemote.add(product);


          }
        });

        return Right(productsRemote);
      }else{
        return  Left(RemoteFailure(response.statusCode, response.data['message']));
      }

    } catch (e) {
      return Left(ExceptionFailure(e));
    }

  }

  @override
  Future<Either<Failure, GenericFoodRemote>> getGrocery(String groceryId) async{

    try {

      final clientResponse = await authFatSecret();

      if(clientResponse.isLeft()){
        return const Left(FailureResponse('oauth2 failed'));
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      Map<String, dynamic> params = {
        'method': 'food.get.v4',
        'food_id': groceryId,
        'format': 'json',
      };

      final response= await request.postParams(FAT_SECRET_URL, params: params);

      if(response.statusCode == SUCCESS_API_CODE){

        final data = response.data;

        final serving= data['food']['servings']['serving'] as List;

        final grocery= GenericFoodRemote(
          foodType: FoodTypeRemote.groceryProduct,
          id: groceryId,
          name: data['food']['food_name'],
          servingAmounts: [[serving[0]['number_of_units']]],
          units: [[serving[0]['measurement_description']]],
          calorie: [[serving[0]['calories']]],
          protein: [[serving[0]['protein']]],
          carb: [[serving[0]['carbohydrate']]],
          fat: [[serving[0]['fat']]],
        );

        print('gfdgss: $grocery');
        return Right(grocery);
      }else{
        return  Left(RemoteFailure(response.statusCode, response.data['message']));
      }

    } catch (e) {
      print('gfdgss1: $e');
      return Left(ExceptionFailure(e));
    }

  }

  @override
  Future<Either<Failure, String>> getGroceryId(String barcode) {
    // TODO: implement getGroceryId
    throw UnimplementedError();
  }


}