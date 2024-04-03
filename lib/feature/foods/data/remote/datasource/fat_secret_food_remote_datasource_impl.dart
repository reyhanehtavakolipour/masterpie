

import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';
import 'package:masterpie/feature/foods/data/remote/model/generic_food_remote_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
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
        'method': 'foods.search.v2',
        'search_expression': query,
        'format': 'json',
        // 'page_number': 0,
        'max_result': 20,
        'include_sub_categories': true,
        'flag_default_serving' : true
      };

      final response= await request.postParams('https://platform.fatsecret.com/rest/server.api', params: params);

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
  Future<Either<Failure, List<GenericFoodRemote>>> getRecipes(String query) {
    // TODO: implement getRecipes
    throw UnimplementedError();
  }


}