


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
part 'generic_food_detail_argument_model.freezed.dart';


@freezed
class GenericFoodDetailArgumentModel with _$GenericFoodDetailArgumentModel{

  factory GenericFoodDetailArgumentModel({
    @Default(null) GenericFood? food,
    @Default(false) bool macroEdition
  })= _GenericFoodDetailArgumentModel;

}

