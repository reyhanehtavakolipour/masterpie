

import 'dart:convert';

import 'package:dart_openai/dart_openai.dart';
import 'package:dartz/dartz.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/core/helper/print.dart';
import '../../../../../util/core/response/failure.dart';
import '../model/food_remote_model.dart';
import '../model/food_type_remote.dart';
import 'openai_food_remote_datasource.dart';

class OpenAIFoodRemoteDataSourceImpl extends OpenAIFoodRemoteDataSource{
  @override
  Future<Either<Failure, FoodRemote>> getMealRecipe(String mealName) async{
    OpenAI.apiKey = OPENAI_API_KEY;

    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          "You are an assistant that gives ingredients, serving amount of each ingredient, unit of each ingredient, calorie of each ingredient, protein of each ingredient, carb of each ingredient, fat of each ingredient and a recipe to cook of a given food for one serving in a valid JSON format. The number of ingredients, serving amount, unit, calorie, protein, carb and fat must be the same. Serving amount must be number. The number of ingredients, serving amount, unit, calorie, protein, carb and fat must be the same. Serving amount must be number.",
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
      model: "ft:gpt-3.5-turbo-1106:masterpie::8cdRVF8f",
      messages: requestMessages,
      temperature: 1,
      maxTokens: 1024,
      responseFormat: { "type": "json_object" }
    );

    final result= chatCompletion.choices.first.message.content?.first.text;
    printWrapped('RECIPE_OPENAI_RESPONSE: $result');


    Map<String, dynamic> jsonMap = json.decode(result!);


    List<String> ingredients= [];
    ingredients = (jsonMap['ingredients'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString()).toList();


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
    units = (jsonMap['unit'] as List<dynamic>).map((dynamicItem) => dynamicItem.toString()).toList();



    String recipe = '';
    recipe = jsonMap['recipe'];

    print("Ingredients: $ingredients");
    print("Serving Amounts: $servingAmounts");
    print("units: $units");
    print("Calorie: $calorie");
    print("Protein: $protein");
    print("Carb: $carb");
    print("Fat: $fat");
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
  }


  Map<String, dynamic> extractData(String inputString) {
    String validJson = inputString.replaceAll("'", '"');
    return json.decode(validJson);
  }



  @override
  Future<Either<Failure, FoodRemote>> suggestMeal(List<String> mustIngredients, String nationality, List<String> allergies, String diet) async{
    String promptMessage = 'Suggest a meal';
    if(nationality.isNotEmpty && diet != NONE_LABEL){
      promptMessage = 'Suggest a $diet, $nationality meal';
    }else if(nationality.isNotEmpty && diet == NONE_LABEL){
      promptMessage = 'Suggest a $nationality meal';
    }else if(nationality.isEmpty && diet != NONE_LABEL){
      promptMessage = 'Suggest a $diet meal';
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


    promptMessage = '$promptMessage. only give the name without any explanation.';

    OpenAI.apiKey = OPENAI_API_KEY;

    print('show_prompt: $promptMessage');
    final completion = await OpenAI.instance.completion.create(
        model: "text-davinci-003",
        prompt: promptMessage,
        // maxTokens: 1000
    );

    String mealName = '';
    if(completion.choices.isNotEmpty){
       mealName = completion.choices[0].text;
    }

    print('MEAL_NAME_OPENAI_RESPONSE: $mealName');

    if(mealName.isEmpty){
      return const Left(FailureResponse(''));
    }
    return Right(FoodRemote(name: mealName));

  }

}