

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



    // try{
    //   final NetworkRequest request = await NetworkRequest.createFoodDataCentral();
    //   final dataCentralKey= await FlutterConfig.get(FOOD_DATA_CENTRAL_KEY);
    //   final Map<String, dynamic> queryParams = {
    //     'api_key': dataCentralKey,
    //     'query': query,
    //     'pageNumber': 1,
    //     'pageSize': 3
    //   };
    //   final response = await request.getWithQueries(FOOD_DATA_CENTRAL_API, queryParams);
    //   if(response.statusCode == SUCCESS_API_CODE){
    //     final foods = response.data['foods'] as List<dynamic>;
    //     int maxProductsSize = foods.length;
    //     if(foods.length > 1){
    //       maxProductsSize = 1;
    //     }
    //     final productsRemote = <FoodRemote>[];
    //     for (int i = 0; i < maxProductsSize; i++){
    //       String foodId = foods[i]['fdcId'].toString();
    //       final nutrients = foods[i]['foodNutrients'] as List<dynamic>;
    //
    //       double calorie= 0;
    //       double protein= 0;
    //       double carb= 0;
    //       double fat= 0;
    //
    //
    //       final calorieObjects= nutrients.where((element) => element['nutrientName'] == 'Energy').toList();
    //       if(calorieObjects.isNotEmpty){
    //         calorie = (calorieObjects[0]['value'])?.toDouble() ?? 0;
    //       }
    //
    //
    //       final proteinObjects= nutrients.where((element) => element['nutrientName'].contains('Protein')).toList();
    //       if(proteinObjects.isNotEmpty){
    //         protein = (proteinObjects[0]['value'])?.toDouble() ?? 0;
    //       }
    //
    //
    //       final carbObjects= nutrients.where((element) => element['nutrientName'].contains('Carbohydrate')).toList();
    //       if(carbObjects.isNotEmpty){
    //         carb = (carbObjects[0]['value'])?.toDouble() ?? 0;
    //       }
    //
    //
    //       final fatObjects= nutrients.where((element) => element['nutrientName'].contains('Total lipid')).toList();
    //       if(fatObjects.isNotEmpty){
    //         fat = (fatObjects[0]['value'])?.toDouble() ?? 0;
    //       }
    //
    //
    //       productsRemote.add(
    //           FoodRemote(
    //             id: foodId,
    //             name: (foods[i]['description']?.toLowerCase() ?? '').toString().replaceAll(',', ''),
    //             brandName: (foods[i]['brandName']?.toLowerCase() ?? '').toString().replaceAll(',', ''),
    //             servingAmount: DEFAULT_SERVING_SIZE,
    //             barcode: foods[i]['gtinUpc'] ?? '',
    //             servingAmounts: [DEFAULT_SERVING_SIZE.toString()],
    //             ingredients: [],
    //             units: [DEFAULT_UNIT],
    //             calorie: [calorie.toString()],
    //             protein: [protein.toString()],
    //             carb: [carb.toString()],
    //             fat: [fat.toString()],
    //           )
    //       );
    //     }
    //     return Right(productsRemote);
    //   }
    //   return  Left(RemoteFailure(response.statusCode, response.data['message']));
    // }catch(e){
    //
    //   return Left(ExceptionFailure(e));
    // }
  }

}