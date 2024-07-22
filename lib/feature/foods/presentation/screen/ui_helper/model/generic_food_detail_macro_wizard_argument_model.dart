


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';

part 'generic_food_detail_macro_wizard_argument_model.freezed.dart';


@freezed
class GenericFoodDetailForMacroWizardArgumentModel with _$GenericFoodDetailForMacroWizardArgumentModel{

  factory GenericFoodDetailForMacroWizardArgumentModel({
    @Default(null) GenericFood? food,
    @Default('') String type,
    @Default(0) int index
  })= _GenericFoodDetailForMacroWizardArgumentModel;

}

