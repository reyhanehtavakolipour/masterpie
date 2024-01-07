


import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/model/food_model.dart';
import '../../food_detail_screen.dart';
import '../foods_list_ui.dart';
part 'food_detail_argument_model.freezed.dart';


@freezed
class FoodDetailArgumentModel with _$FoodDetailArgumentModel{

  factory FoodDetailArgumentModel({
    @Default(FoodDetailScreenType.ADD_NEW_FAVORITE) FoodDetailScreenType foodDetailScreenType,
    @Default(null) Food? food,
    @Default(null) FoodsListScreen? foodsListScreen,
  })= _FoodDetailArgumentModel;

}

