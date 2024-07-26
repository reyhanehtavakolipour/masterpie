


import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:masterpie/feature/foods/data/remote/model/fat_secret_foods_info_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';
import 'package:masterpie/feature/foods/data/remote/model/generic_food_remote_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import 'package:masterpie/feature/user/data/remote/model/profile_remote.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/helper/print.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/helper/helper.dart';
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
        'include_food_images': true,
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
          List<String> servingIngredientsCount = [];


          (element['servings']['serving'] as List).forEach((serving) {
            calorie.add(double.parse(serving['calories']).toString());
            protein.add(double.parse(serving['protein']).toString());
            carb.add(double.parse(serving['carbohydrate']).toString());
            fat.add(double.parse(serving['fat']).toString());
            units.add(serving['serving_description']);
            servingIngredientsCount.add('1.0');
          });

          String brandName= '';
          if(element['food_type'] == 'Brand'){
            brandName= element['brand_name'];
          }


          String image= '';

          if (element.containsKey('food_images')) {
            final images= element['food_images']['food_image'] as List;
            if(images.length >= 3){
              image= images[2]['image_url'];
            }
          }



          final product = GenericFoodRemote(
            id: element['food_id'],
            name: element['food_name'],
            foodType: FoodTypeRemote.groceryProduct,
            brandName: brandName,
            image: image,
            calorie: [calorie],
            protein: [protein],
            carb: [carb],
            fat: [fat],
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

          String image= '';

          if (element.containsKey('recipe_image')) {
            image= element['recipe_image'];
          }

          final product = GenericFoodRemote(
                id: element['recipe_id'],
                name: element['recipe_name'],
                foodType: FoodTypeRemote.groceryProduct,
                image: image,
                calorie: [[(double.parse(recipe['recipe_nutrition']['calories'].toString())).toString()]],
                protein: [['0.0']],
                carb: [['0.0']],
                fat: [['0.0']],
                unit: ['serving'],
                units: [['serving']],
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
      String calorie = '';
      String protein = '';
      String carb = '';
      String fat = '';
      String recipeInstruction = '';
      double numberOfServing= 1.0;


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


       numberOfServing= double.parse(recipeDetailResponse.data['recipe']['number_of_servings']);


        final recipeIngredients= recipeDetailResponse.data['recipe']['ingredients']['ingredient'] as List;
        for (int i = 0; i < recipeIngredients.length; i++){
          ingredients.add(recipeIngredients[i]['ingredient_description'].toString());
        }

        calorie= recipeDetailResponse.data['recipe']['serving_sizes']['serving']['calories'];
        protein= recipeDetailResponse.data['recipe']['serving_sizes']['serving']['protein'];
        carb= recipeDetailResponse.data['recipe']['serving_sizes']['serving']['carbohydrate'];
        fat= recipeDetailResponse.data['recipe']['serving_sizes']['serving']['fat'];



      }else{
        return  Left(RemoteFailure(recipeDetailResponse.statusCode, recipeDetailResponse.data['message']));
      }


      return Right(
          GenericFoodRemote(
              id: recipeId,
              name: recipeDetailResponse.data['recipe']['recipe_name'],
              foodType: FoodTypeRemote.meal,
              calorie: [[calorie]],
              protein: [[protein]],
              carb: [[carb]],
              fat: [[fat]],
              recipe: recipeInstruction,
              ingredients: ingredients,
              servingAmount: [numberOfServing],
              unit: ['serving'],
            createdFromFatSecretRecipes: 1
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
          'flag_default_serving' : true,
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
          List<String> ingredientUnits= [];


          serving.forEach((element) {
            ingredientCalorie.add(element['calories'].toString());
            ingredientProtein.add(element['protein'].toString());
            ingredientCarb.add(element['carbohydrate'].toString());
            ingredientFat.add(element['fat'].toString());
            ingredientUnits.add(element['serving_description'].toString());
          });

          return Right(GenericFoodRemote(
            id: data['food']['food_id'],
            name: data['food']['food_name'],
            calorie: [ingredientCalorie],
            protein: [ingredientProtein],
            carb: [ingredientCarb],
            fat: [ingredientFat],
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

  @override
  Future<Either<Failure, FatSecretFoodsInfoRemote>> getFatSecretFoodsInfo() async{

    try {

      final clientResponse = await authFatSecret();

      if(clientResponse.isLeft()){
        return const Left(FailureResponse('oauth2 failed'));
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      Map<String, dynamic> recipeTypesParams = {
        'format': 'json',
        'method': 'recipe_types.get.v2',
      };

      /// recipe types api
      final recipeTypesResponse= await request.postParams(FAT_SECRET_URL, params: recipeTypesParams);

      if(recipeTypesResponse.statusCode == SUCCESS_API_CODE){

        final recipeTypesData = recipeTypesResponse.data;

        List<String> recipeTypes= [];

        (recipeTypesData['recipe_types']['recipe_type'] as List).forEach((element) {
          recipeTypes.add(element.toString().replaceAll(',', ''));
        });


        /// foods category
        Map<String, dynamic> categoriesParams = {
          'format': 'json',
          'method': 'food_categories.get.v2',
        };

        final categoriesResponse= await request.postParams(FAT_SECRET_URL, params: categoriesParams);

        if(categoriesResponse.statusCode == SUCCESS_API_CODE){
          final categoriesData = categoriesResponse.data;

          List<String> categories= [];

          (categoriesData['food_categories']['food_category'] as List).forEach((element) {
            categories.add(element['food_category_name'].toString().replaceAll(',', ''));
          });


          /// allergens
          List<String> allergens= [];
          allergens.add('Milk');
          allergens.add('Lactose');
          allergens.add('Egg');
          allergens.add('Fish');
          allergens.add('Gluten');
          allergens.add('Nuts');
          allergens.add('Peanuts');
          allergens.add('Shellfish');
          allergens.add('Soy');
          allergens.add('Sesame');

          return Right(
              FatSecretFoodsInfoRemote(
                recipeTypes: sortAlphabetically(recipeTypes),
                categories: sortAlphabetically(categories),
                allergens: sortAlphabetically(allergens)
              )
          );

        }
        return  Left(RemoteFailure(categoriesResponse.statusCode, categoriesResponse.data['message']));

      }else{
        return  Left(RemoteFailure(recipeTypesResponse.statusCode, recipeTypesResponse.data['message']));
      }

    } catch (e) {
      return Left(ExceptionFailure(e));
    }

  }


  @override
  Future<Either<Failure, List<String>>> getSubcategories(List<String> categories) async {
    try {
      List<String> subCategories = [];

      final clientResponse = await authFatSecret();

      if (clientResponse.isLeft()) {
        print('Client authentication failed');
        return const Right([]);
      }

      String token = clientResponse.asRight().credentials.accessToken;
      print('Successfully authenticated!: $token');

      final NetworkRequest request = await NetworkRequest.createFatSecret(token);

      Map<String, dynamic> categoriesParams = {
        'format': 'json',
        'method': 'food_categories.get.v2',
      };

      final categoriesResponse = await request.postParams(FAT_SECRET_URL, params: categoriesParams);

      if (categoriesResponse.statusCode == SUCCESS_API_CODE) {
        final categoriesData = categoriesResponse.data;

        for (var item in categories) {
          for (var element in (categoriesData['food_categories']['food_category'] as List)) {
            if (element['food_category_name'].toString().replaceAll(',', '') == item) {
              final catId = element['food_category_id'].toString();

              // request sub categories
              Map<String, dynamic> subCategoriesParams = {
                'format': 'json',
                'method': 'food_sub_categories.get.v2',
                'food_category_id': catId
              };

              final subCategoriesResponse = await request.postParams(FAT_SECRET_URL, params: subCategoriesParams);

              if (subCategoriesResponse.statusCode == SUCCESS_API_CODE) {
                final subCategoriesData = subCategoriesResponse.data;
                final subCats = subCategoriesData['food_sub_categories']['food_sub_category'];
                subCategories.addAll(subCats.map<String>((sc) => sc.toString()).toList());
              }
            }
          }
        }
      }
      return Right(subCategories);
    } catch (e) {
      return Left(ExceptionFailure(e));
    }
  }






  @override
  Future<Either<Failure, List<FoodRemote>>> autoGenerateFoods(ProfileRemote profileRemote, List<String> mainDishType, List<String> sideDishTypes) async{
    try{
      printWrapped('show_user_pref: ${profileRemote}');

      final NetworkRequest request = await NetworkRequest.create();

      List<String> types= [];
      types.addAll(mainDishType);
      types.addAll(sideDishTypes);

      List<FoodRemote> foods= [];

      await Future.forEach(types, (type) async{

        Map<String, dynamic> autoGenerateFoodParams = {
          'favoriteCategories': [''],
          'hateCategories': [''],
          'favoriteSubCategories': profileRemote.favoriteSubCategories,
          'hateSubCategories': profileRemote.hateSubCategories,
          'DishTypes': type == 'Dinner' ? 'Lunch' : type,
          'isMainDish': false,
          'allergens': profileRemote.allergens,
          'numMainDish' : mainDishType.length,
          'numSideDish': sideDishTypes.length,
          'macroGoal': profileRemote.dailyMacroGoal
        };

        printWrapped('show_user_pref2: ${autoGenerateFoodParams}');

        final macroGoalApi= await FlutterConfig.get(AUTO_GENERATE_FOOD_URL);

        final recipeResponse= await request.post(macroGoalApi, data: autoGenerateFoodParams);

        if(recipeResponse.statusCode == SUCCESS_API_CODE){
          Map<String, dynamic> data= recipeResponse.data;
          String recipeId= data['recipe_id'];
          print('show_result: ${data}');
          final recipeDetailResponse= await getRecipe(recipeId);
          if(recipeDetailResponse.isRight()){
            print('show_result11: ${recipeDetailResponse.asRight()}');
            final generatedFood= fromGenericRecipeRemote(recipeDetailResponse.asRight());
            printWrapped('show_result22: ${generatedFood}');
            foods.add(generatedFood);
          }else{
            print('show_error33: ${recipeDetailResponse.asLeft().message}');
            foods.add(FoodRemote());
          }
        }else{
          print('show_error44: ${recipeResponse.statusMessage}');
          foods.add(FoodRemote());
        }
      });
      printWrapped('all_foods: $foods');
      return Right(foods);

    }catch(error){
      print('show_error55: ${error}');
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, FoodRemote>> autoGenerateFood(ProfileRemote profileRemote, String type) async{
    try{
      // printWrapped('show_user_pref: ${profileRemote}');

      final NetworkRequest request = await NetworkRequest.create();

      Map<String, dynamic> autoGenerateFoodParams = {
        'favoriteCategories': [''],
        'hateCategories': [''],
        'favoriteSubCategories': profileRemote.favoriteSubCategories,
        'hateSubCategories': profileRemote.hateSubCategories,
        'DishTypes': type == 'Dinner' ? 'Lunch' : type,
        'isMainDish': false,
        'allergens': profileRemote.allergens,
        'numMainDish' : profileRemote.mainDishTypes.length,
        'numSideDish': profileRemote.sideDishTypes.length,
        'macroGoal': profileRemote.dailyMacroGoal
      };

      printWrapped('show_user_pref2: ${autoGenerateFoodParams}');


      final macroGoalApi= await FlutterConfig.get(AUTO_GENERATE_FOOD_URL);


      final recipeResponse= await request.post(macroGoalApi, data: autoGenerateFoodParams);


      if(recipeResponse.statusCode == SUCCESS_API_CODE){

        Map<String, dynamic> data= recipeResponse.data;


        String recipeId= data['recipe_id'];
        print('show_result: ${data}');

        final recipeDetailResponse= await getRecipe(recipeId);
        if(recipeDetailResponse.isRight()){

          print('show_result22: ${recipeDetailResponse.asRight()}');


          final generatedFood= fromGenericRecipeRemote(recipeDetailResponse.asRight());

          printWrapped('show_result33: ${generatedFood}');

          return Right(generatedFood);

        }
        print('show_error0: ${recipeResponse.statusMessage}');
        return Left(RemoteFailure(recipeResponse.statusCode, recipeResponse.statusMessage ?? ''));
      }else{
        print('show_error1: ${recipeResponse.statusMessage}');
        return Left(RemoteFailure(recipeResponse.statusCode, recipeResponse.statusMessage ?? ''));
      }
    }catch(error){
      print('show_error2: ${error}');
      return Left(ExceptionFailure(error));
    }
  }



}