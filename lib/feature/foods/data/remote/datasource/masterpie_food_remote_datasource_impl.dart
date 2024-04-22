

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_json_converter.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/food_portion_recommendation_remote.dart';
import '../model/food_remote_model.dart';
import '../model/food_type_remote.dart';
import '../model/suggested_food_remote_model.dart';
import '../model/suggested_foods_portion_remote_model.dart';
import 'masterpie_food_remote_datasource.dart';

class MasterPieFoodRemoteDataSourceImpl extends MasterPieFoodRemoteDataSource{


  @override
  Future<Either<Failure, Success>> saveToMyFavoriteMeals(FoodRemote mealRemote, String userId) async{
    try {
      final favoriteListResponse = await getMyFavoriteFoods('', userId);
      if(favoriteListResponse.isRight()){
        final list = favoriteListResponse.asRight();

        List<String> newFoodId = [];
        List<String> newCalorie = [];
        List<String> newProtein = [];
        List<String> newCarb = [];
        List<String> newFat = [];
        List<String> newServingAmounts = [];
        List<String> newServingUnits = [];
        List<String> newServingAmount = [];
        List<String> newServingUnit = [];
        List<String> newRecipe = [];
        List<String> newIngredients = [];
        List<String> newTypes = [];
        List<String> newName = [];
        List<String> newServingIngredientsCount = [];


        list.forEach((favoriteFood) {
          newFoodId.add(favoriteFood.id.toString());
          newCalorie.add(favoriteFood.calorie.toString());
          newProtein.add(favoriteFood.protein.toString());
          newCarb.add(favoriteFood.carb.toString());
          newFat.add(favoriteFood.fat.toString());
          newServingAmounts.add(favoriteFood.servingAmounts.toString());
          newServingUnits.add(favoriteFood.units.toString());
          newName.add(favoriteFood.name.toString());
          newTypes.add(favoriteFood.foodTypeRemote.name.toString());
          newServingAmount.add(favoriteFood.servingAmount.toString());
          newServingUnit.add(favoriteFood.unit.toString());
          newRecipe.add(favoriteFood.recipe.toString());
          newIngredients.add(favoriteFood.ingredients.toString());
          newServingIngredientsCount.add(favoriteFood.servingIngredientsCount.toString());
        });
        newFoodId.add(mealRemote.id);
        newCalorie.add(mealRemote.calorie.toString());
        newProtein.add(mealRemote.protein.toString());
        newCarb.add(mealRemote.carb.toString());
        newFat.add(mealRemote.fat.toString());
        newServingAmounts.add(mealRemote.servingAmounts.toString());
        newServingUnits.add(mealRemote.units.toString());
        newName.add(mealRemote.name.toString());
        newTypes.add(mealRemote.foodTypeRemote.name.toString());
        newServingAmount.add(mealRemote.servingAmount.toString());
        newServingUnit.add(mealRemote.unit.toString());
        newRecipe.add(mealRemote.recipe.toString());
        newIngredients.add(mealRemote.ingredients.toString());
        newServingIngredientsCount.add(mealRemote.servingIngredientsCount.toString());


        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['foodId'] = newFoodId;
        data['name'] = newName;
        data['type'] = newTypes;
        data['servingAmounts'] = newServingAmounts;
        data['servingUnits'] = newServingUnits;
        data['calorie'] = newCalorie;
        data['protein'] = newProtein;
        data['carb'] = newCarb;
        data['fat'] = newFat;
        data['servingAmount'] = newServingAmount;
        data['servingUnit'] = newServingUnit;
        data['ingredients'] = newIngredients;
        data['servingIngredientsCount'] = newServingIngredientsCount;
        data['recipe'] = newRecipe;


        final supabase = Supabase.instance.client;
        await supabase.from(MY_FAVORITE_REMOTE_TABLE).upsert(data);
        return const Right(Success());
      }
      return Left(favoriteListResponse.asLeft());
    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }



  @override
  Future<Either<Failure, List<FoodRemote>>> getMyFavoriteFoods(String query, String userId) async{
    try {

      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(MY_FAVORITE_REMOTE_TABLE)
          .select<List<dynamic>>()
          .eq('id', userId);


      if(data.isEmpty){
        return const Right([]);
      }

      // favorite list is empty
      if(data[0]['name'] == null){
        return const Right([]);
      }

      final foodId = (data[0]['foodId'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final name = (data[0]['name'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final recipe = (data[0]['recipe'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final servingAmount = (data[0]['servingAmount'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final servingUnit = (data[0]['servingUnit'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final foodType = (data[0]['type'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final servingAmounts = buildListOfLists(data[0]['servingAmounts']);
      final servingUnits = buildListOfLists(data[0]['servingUnits']);
      final servingIngredientsCount = buildListOfLists(data[0]['servingIngredientsCount']);
      final ingredients = buildListOfLists(data[0]['ingredients']);
      final calorie = buildListOfLists(data[0]['calorie']);
      final protein = buildListOfLists(data[0]['protein']);
      final carb = buildListOfLists(data[0]['carb']);
      final fat = buildListOfLists(data[0]['fat']);





      List<FoodRemote> foods = [];
      for (int i = 0; i < name.length; i++) {
        FoodRemote foodRemote = FoodRemote(
          id: foodId[i],
          name: name[i],
          calorie: calorie[i],
          protein: protein[i],
          carb: carb[i],
          fat: fat[i],
          ingredients: ingredients[i],
          servingIngredientsCount: servingIngredientsCount[i],
          servingAmounts: servingAmounts[i],
          units: servingUnits[i],
          servingAmount: double.parse(servingAmount[i]),
          foodTypeRemote: foodType[i] ==  'groceryProduct' ? FoodTypeRemote.groceryProduct : FoodTypeRemote.meal,
          recipe: recipe[i],
          unit: servingUnit[i],
        );
        foods.add(foodRemote);
      }

      return Right(foods);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }





  List<List<String>> buildListOfLists(List<dynamic> input){
    List<dynamic> jsonList = input;
    List<List<String>> listOfLists = [];
    for (var jsonElement in jsonList) {
      if (jsonElement is String) {
        var units = jsonElement.replaceAll('[', '').replaceAll(']', '').split(', ');
        listOfLists.add(units);
      }
    }
    return listOfLists;
  }

  @override
  Future<Either<Failure, Success>> saveToMyFavoriteGrocery(FoodRemote grocery, String userId) async{
    try {


      final favoriteListResponse = await getMyFavoriteFoods('', userId);

      if(favoriteListResponse.isRight()){
        final list = favoriteListResponse.asRight();

          List<String> newFoodId = [];
          List<String> newCalorie = [];
          List<String> newProtein = [];
          List<String> newCarb = [];
          List<String> newFat = [];
          List<String> newServingAmounts = [];
          List<String> newServingUnits = [];
          List<String> newServingAmount = [];
          List<String> newServingUnit = [];
          List<String> newRecipe = [];
          List<String> newIngredients = [];
          List<String> newTypes = [];
          List<String> newName = [];
          List<String> newServingIngredientsCount = [];


          list.forEach((favoriteFood) {
            newFoodId.add(favoriteFood.id);
            newCalorie.add(favoriteFood.calorie.toString());
            newProtein.add(favoriteFood.protein.toString());
            newCarb.add(favoriteFood.carb.toString());
            newFat.add(favoriteFood.fat.toString());
            newServingAmounts.add(favoriteFood.servingAmounts.toString());
            newServingUnits.add(favoriteFood.units.toString());
            newName.add(favoriteFood.name.toString());
            newTypes.add(favoriteFood.foodTypeRemote.name.toString());
            newServingAmount.add(favoriteFood.servingAmount.toString());
            newServingUnit.add(favoriteFood.unit.toString());
            newRecipe.add(favoriteFood.recipe.toString());
            newIngredients.add(favoriteFood.ingredients.toString());
            newServingIngredientsCount.add(favoriteFood.servingIngredientsCount.toString());
          });
          // String random = generateRandomId();
          newFoodId.add(grocery.id.toString());
          newCalorie.add(grocery.calorie.toString());
          newProtein.add(grocery.protein.toString());
          newCarb.add(grocery.carb.toString());
          newFat.add(grocery.fat.toString());
          newServingAmounts.add(grocery.servingAmounts.toString());
          newServingUnits.add(grocery.units.toString());
          newName.add(grocery.name.toString());
          newTypes.add(grocery.foodTypeRemote.name.toString());
          newServingAmount.add('-1');
          newServingUnit.add('-1');
          newRecipe.add('-1');
          newIngredients.add('-1');
          newServingIngredientsCount.add('-1');



        final Map<String, dynamic> data = <String, dynamic>{};
          data['id'] = userId;
          data['foodId'] = newFoodId;
          data['name'] = newName;
          data['type'] = newTypes;
          data['servingAmounts'] = newServingAmounts;
          data['servingUnits'] = newServingUnits;
          data['calorie'] = newCalorie;
          data['protein'] = newProtein;
          data['carb'] = newCarb;
          data['fat'] = newFat;
          data['servingAmount'] = newServingAmount;
          data['servingUnit'] = newServingUnit;
          data['ingredients'] = newIngredients;
          data['servingIngredientsCount'] = newServingIngredientsCount;
          data['recipe'] = newRecipe;


          final supabase = Supabase.instance.client;
          await supabase.from(MY_FAVORITE_REMOTE_TABLE).upsert(data);
          return const Right(Success());
      }
      return Left(favoriteListResponse.asLeft());
    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, List<SuggestedFoodsPortionRemote>>> suggestFoodsPortions(List<FoodRemote> foods, List<List<double>> servingRanges,
      List<List<double>> macroGoalsRange, List<String> restriction, String macroGoalType, List<double> macroPercentage) async{
    try{
      final NetworkRequest request = await NetworkRequest.createGoogleCloud();


      List<Map<String, dynamic>> foodsBodyValue = [];
      for (int i = 0; i < foods.length; i++) {

        FoodRemote food= foods[i];

        double calorie= 0;
        double protein= 0;
        double carb= 0;
        double fat= 0;

        food.calorie.forEach((cal) {
            calorie= calorie + double.parse(cal);
          });
        food.protein.forEach((prot) {
            protein= protein + double.parse(prot);
          });
        food.carb.forEach((car) {
            carb= carb + double.parse(car);
          });
        food.fat.forEach((fats) {
            fat= fat + double.parse(fats);
          });

        List<double> foodMacro= [];
        foodMacro.add(calorie);
        foodMacro.add(protein);
        foodMacro.add(carb);
        foodMacro.add(fat);


        Map<String, dynamic> foodMap = {
          "foodname": food.name,
          "macro": foodMacro,
          "minServing": servingRanges[i][0],
          "maxServing": servingRanges[i][1]
        };
        foodsBodyValue.add(foodMap);
      }

      List<List<double>> macroLimits= [];
      if(macroGoalsRange.isNotEmpty){
        macroLimits.add(macroGoalsRange[0]);
        macroLimits.add(macroGoalsRange[1]);
        macroLimits.add(macroGoalsRange[2]);
        macroLimits.add(macroGoalsRange[3]);
      }


      Map<String, dynamic> foodsPortionRemoteBody = {
        'foods': foodsBodyValue,
        'macroLimitsRange': macroLimits,
        'restriction': restriction.isEmpty ? [] : [int.parse(restriction[0]), restriction[1]],
        'isPercentageBased': macroGoalType == BY_PERCENTAGE_LABEL,
        'calorieLimitPercentageBased' : macroLimits[0],
        'macroPercentage': macroPercentage
      };


      final response= await request.post(FOODS_PORTION_API, data: foodsPortionRemoteBody);

      if(response.statusCode == SUCCESS_API_CODE){

        FoodsPortionRemoteResult foodsPortionRemoteResult = FoodsPortionRemoteResult.fromJson(response.data);

        List<SuggestedFoodsPortionRemote> foodsPortions= [];

        for (int i = 0; i < foodsPortionRemoteResult.topRecommendations.length; i++){

          final recommendation= foodsPortionRemoteResult.topRecommendations[i];

          List<FoodRemote> foodsRemote= [];
          for (int j = 0; j < foods.length; j++){
            FoodRemote food= foods[j];
            food= food.copyWith(count: recommendation.portion[j]);
            foodsRemote.add(food);
          }

          SuggestedFoodsPortionRemote suggestedFoodsPortionRemote = SuggestedFoodsPortionRemote(
            foods: foodsRemote,
            accuracy: recommendation.accuracy.toInt(),
            totalMacro: recommendation.macro
          );
          foodsPortions.add(suggestedFoodsPortionRemote);
        }

        return  Right(foodsPortions);
      }
      return  Left(RemoteFailure(response.statusCode, response.data['message']));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<FoodRemote>>> logFoods(List<FoodRemote> foods, String date, String userId) async{
    try {

        List<FoodRemote> newFoods = [];
        foods.forEach((newFood) {
          if(foods.where((item) =>
          item.name == newFood.name &&
          item.foodTypeRemote == newFood.foodTypeRemote &&
          item.calorie.toString() == newFood.calorie.toString() &&
          item.protein.toString() == newFood.protein.toString() &&
          item.carb.toString() == newFood.carb.toString() &&
          item.fat.toString() == newFood.fat.toString() &&
          item.servingAmounts.toString() == newFood.servingAmounts.toString() &&
          item.units.toString() == newFood.units.toString() &&
          item.servingAmount.toString() == newFood.servingAmount.toString() &&
          item.unit.toString() == newFood.unit.toString() &&
          item.servingIngredientsCount.toString() == newFood.servingIngredientsCount.toString() &&
          item.ingredients.toString() == newFood.ingredients.toString() &&
          item.recipe == newFood.recipe
          ).length > 1){
            // the food has been already logged. so we should keep only one of them but add their count
            if(newFoods.where((element) =>
            element.name == newFood.name &&
                element.foodTypeRemote == newFood.foodTypeRemote &&
                element.calorie.toString() == newFood.calorie.toString() &&
                element.protein.toString() == newFood.protein.toString() &&
                element.carb.toString() == newFood.carb.toString() &&
                element.fat.toString() == newFood.fat.toString() &&
                element.servingAmounts.toString() == newFood.servingAmounts.toString() &&
                element.units.toString() == newFood.units.toString() &&
                element.servingAmount.toString() == newFood.servingAmount.toString() &&
                element.unit.toString() == newFood.unit.toString() &&
                element.servingIngredientsCount.toString() == newFood.servingIngredientsCount.toString() &&
                element.ingredients.toString() == newFood.ingredients.toString() &&
                element.recipe == newFood.recipe
            ).isEmpty){
              double count = 0;
              foods.where((element) =>
              element.name == newFood.name &&
                  element.foodTypeRemote == newFood.foodTypeRemote &&
                  element.calorie.toString() == newFood.calorie.toString() &&
                  element.protein.toString() == newFood.protein.toString() &&
                  element.carb.toString() == newFood.carb.toString() &&
                  element.fat.toString() == newFood.fat.toString() &&
                  element.servingAmounts.toString() == newFood.servingAmounts.toString() &&
                  element.units.toString() == newFood.units.toString() &&
                  element.servingAmount.toString() == newFood.servingAmount.toString() &&
                  element.unit.toString() == newFood.unit.toString() &&
                  element.servingIngredientsCount.toString() == newFood.servingIngredientsCount.toString() &&
                  element.ingredients.toString() == newFood.ingredients.toString() &&
                  element.recipe == newFood.recipe
              ).forEach((repeatedFood) {
                count = count + repeatedFood.count;
              });
              newFoods.add(newFood.copyWith(count: count));
            }
          }else{
            newFoods.add(newFood);
          }
        });

        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['today_logs'] = toFoodsJson(newFoods, date);

        final supabase = Supabase.instance.client;
        await supabase.from(USER_LOGGED_FOOD_REMOTE_TABLE).upsert(data);

        return Right(newFoods);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  String parseFraction(String fraction) {
    List<String> parts = fraction.split('/');

    double numerator = 0.0;
    double denominator = 0.0;

    String type= checkType(parts[0]);
    if(type == 'double'){
      numerator = double.parse(parts[0]);
      denominator = parts.length > 1 ? double.parse(parts[1]) : 1.0;
    }else if(type == 'int'){
      numerator = int.parse(parts[0]).toDouble();
      denominator = (parts.length > 1 ? int.parse(parts[1]) : 1.0).toDouble();
    }

    return (numerator / denominator).toString();
  }


  String checkType(String input) {
    double? doubleValue = double.tryParse(input);
    int? intValue = int.tryParse(input);

    if (doubleValue != null) {
      return 'double';
    } else if (intValue != null) {
      return 'int';
    } else {
      return 'not valid';
    }
  }

  @override
  Future<Either<Failure, List<FoodRemote>>> getLoggedFoods(String date, String userId) async{
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(USER_LOGGED_FOOD_REMOTE_TABLE)
          .select<List<dynamic>>()
          .eq('id', userId);

      if(data[0]['today_logs'] == null){
        return const Right([]);
      }

      List<FoodRemote> foods= [];

      if(data[0]['today_logs']['date'] == date){
        foods= fromFoodsJson(data[0]['today_logs'] as Map<String, dynamic>);
      }

      return Right(foods);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> removeFoodFromMyFavorites(FoodRemote foodRemote, String userId) async{
    try{
      final favoriteListResponse = await getMyFavoriteFoods('', userId);


      if(favoriteListResponse.isRight()){
        final list = favoriteListResponse.asRight();

        List<String> newFoodId = [];
        List<String> newCalorie = [];
        List<String> newProtein = [];
        List<String> newCarb = [];
        List<String> newFat = [];
        List<String> newServingAmounts = [];
        List<String> newServingUnits = [];
        List<String> newServingAmount = [];
        List<String> newServingUnit = [];
        List<String> newRecipe = [];
        List<String> newIngredients = [];
        List<String> newTypes = [];
        List<String> newName = [];
        List<String> newServingIngredientsCount = [];

        list.forEach((favoriteFood) {
          if(favoriteFood.id != foodRemote.id){
            newFoodId.add(favoriteFood.id);
            newCalorie.add(favoriteFood.calorie.toString());
            newProtein.add(favoriteFood.protein.toString());
            newCarb.add(favoriteFood.carb.toString());
            newFat.add(favoriteFood.fat.toString());
            newServingAmounts.add(favoriteFood.servingAmounts.toString());
            newServingUnits.add(favoriteFood.units.toString());
            newName.add(favoriteFood.name.toString());
            newTypes.add(favoriteFood.foodTypeRemote.name.toString());
            newServingAmount.add(favoriteFood.servingAmount.toString());
            newServingUnit.add(favoriteFood.unit.toString());
            newRecipe.add(favoriteFood.recipe.toString());
            newIngredients.add(favoriteFood.ingredients.toString());
            newServingIngredientsCount.add(favoriteFood.servingIngredientsCount.toString());
          }
        });


        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['foodId'] = newFoodId;
        data['name'] = newName;
        data['type'] = newTypes;
        data['servingAmounts'] = newServingAmounts;
        data['servingUnits'] = newServingUnits;
        data['calorie'] = newCalorie;
        data['protein'] = newProtein;
        data['carb'] = newCarb;
        data['fat'] = newFat;
        data['servingAmount'] = newServingAmount;
        data['servingUnit'] = newServingUnit;
        data['ingredients'] = newIngredients;
        data['servingIngredientsCount'] = newServingIngredientsCount;
        data['recipe'] = newRecipe;


        final supabase = Supabase.instance.client;
        await supabase.from(MY_FAVORITE_REMOTE_TABLE).update(data).eq('id', userId);
        return const Right(Success());
      }
      return Left(favoriteListResponse.asLeft());
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> updateMyFavoriteGrocery(FoodRemote grocery, String userId) async{
    try{
      final favoriteListResponse = await getMyFavoriteFoods('', userId);
      if(favoriteListResponse.isRight()){
        final list = favoriteListResponse.asRight();

        List<String> newFoodId = [];
        List<String> newCalorie = [];
        List<String> newProtein = [];
        List<String> newCarb = [];
        List<String> newFat = [];
        List<String> newServingAmounts = [];
        List<String> newServingUnits = [];
        List<String> newServingAmount = [];
        List<String> newServingUnit = [];
        List<String> newRecipe = [];
        List<String> newIngredients = [];
        List<String> newTypes = [];
        List<String> newName = [];
        List<String> newServingIngredientsCount = [];


        list.forEach((favoriteFood) {
          FoodRemote foodRemote = FoodRemote();
          if(favoriteFood.id == grocery.id){
            foodRemote = grocery;
          }else{
            foodRemote = favoriteFood;
          }
          newFoodId.add(foodRemote.id);
          newCalorie.add(foodRemote.calorie.toString());
          newProtein.add(foodRemote.protein.toString());
          newCarb.add(foodRemote.carb.toString());
          newFat.add(foodRemote.fat.toString());
          newServingAmounts.add(foodRemote.servingAmounts.toString());
          newServingUnits.add(foodRemote.units.toString());
          newName.add(foodRemote.name.toString());
          newTypes.add(foodRemote.foodTypeRemote.name.toString());
          newServingAmount.add(foodRemote.servingAmount.toString());
          newServingUnit.add(foodRemote.unit.toString());
          newRecipe.add(foodRemote.recipe.toString());
          newIngredients.add(foodRemote.ingredients.toString());
          newServingIngredientsCount.add(foodRemote.servingIngredientsCount.toString());
        });


        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['foodId'] = newFoodId;
        data['name'] = newName;
        data['type'] = newTypes;
        data['servingAmounts'] = newServingAmounts;
        data['servingUnits'] = newServingUnits;
        data['calorie'] = newCalorie;
        data['protein'] = newProtein;
        data['carb'] = newCarb;
        data['fat'] = newFat;
        data['servingAmount'] = newServingAmount;
        data['servingUnit'] = newServingUnit;
        data['ingredients'] = newIngredients;
        data['servingIngredientsCount'] = newServingIngredientsCount;
        data['recipe'] = newRecipe;


        final supabase = Supabase.instance.client;
        await supabase.from(MY_FAVORITE_REMOTE_TABLE).update(data).eq('id', userId);
        return const Right(Success());
      }
      return Left(favoriteListResponse.asLeft());
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> updateMyFavoriteMeal(FoodRemote meal, String userId) async{
    try{

      final favoriteListResponse = await getMyFavoriteFoods('', userId);

      if(favoriteListResponse.isRight()){
        final list = favoriteListResponse.asRight();

        List<String> newFoodId = [];
        List<String> newCalorie = [];
        List<String> newProtein = [];
        List<String> newCarb = [];
        List<String> newFat = [];
        List<String> newServingAmounts = [];
        List<String> newServingUnits = [];
        List<String> newServingAmount = [];
        List<String> newServingUnit = [];
        List<String> newRecipe = [];
        List<String> newIngredients = [];
        List<String> newTypes = [];
        List<String> newName = [];
        List<String> newServingIngredientsCount = [];


        list.forEach((favoriteFood) {
          FoodRemote foodRemote = FoodRemote();
          if(favoriteFood.id == meal.id){
            foodRemote = meal;
          }else{
            foodRemote = favoriteFood;
          }

          newFoodId.add(foodRemote.id);
          newCalorie.add(foodRemote.calorie.toString());
          newProtein.add(foodRemote.protein.toString());
          newCarb.add(foodRemote.carb.toString());
          newFat.add(foodRemote.fat.toString());
          newServingAmounts.add(foodRemote.servingAmounts.toString());
          newServingUnits.add(foodRemote.units.toString());
          newName.add(foodRemote.name.toString());
          newTypes.add(foodRemote.foodTypeRemote.name.toString());
          newServingAmount.add(foodRemote.servingAmount.toString());
          newServingUnit.add(foodRemote.unit.toString());
          newRecipe.add(foodRemote.recipe.toString());
          newIngredients.add(foodRemote.ingredients.toString());
          newServingIngredientsCount.add(foodRemote.servingIngredientsCount.toString());
        });


        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['foodId'] = newFoodId;
        data['name'] = newName;
        data['type'] = newTypes;
        data['servingAmounts'] = newServingAmounts;
        data['servingUnits'] = newServingUnits;
        data['calorie'] = newCalorie;
        data['protein'] = newProtein;
        data['carb'] = newCarb;
        data['fat'] = newFat;
        data['servingAmount'] = newServingAmount;
        data['servingUnit'] = newServingUnit;
        data['ingredients'] = newIngredients;
        data['servingIngredientsCount'] = newServingIngredientsCount;
        data['recipe'] = newRecipe;


        final supabase = Supabase.instance.client;
        await supabase.from(MY_FAVORITE_REMOTE_TABLE).update(data).eq('id', userId);
        return const Right(Success());
      }
      return Left(favoriteListResponse.asLeft());
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }


  @override
  Future<Either<Failure, Success>> saveUserSuggestedFood(String foodName, List<String> ingredients, String diet, String nationality, String userId) async{
    try {

      final suggestedListResponse = await getUserSuggestedFoods(userId);

      if(suggestedListResponse.isRight()){

        final list = suggestedListResponse.asRight();

        final Map<String, dynamic> data = <String, dynamic>{};

        List<String> newNationality = [];
        List<String> newDiet = [];
        List<String> newIngredients = [];
        List<String> newName = [];

        if(foodName.isNotEmpty){
          list.names.forEach((item) {
            if(!newName.contains(item)){
              newName.add(item);
            }
          });
          if(!newName.contains(foodName)){
            newName.add(foodName);
          }
          data['name'] = newName;
        }


        if(nationality.isNotEmpty){
          list.nationalities.forEach((item) {
            newNationality.add(item);
          });
          newNationality.add(nationality);
          data['nationality'] = newNationality;
        }


        if(diet.isNotEmpty){
          list.diets.forEach((item) {
            newDiet.add(item);
          });
          newDiet.add(diet);
          data['diet'] = newDiet;
        }


        if(ingredients.isNotEmpty){
          list.ingredients.forEach((item) {
            newIngredients.add(item);
          });
          newIngredients.addAll(ingredients);
          data['ingredients'] = newIngredients;
        }

        final supabase = Supabase.instance.client;
        await supabase.from(USER_SUGGESTED_FOOD_REMOTE_TABLE).update(data).eq('id', userId);
        return const Right(Success());
      }
      return Left(suggestedListResponse.asLeft());
    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }


  @override
  Future<Either<Failure, SuggestedFoodRemote>> getUserSuggestedFoods(String userId) async{
    try {

      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(USER_SUGGESTED_FOOD_REMOTE_TABLE)
          .select<List<dynamic>>()
          .eq('id', userId);

      if(data.isEmpty){
        return Right(SuggestedFoodRemote(names: [], ingredients: [], diets: [], nationalities: []));
      }


      List<String> names = [];
      List<String> ingredients = [];
      List<String> diets = [];
      List<String> nationalities = [];

      if(data[0]['name'] != null){
         names = (data[0]['name'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      }

      if(data[0]['ingredients'] != null){
        ingredients = (data[0]['ingredients'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      }

      if(data[0]['diet'] != null){
        diets = (data[0]['diet'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      }

      if(data[0]['nationality'] != null){
        nationalities = (data[0]['nationality'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      }

      SuggestedFoodRemote suggestedFoodRemote = SuggestedFoodRemote(
        names: names,
        nationalities: nationalities,
        diets: diets,
        ingredients: ingredients
      );


      return Right(suggestedFoodRemote);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, List<FoodRemote>>> getMyCookBookFoods(String query, String userId) async{
    try {

      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(MY_COOKBOOK_REMOTE_TABLE)
          .select<List<dynamic>>()
          .eq('id', userId);


      if(data.isEmpty){
        return const Right([]);
      }

      // favorite list is empty
      if(data[0]['name'] == null){
        return const Right([]);
      }

      final foodId = (data[0]['food_id'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final name = (data[0]['name'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final recipe = (data[0]['recipe'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final servingAmount = (data[0]['serving_amount'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final servingUnit = (data[0]['unit'] as List<dynamic>).map((dynamic item) => item.toString()).toList();
      final servingAmounts = buildListOfLists(data[0]['serving_amounts']);
      final servingUnits = buildListOfLists(data[0]['units']);
      final servingIngredientsCount = buildListOfLists(data[0]['serving_ingredients_count']);
      final ingredients = buildListOfLists(data[0]['ingredients']);
      final calorie = buildListOfLists(data[0]['calorie']);
      final protein = buildListOfLists(data[0]['protein']);
      final carb = buildListOfLists(data[0]['carb']);
      final fat = buildListOfLists(data[0]['fat']);


      List<FoodRemote> foods = [];
      for (int i = 0; i < name.length; i++) {
        FoodRemote foodRemote = FoodRemote(
          id: foodId[i],
          name: name[i],
          calorie: calorie[i],
          protein: protein[i],
          carb: carb[i],
          fat: fat[i],
          ingredients: ingredients[i],
          servingIngredientsCount: servingIngredientsCount[i],
          servingAmounts: servingAmounts[i],
          units: servingUnits[i],
          servingAmount: double.parse(servingAmount[i]),
          recipe: recipe[i],
          unit: servingUnit[i],
        );
        foods.add(foodRemote);
      }

      return Right(foods);


    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> saveToMyCookBookMeals(FoodRemote mealRemote, String userId) async{
    try {
      final cookBookListResponse = await getMyCookBookFoods('', userId);
      if(cookBookListResponse.isRight()){
        final list = cookBookListResponse.asRight();

        List<String> newFoodId = [];
        List<String> newCalorie = [];
        List<String> newProtein = [];
        List<String> newCarb = [];
        List<String> newFat = [];
        List<String> newServingAmounts = [];
        List<String> newServingUnits = [];
        List<String> newServingAmount = [];
        List<String> newServingUnit = [];
        List<String> newRecipe = [];
        List<String> newIngredients = [];
        List<String> newName = [];
        List<String> newServingIngredientsCount = [];


        list.forEach((favoriteFood) {
          newFoodId.add(favoriteFood.id.toString());
          newCalorie.add(favoriteFood.calorie.toString());
          newProtein.add(favoriteFood.protein.toString());
          newCarb.add(favoriteFood.carb.toString());
          newFat.add(favoriteFood.fat.toString());
          newServingAmounts.add(favoriteFood.servingAmounts.toString());
          newServingUnits.add(favoriteFood.units.toString());
          newName.add(favoriteFood.name.toString());
          newServingAmount.add(favoriteFood.servingAmount.toString());
          newServingUnit.add(favoriteFood.unit.toString());
          newRecipe.add(favoriteFood.recipe.toString());
          newIngredients.add(favoriteFood.ingredients.toString());
          newServingIngredientsCount.add(favoriteFood.servingIngredientsCount.toString());
        });
        newFoodId.add(mealRemote.id);
        newCalorie.add(mealRemote.calorie.toString());
        newProtein.add(mealRemote.protein.toString());
        newCarb.add(mealRemote.carb.toString());
        newFat.add(mealRemote.fat.toString());
        newServingAmounts.add(mealRemote.servingAmounts.toString());
        newServingUnits.add(mealRemote.units.toString());
        newName.add(mealRemote.name.toString());
        newServingAmount.add(mealRemote.servingAmount.toString());
        newServingUnit.add(mealRemote.unit.toString());
        newRecipe.add(mealRemote.recipe.toString());
        newIngredients.add(mealRemote.ingredients.toString());
        newServingIngredientsCount.add(mealRemote.servingIngredientsCount.toString());


        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['food_id'] = newFoodId;
        data['name'] = newName;
        data['serving_amounts'] = newServingAmounts;
        data['units'] = newServingUnits;
        data['calorie'] = newCalorie;
        data['protein'] = newProtein;
        data['carb'] = newCarb;
        data['fat'] = newFat;
        data['serving_amount'] = newServingAmount;
        data['unit'] = newServingUnit;
        data['ingredients'] = newIngredients;
        data['serving_ingredients_count'] = newServingIngredientsCount;
        data['recipe'] = newRecipe;


        final supabase = Supabase.instance.client;
        await supabase.from(MY_COOKBOOK_REMOTE_TABLE).upsert(data);
        return const Right(Success());
      }
      return Left(cookBookListResponse.asLeft());
    } on PostgrestException catch (error) {

      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> updateMyCookBookMeal(FoodRemote meal, String userId) async{
    try{

      final cookBookListResponse = await getMyCookBookFoods('', userId);

      if(cookBookListResponse.isRight()){
        final list = cookBookListResponse.asRight();

        List<String> newFoodId = [];
        List<String> newCalorie = [];
        List<String> newProtein = [];
        List<String> newCarb = [];
        List<String> newFat = [];
        List<String> newServingAmounts = [];
        List<String> newServingUnits = [];
        List<String> newServingAmount = [];
        List<String> newServingUnit = [];
        List<String> newRecipe = [];
        List<String> newIngredients = [];
        List<String> newName = [];
        List<String> newServingIngredientsCount = [];


        list.forEach((cookBookFood) {
          FoodRemote foodRemote = FoodRemote();
          if(cookBookFood.id == meal.id){
            foodRemote = meal;
          }else{
            foodRemote = cookBookFood;
          }

          newFoodId.add(foodRemote.id);
          newCalorie.add(foodRemote.calorie.toString());
          newProtein.add(foodRemote.protein.toString());
          newCarb.add(foodRemote.carb.toString());
          newFat.add(foodRemote.fat.toString());
          newServingAmounts.add(foodRemote.servingAmounts.toString());
          newServingUnits.add(foodRemote.units.toString());
          newName.add(foodRemote.name.toString());
          newServingAmount.add(foodRemote.servingAmount.toString());
          newServingUnit.add(foodRemote.unit.toString());
          newRecipe.add(foodRemote.recipe.toString());
          newIngredients.add(foodRemote.ingredients.toString());
          newServingIngredientsCount.add(foodRemote.servingIngredientsCount.toString());
        });


        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['food_id'] = newFoodId;
        data['name'] = newName;
        data['serving_amounts'] = newServingAmounts;
        data['units'] = newServingUnits;
        data['calorie'] = newCalorie;
        data['protein'] = newProtein;
        data['carb'] = newCarb;
        data['fat'] = newFat;
        data['serving_amount'] = newServingAmount;
        data['unit'] = newServingUnit;
        data['ingredients'] = newIngredients;
        data['serving_ingredients_count'] = newServingIngredientsCount;
        data['recipe'] = newRecipe;

        final supabase = Supabase.instance.client;
        await supabase.from(MY_COOKBOOK_REMOTE_TABLE).update(data).eq('id', userId);
        return const Right(Success());
      }
      return Left(cookBookListResponse.asLeft());
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> removeFoodFromMyCookBook(FoodRemote foodRemote, String userId) async{
    try{
      final favoriteListResponse = await getMyCookBookFoods('', userId);


      if(favoriteListResponse.isRight()){
        final list = favoriteListResponse.asRight();

        List<String> newFoodId = [];
        List<String> newCalorie = [];
        List<String> newProtein = [];
        List<String> newCarb = [];
        List<String> newFat = [];
        List<String> newServingAmounts = [];
        List<String> newServingUnits = [];
        List<String> newServingAmount = [];
        List<String> newServingUnit = [];
        List<String> newRecipe = [];
        List<String> newIngredients = [];
        List<String> newName = [];
        List<String> newServingIngredientsCount = [];

        list.forEach((favoriteFood) {
          if(favoriteFood.id != foodRemote.id){
            newFoodId.add(favoriteFood.id);
            newCalorie.add(favoriteFood.calorie.toString());
            newProtein.add(favoriteFood.protein.toString());
            newCarb.add(favoriteFood.carb.toString());
            newFat.add(favoriteFood.fat.toString());
            newServingAmounts.add(favoriteFood.servingAmounts.toString());
            newServingUnits.add(favoriteFood.units.toString());
            newName.add(favoriteFood.name.toString());
            newServingAmount.add(favoriteFood.servingAmount.toString());
            newServingUnit.add(favoriteFood.unit.toString());
            newRecipe.add(favoriteFood.recipe.toString());
            newIngredients.add(favoriteFood.ingredients.toString());
            newServingIngredientsCount.add(favoriteFood.servingIngredientsCount.toString());
          }
        });


        final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = userId;
        data['food_id'] = newFoodId;
        data['name'] = newName;
        data['serving_amounts'] = newServingAmounts;
        data['units'] = newServingUnits;
        data['calorie'] = newCalorie;
        data['protein'] = newProtein;
        data['carb'] = newCarb;
        data['fat'] = newFat;
        data['serving_amount'] = newServingAmount;
        data['unit'] = newServingUnit;
        data['ingredients'] = newIngredients;
        data['serving_ingredients_count'] = newServingIngredientsCount;
        data['recipe'] = newRecipe;


        final supabase = Supabase.instance.client;
        await supabase.from(MY_COOKBOOK_REMOTE_TABLE).update(data).eq('id', userId);
        return const Right(Success());
      }
      return Left(favoriteListResponse.asLeft());
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

}