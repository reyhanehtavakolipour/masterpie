

import 'dart:convert';
import 'dart:math';

import 'package:dart_openai/dart_openai.dart';
import 'package:dartz/dartz.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/core/helper/helper.dart';
import '../../../../../util/core/helper/print.dart';
import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';
import '../model/food_type_remote.dart';
import 'openai_food_remote_datasource.dart';

class OpenAIFoodRemoteDataSourceImpl extends OpenAIFoodRemoteDataSource{
  @override
  Future<Either<Failure, FoodRemote>> getMealRecipe(String mealName) async{
    OpenAI.apiKey = OPENAI_API_KEY;

    try{
      final systemMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
              'You are an assistant that gives ingredients, serving amounts of each ingredient, unit of each ingredient, calorie of each ingredient, protein of each ingredient, carb of each ingredient, fat of each ingredient and a recipe to cook of a given food for one serving in a valid JSON format. The number of ingredients, serving amount, unit, calorie, protein, carb and fat must be the same. Serving amount must be number.'
          ),
        ],
        role: OpenAIChatMessageRole.assistant,
      );

      final userMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            "What is the nutrition facts of ingredients and recipe of this food: $mealName?",
          ),
        ],
        role: OpenAIChatMessageRole.user,
      );

      final requestMessages = [
        systemMessage,
        userMessage,
      ];

      OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
          model: "ft:gpt-3.5-turbo-1106:masterpie::8ltWnLFR",
          messages: requestMessages,
          temperature: 1,
          maxTokens: 1024,
          responseFormat: { "type": "json_object" }
      );

      final result= chatCompletion.choices.first.message.content?.first.text;
      printWrapped('RECIPE_OPENAI_RESPONSE: $result');


      Map<String, dynamic> jsonMap = json.decode(result!);


      List<String> ingredients= [];
      ingredients = (jsonMap['ingredients'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString().replaceAll(',', '')).toList();


      List<String> calorie= [];
      calorie = (jsonMap['calorie'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString()).toList();


      List<String> protein= [];
      protein = (jsonMap['protein'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString()).toList();



      List<String> carb= [];
      carb = (jsonMap['carb'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString()).toList();




      List<String> fat= [];
      fat = (jsonMap['fat'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString()).toList();




      List<String> servingAmounts= [];
      servingAmounts = (jsonMap['serving amount'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString()).toList();




      List<String> units= [];
      units = (jsonMap['unit'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString().replaceAll(',', '')).toList();



      String recipe = '';
      recipe = jsonMap['recipe'];

      print("Ingredients: $ingredients ,, ${ingredients.length}");
      print("Serving Amounts: $servingAmounts ${servingAmounts.length}");
      print("units: $units ${units.length}");
      print("Calorie: $calorie ${calorie.length}");
      print("Protein: $protein ${protein.length}");
      print("Carb: $carb ${carb.length}");
      print("Fat: $fat ${fat.length}");
      print("Recipe: $recipe");


      List<String> servingIngredientsCount= [];
      ingredients.forEach((element) {
        servingIngredientsCount.add('1.0');
      });


      return Right(
          FoodRemote(
              name: mealName.trim(),
              foodTypeRemote: FoodTypeRemote.meal,
              ingredients: ingredients,
              servingAmounts: servingAmounts,
              units: units,
              calorie: calorie,
              protein: protein,
              carb: carb,
              fat: fat,
              recipe: recipe,
              servingIngredientsCount: servingIngredientsCount,
              unit: SERVING_LABEL,
              servingAmount: 1
          )
      );


    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }


  Map<String, dynamic> extractData(String inputString) {
    String validJson = inputString.replaceAll("'", '"');
    return json.decode(validJson);
  }


  @override
  Future<Either<Failure, FoodRemote>> suggestMeal(List<String> mustIngredients, String nationality, List<String> allergies, String diet) async{
    try{
      int desiredListLength= 20;
      String promptMessage = 'suggest a list of $desiredListLength random meals.';
      if(nationality.isNotEmpty && diet != NONE_LABEL){
        promptMessage = 'Suggest a list of $desiredListLength  $diet, $nationality meals';
      }else if(nationality.isNotEmpty && diet == NONE_LABEL){
        promptMessage = 'Suggest a list of $desiredListLength $nationality meals';
      }else if(nationality.isEmpty && diet != NONE_LABEL){
        promptMessage = 'Suggest a list of $desiredListLength $diet meals';
      }

      if(mustIngredients.isNotEmpty){
        promptMessage = '${promptMessage} which includes';
        mustIngredients.forEach((element) {
          promptMessage = promptMessage + ' $element,';
        });
      }

      if(allergies.isNotEmpty){
        promptMessage = '$promptMessage. also doesnt have any';
        allergies.forEach((element) {
          promptMessage = promptMessage + ' $element,';
        });
      }


      promptMessage = '$promptMessage. only give the names without any explanation.';


      OpenAI.apiKey = OPENAI_API_KEY;

      print('show_prompt: $promptMessage');

      final systemMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            // "return any message you are given as JSON object with the key of meals.",
            "return any message you are given as JSON object with the key of meals. you should always try to suggest a very random meals list with length of $desiredListLength",
          ),
        ],
        role: OpenAIChatMessageRole.assistant,
      );

      // the user message that will be sent to the request.
      final userMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(
            promptMessage,
          ),
        ],
        role: OpenAIChatMessageRole.user,
      );

      final requestMessages = [systemMessage, userMessage,];
      OpenAIChatCompletionModel chatCompletion = await OpenAI.instance.chat.create(
        model: "gpt-3.5-turbo-1106",
        responseFormat: {"type": "json_object"},
        // seed: 6,
        messages: requestMessages,
        temperature: 1.2,
        maxTokens: 1024,
        // toolChoice: "auto",
      );


      printWrapped('MEALS_NAME_OPENAI_RESPONSE: ${chatCompletion.choices.first.message.content?.first.text}');


      Map<String, dynamic> jsonMap = json.decode(chatCompletion.choices.first.message.content?.first.text ?? '');

      List<String> meals = (jsonMap['meals'] as List<dynamic>).map((value) => value.toString()).toList();

      String selectedRandomMeal= meals[generateRandomNumber(meals.length)];

      print('MEAL_NAME: $selectedRandomMeal');

      return Right(FoodRemote(name: selectedRandomMeal));

    }catch(e){
      return Left(ExceptionFailure(e));
    }

  }

}