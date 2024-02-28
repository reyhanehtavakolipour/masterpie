


import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/model/food_model.dart';
part 'food_detail_argument_model.freezed.dart';


@freezed
class FoodDetailArgumentModel with _$FoodDetailArgumentModel{

  factory FoodDetailArgumentModel({
    @Default(null) Food? food,
    @Default(false) bool macroEdition
  })= _FoodDetailArgumentModel;

}

