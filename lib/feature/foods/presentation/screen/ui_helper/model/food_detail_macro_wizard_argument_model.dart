


import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'food_detail_macro_wizard_argument_model.freezed.dart';


@freezed
class FoodDetailForMacroWizardArgumentModel with _$FoodDetailForMacroWizardArgumentModel{

  factory FoodDetailForMacroWizardArgumentModel({
    @Default(null) Food? food,
    @Default('') String type,
    @Default(0) int index
  })= _FoodDetailForMacroWizardArgumentModel;

}

