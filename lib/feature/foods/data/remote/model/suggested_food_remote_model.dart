
import 'package:freezed_annotation/freezed_annotation.dart';
part 'suggested_food_remote_model.freezed.dart';



@freezed
class SuggestedFoodRemote with _$SuggestedFoodRemote{

  factory SuggestedFoodRemote({
    @Default([]) List<String> names,
    @Default([]) List<String> nationalities,
    @Default([]) List<String> ingredients,
    @Default([]) List<String> diets,
  })= _SuggestedFoodRemote;

}