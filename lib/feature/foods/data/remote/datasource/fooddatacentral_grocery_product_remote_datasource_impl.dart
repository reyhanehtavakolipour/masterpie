

import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';
import 'fooddatacentral_grocery_product_remote_datasource.dart';


class GroceryProductRemoteDataSourceImpl extends GroceryProductRemoteDataSource{


  @override
  Future<Either<Failure, List<FoodRemote>>> getGroceryProductsFromFoodDataCentral(String query) async{

    final productsRemote = <FoodRemote>[];

    try {

      final clientResponse = await authFatSecret();

      if(clientResponse.isLeft()){
        return const Left(FailureResponse('oauth2 failed'));
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      Map<String, dynamic> params = {
        'method': 'foods.search',
        'search_expression': query,
        'format': 'json',
        'page_number': 0,
        'max_result': 10,
      };

      final response= await request.postParams('https://platform.fatsecret.com/rest/server.api', params: params);

      if(response.statusCode == SUCCESS_API_CODE){

        final data = response.data;
        final foods = data['foods']['food'] as List;

        foods.forEach((element) {





          final product = FoodRemote(
            name: element['food_name']
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

}