

import 'package:masterpie/feature/foods/data/remote/model/food_remote_model.dart';
import 'package:masterpie/feature/foods/data/remote/model/food_type_remote.dart';

class FoodsPortionRemoteResult {
  final List<TopRecommendation> topRecommendations;
  final List<String> messages;


  FoodsPortionRemoteResult({required this.topRecommendations, required this.messages});

  factory FoodsPortionRemoteResult.fromJson(Map<String, dynamic> json, List<FoodRemote> foods) {
    return FoodsPortionRemoteResult(
      topRecommendations: (json['body'] as List<dynamic>)
          .map((recommendation) => TopRecommendation.fromJson(recommendation, foods))
          .toList(),
      messages: (json['message'] as List<dynamic>)
          .map((message) => message.toString())
          .toList(),
    );
  }
}

class TopRecommendation {
  final double accuracy;
  final List<double> portion;
  final List<double> macro;
  final List<int> foodsIndexesNotAddedBuUser;
  final List<FoodRemote> newFoods;



  TopRecommendation({required this.newFoods, required this.accuracy, required this.portion, required this.macro, required this.foodsIndexesNotAddedBuUser});

  factory TopRecommendation.fromJson(Map<String, dynamic> json, List<FoodRemote> foods) {


    List<FoodRemote> allFoods= [];
    allFoods.addAll(foods);

    List<int> foodsIndexesNotAddedByUser= [];


    List<dynamic> macroList = json['portion'];
    List<double> convertedPortion = macroList.map((item) {
      if (item is int) {
        return item.toDouble();
      } else if (item is double) {
        return item;
      } else {
        throw const FormatException('Invalid type in portion list');
      }
    }).toList();





    //check if new food added
    final foodsResponse = json['foods'] as List<dynamic>;
    if(foodsResponse.length != foods.length){
      for(int i = 0; i < foodsResponse.length; i++){
        if(foodsResponse[i]['isFoodAddedbyUser'] as bool == false){
          foodsIndexesNotAddedByUser.add(i);

          allFoods.add(
              FoodRemote(
                name: foodsResponse[i]['foodname'],
                calorie: [((foodsResponse[i]['macro'] as List<dynamic>)[0]).toString()],
                protein: [((foodsResponse[i]['macro'] as List<dynamic>)[1]).toString()],
                carb: [((foodsResponse[i]['macro'] as List<dynamic>)[2]).toString()],
                fat: [((foodsResponse[i]['macro'] as List<dynamic>)[3]).toString()],
                foodTypeRemote: FoodTypeRemote.groceryProduct,
                units: [foodsResponse[i]['unit'].toString()]
              )
          );
        }
      }
    }



    return TopRecommendation(
      newFoods: allFoods,
      accuracy: json['accuracy'],
      portion: convertedPortion,
      macro: List<double>.from(json['macro']),
      foodsIndexesNotAddedBuUser: foodsIndexesNotAddedByUser
    );
  }
}
