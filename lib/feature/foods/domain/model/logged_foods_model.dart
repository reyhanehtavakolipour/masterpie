

import 'package:freezed_annotation/freezed_annotation.dart';

import 'food_model.dart';

part 'logged_foods_model.freezed.dart';


@freezed
class LoggedFoods with _$LoggedFoods{

  factory LoggedFoods({
    @Default([]) List<Food> foods,
    @Default('') String date,
    @Default([]) List<double> goals
  })= _LoggedFoods;

}