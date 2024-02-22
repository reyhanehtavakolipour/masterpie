

import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';
import 'fooddatacentral_grocery_product_remote_datasource.dart';


class GroceryProductRemoteDataSourceImpl extends GroceryProductRemoteDataSource{


  @override
  Future<Either<Failure, List<FoodRemote>>> getGroceryProductsFromFoodDataCentral(String query) async{

    try{
      final NetworkRequest request = await NetworkRequest.createFoodDataCentral();
      final dataCentralKey= await FlutterConfig.get(FOOD_DATA_CENTRAL_KEY);
      final Map<String, dynamic> queryParams = {
        'api_key': dataCentralKey,
        'query': query,
        'pageNumber': 1,
        'pageSize': 3
      };
      final response = await request.getWithQueries(FOOD_DATA_CENTRAL_API, queryParams);
      if(response.statusCode == SUCCESS_API_CODE){
        final foods = response.data['foods'] as List<dynamic>;
        int maxProductsSize = foods.length;
        if(foods.length > 1){
          maxProductsSize = 1;
        }
        final productsRemote = <FoodRemote>[];
        for (int i = 0; i < maxProductsSize; i++){
          String foodId = foods[i]['fdcId'].toString();
          final nutrients = foods[i]['foodNutrients'] as List<dynamic>;

          double calorie= 0;
          double protein= 0;
          double carb= 0;
          double fat= 0;


          final calorieObjects= nutrients.where((element) => element['nutrientName'] == 'Energy').toList();
          if(calorieObjects.isNotEmpty){
            calorie = (calorieObjects[0]['value'])?.toDouble() ?? 0;
          }


          final proteinObjects= nutrients.where((element) => element['nutrientName'].contains('Protein')).toList();
          if(proteinObjects.isNotEmpty){
            protein = (proteinObjects[0]['value'])?.toDouble() ?? 0;
          }


          final carbObjects= nutrients.where((element) => element['nutrientName'].contains('Carbohydrate')).toList();
          if(carbObjects.isNotEmpty){
            carb = (carbObjects[0]['value'])?.toDouble() ?? 0;
          }


          final fatObjects= nutrients.where((element) => element['nutrientName'].contains('Total lipid')).toList();
          if(fatObjects.isNotEmpty){
            fat = (fatObjects[0]['value'])?.toDouble() ?? 0;
          }


          productsRemote.add(
              FoodRemote(
                id: foodId,
                name: (foods[i]['description']?.toLowerCase() ?? '').toString().replaceAll(',', ''),
                brandName: (foods[i]['brandName']?.toLowerCase() ?? '').toString().replaceAll(',', ''),
                servingAmount: DEFAULT_SERVING_SIZE,
                barcode: foods[i]['gtinUpc'] ?? '',
                servingAmounts: [DEFAULT_SERVING_SIZE.toString()],
                ingredients: [],
                units: [DEFAULT_UNIT],
                calorie: [calorie.toString()],
                protein: [protein.toString()],
                carb: [carb.toString()],
                fat: [fat.toString()],
              )
          );
        }
        return Right(productsRemote);
      }
      return  Left(RemoteFailure(response.statusCode, response.data['message']));
    }catch(e){

      return Left(ExceptionFailure(e));
    }
  }

  // @override
  // Future<Either<Failure, List<FoodRemote>>> getGroceryProductsFromOpenFoodFacts(String query) async{
  //
  //   final parameters = <Parameter>[
  //     const PageNumber(page: 1),
  //     const PageSize(size: PAGE_SIZE),
  //     SearchTerms(terms: <String>[query])
  //   ];
  //
  //   final ProductSearchQueryConfiguration configuration =
  //   ProductSearchQueryConfiguration(
  //     parametersList: parameters,
  //     fields: [ProductField.ALL],
  //     language: OpenFoodFactsLanguage.ENGLISH,
  //     version: ProductQueryVersion.v3,
  //     country: CountryHelper.fromJson('CA')
  //   );
  //
  //
  //   const User user = User(
  //     userId: '',
  //     password: '',
  //     comment: '',
  //   );
  //
  //   final SearchResult result = await OpenFoodAPIClient.searchProducts(
  //     user,
  //     configuration,
  //   );
  //
  //   final productsRemote = <FoodRemote>[];
  //   result.products?.forEach((element) {
  //
  //     final calorie = element.nutriments?.getValue(Nutrient.energyKCal, PerSize.oneHundredGrams)?.toInt() ?? 0;
  //
  //     final productRemote = FoodRemote(
  //       genericName: element.genericName.toString().toLowerCase(),
  //       productName: element.productName.toString().toLowerCase(),
  //       brand: element.brands.toString().toLowerCase(),
  //       barcode: element.barcode.toString(),
  //       image: element.imageFrontUrl.toString(),
  //       servingQuantity: DEFAULT_SERVING_SIZE,
  //       foodUnitRemote: FoodUnitRemote.gram,
  //       calorie: calorie
  //     );
  //     productsRemote.add(productRemote);
  //   });
  //
  //   return Right(productsRemote);
  // }

}