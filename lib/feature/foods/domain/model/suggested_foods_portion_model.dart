




import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_model.dart';
part 'suggested_foods_portion_model.freezed.dart';


@freezed
class SuggestedFoodsPortion with _$SuggestedFoodsPortion{

  factory SuggestedFoodsPortion({
    @Default([]) List<Food> foods,
    @Default([]) List<double> totalMacro,
    @Default(0) int accuracy,
    @Default([]) List<int> foodsIndexesNotAddedByUser,
  })= _SuggestedFoodsPortion;

}

