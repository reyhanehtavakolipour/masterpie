


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';
import 'package:masterpie/feature/foods/data/remote/model/generic_food_remote_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/helper/print.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/helper/helper.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/response/failure.dart';
import 'fat_secret_food_remote_datasource.dart';


const fat_secret= 'fatsecret';

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
            servingAmounts.add(fat_secret);
            units.add(serving['serving_description']);
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


          final product = GenericFoodRemote(
                id: element['recipe_id'],
                name: element['recipe_name'],
                foodType: FoodTypeRemote.groceryProduct,
                calorie: [[(double.parse(recipe['recipe_nutrition']['calories'].toString())).toString()]],
                protein: [['0.0']],
                carb: [['0.0']],
                fat: [['0.0']],
                unit: ['serving'],
                units: [['serving']],
            servingAmounts: [['1.0']],
            servingIngredientsCount: [['1.0']]
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
  Future<Either<Failure, GenericFoodRemote>> getRecipe(String recipeId) async{

    try {

      final clientResponse = await authFatSecret();

      if(clientResponse.isLeft()){
        return const Left(FailureResponse('oauth2 failed'));
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      List<String> ingredients = [];
      List<List<String>> servingIngredientsCount = [];
      List<List<String>> calorie = [];
      List<List<String>> protein = [];
      List<List<String>> carb = [];
      List<List<String>> fat = [];
      List<List<String>> servingAmounts = [];
      List<List<String>> units = [];
      String recipeInstruction = '';


      /// first api to get recipe detail


      Map<String, dynamic> recipeParams = {
        'recipe_id': recipeId,
        'format': 'json',
        'method': 'recipe.get.v2',
      };

      final recipeDetailResponse= await request.postParams(FAT_SECRET_URL, params: recipeParams);
      if(recipeDetailResponse.statusCode == SUCCESS_API_CODE){

        final recipeDirection= recipeDetailResponse.data['recipe']['directions']['direction'] as List;
        for (int i = 0; i < recipeDirection.length; i++){
          recipeInstruction= '$recipeInstruction ${i+1}- ${recipeDirection[i]['direction_description']}\n';
        }


        final numberOfServing= double.parse(recipeDetailResponse.data['recipe']['number_of_servings']);

        await Future.forEach((recipeDetailResponse.data['recipe']['ingredients']['ingredient'] as List), (ingredient) async {
          ingredients.add(ingredient['food_name']);
          final ingredientNumberOfUnit= double.parse(ingredient['number_of_units']);
          final servingId= double.parse(ingredient['serving_id']);

          /// calling second api to get ingredient detail

          Map<String, dynamic> params = {
            'method': 'food.get.v4',
            'food_id': ingredient['food_id'],
            'format': 'json',
          };

          final response= await request.postParams(FAT_SECRET_URL, params: params);

          if(response.statusCode == SUCCESS_API_CODE){

            final data = response.data;

            final serving= data['food']['servings']['serving'] as List;


            List<String> ingredientCalorie= [];
            List<String> ingredientProtein= [];
            List<String> ingredientCarb= [];
            List<String> ingredientFat= [];
            List<String> ingredientServingAmounts= [];
            List<String> ingredientUnits= [];

            /// add the serving unit used in recipe, first
            final ingServingData= serving.where((element) => double.parse(element['serving_id'].toString()) == servingId).toList();

            if(ingServingData.isEmpty){

              final ingUnit = ingredient['measurement_description'];
              double  ingCount = double.parse(ingredient['number_of_units'].toString());
             final element= serving[0];
              if(element['measurement_description'] != 'serving'){
                // final count= roundToQuarter(double.parse(((ingCount * getIngredientAmountInGrams(ingUnit))/double.parse(element['metric_serving_amount'])).toStringAsFixed(2))/1);
                final count= roundToQuarter(double.parse(((ingCount * getIngredientAmountInGrams(ingUnit))/double.parse(element['metric_serving_amount'])).toStringAsFixed(2))/numberOfServing);
                servingIngredientsCount.add([count.toString()]);
                ingredientCalorie.add((double.parse(element['calories'].toString())).toStringAsFixed(1));
                ingredientProtein.add((double.parse(element['protein'].toString())).toStringAsFixed(1));
                ingredientCarb.add((double.parse(element['carbohydrate'].toString())).toStringAsFixed(1));
                ingredientFat.add((double.parse(element['fat'].toString())).toStringAsFixed(1));
                ingredientServingAmounts.add('1.0');
                ingredientUnits.add(element['measurement_description'].toString());
              }else{
                // double servingIngredientCount = roundToQuarter(double.parse((ingredientNumberOfUnit/1).toStringAsFixed(2)));
                double servingIngredientCount = roundToQuarter(double.parse((ingredientNumberOfUnit/numberOfServing).toStringAsFixed(2)));
                servingIngredientsCount.add([servingIngredientCount.toString()]);
              }


            }else{
              final count= double.parse(ingServingData[0]['number_of_units'].toString());
              ingredientCalorie.add((double.parse(ingServingData[0]['calories'].toString())/count).toStringAsFixed(1));
              ingredientProtein.add((double.parse(ingServingData[0]['protein'].toString())/count).toStringAsFixed(1));
              ingredientCarb.add((double.parse(ingServingData[0]['carbohydrate'].toString())/count).toStringAsFixed(1));
              ingredientFat.add((double.parse(ingServingData[0]['fat'].toString())/count).toStringAsFixed(1));
              ingredientServingAmounts.add('1.0');

              if(ingServingData[0]['measurement_description'] == 'serving'){
                ingredientUnits.add(ingServingData[0]['serving_description'].toString());
              }else{
                ingredientUnits.add(ingServingData[0]['measurement_description'].toString());
              }

              // double servingIngredientCount = roundToQuarter(double.parse((ingredientNumberOfUnit/1).toStringAsFixed(2)));
              double servingIngredientCount = roundToQuarter(double.parse((ingredientNumberOfUnit/numberOfServing).toStringAsFixed(2)));
              servingIngredientsCount.add([servingIngredientCount.toString()]);
            }


            serving.forEach((element) {
              if(element['serving_id'] != servingId && !ingredientUnits.contains(element['measurement_description']) &&
                  !ingredientUnits.contains(element['serving_description'])){
                final count= double.parse(element['number_of_units'].toString());
                ingredientCalorie.add((double.parse(element['calories'].toString())/count).toStringAsFixed(1));
                ingredientProtein.add((double.parse(element['protein'].toString())/count).toStringAsFixed(1));
                ingredientCarb.add((double.parse(element['carbohydrate'].toString())/count).toStringAsFixed(1));
                ingredientFat.add((double.parse(element['fat'].toString())/count).toStringAsFixed(1));
                ingredientServingAmounts.add('1.0');

                if(element['measurement_description'] == 'serving'){
                  ingredientUnits.add(element['serving_description'].toString());
                }else{
                  ingredientUnits.add(element['measurement_description'].toString());
                }
              }
            });

            calorie.add(ingredientCalorie);
            protein.add(ingredientProtein);
            carb.add(ingredientCarb);
            fat.add(ingredientFat);
            servingAmounts.add(ingredientServingAmounts);
            units.add(ingredientUnits);



          }else{
            return Left(RemoteFailure(response.statusCode, response.data['message']));
          }
        });
      }else{
        return  Left(RemoteFailure(recipeDetailResponse.statusCode, recipeDetailResponse.data['message']));
      }


      return Right(
          GenericFoodRemote(
              id: recipeId,
              name: recipeDetailResponse.data['recipe']['recipe_name'],
              foodType: FoodTypeRemote.meal,
              calorie: calorie,
              protein: protein,
              carb: carb,
              fat: fat,
              recipe: recipeInstruction,
              ingredients: ingredients,
              servingIngredientsCount: servingIngredientsCount,
              // servingAmount: [double.parse(recipeDetailResponse.data['recipe']['number_of_servings'])],
              servingAmount: [1],
              servingAmounts: servingAmounts,
              unit: ['serving'],
              units: units
          ));


    } catch (e) {
      return Left(ExceptionFailure(e));
    }

  }


  @override
  Future<Either<Failure, GenericFoodRemote>> getGroceryWithBarcode(String barcode) async{
    try {
      final clientResponse = await authFatSecret();

      if(clientResponse.isLeft()){
        return const Left(FailureResponse('oauth2 failed'));
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      Map<String, dynamic> params = {
        'method': 'food.find_id_for_barcode',
        'barcode': barcode,
        'format': 'json',
      };

      final response= await request.postParams(FAT_SECRET_URL, params: params);

      if(response.statusCode == SUCCESS_API_CODE){

        final data = response.data;

        final groceryId = data['food_id']['value'];

        if(groceryId.toString() == '0'){
          return const Left(FailureResponse('food not found'));
        }

        Map<String, dynamic> params = {
          'method': 'food.get.v4',
          'food_id': groceryId,
          'format': 'json',
        };

        final detailResponse= await request.postParams(FAT_SECRET_URL, params: params);

        if(detailResponse.statusCode == SUCCESS_API_CODE){
          final data = detailResponse.data;

          final serving= data['food']['servings']['serving'] as List;

          List<String> ingredientCalorie= [];
          List<String> ingredientProtein= [];
          List<String> ingredientCarb= [];
          List<String> ingredientFat= [];
          List<String> ingredientServingAmounts= [];
          List<String> ingredientUnits= [];


          serving.forEach((element) {
            ingredientCalorie.add(element['calories'].toString());
            ingredientProtein.add(element['protein'].toString());
            ingredientCarb.add(element['carbohydrate'].toString());
            ingredientFat.add(element['fat'].toString());
            ingredientServingAmounts.add(fat_secret);
            ingredientUnits.add(element['serving_description'].toString());
          });

          return Right(GenericFoodRemote(
            id: data['food']['food_id'],
            name: data['food']['food_name'],
            calorie: [ingredientCalorie],
            protein: [ingredientProtein],
            carb: [ingredientCarb],
            fat: [ingredientFat],
            servingAmounts: [ingredientServingAmounts],
            units: [ingredientUnits]
          ));

        }else{
          return Left(RemoteFailure(detailResponse.statusCode, detailResponse.data['message']));
        }
      }else{
        return  Left(RemoteFailure(response.statusCode, response.data['message']));
      }

    } catch (e) {
      return Left(ExceptionFailure(e));
    }

  }


}