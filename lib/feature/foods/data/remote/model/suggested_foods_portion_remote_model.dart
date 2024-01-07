import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_remote_model.dart';
part 'suggested_foods_portion_remote_model.freezed.dart';


@freezed
class SuggestedFoodsPortionRemote with _$SuggestedFoodsPortionRemote{

  factory SuggestedFoodsPortionRemote({
    @Default([]) List<FoodRemote> foods,
    @Default([]) List<double> totalMacro,
    @Default(0) int accuracy
  })= _SuggestedFoodsPortionRemote;

}