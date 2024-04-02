


import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model/request_wizard_argument_model.dart';
part 'generic_grocery_detail_macro_wizard_argument_model.freezed.dart';


@freezed
class GenericGroceryDetailForMacroWizardArgumentModel with _$GenericGroceryDetailForMacroWizardArgumentModel{

  factory GenericGroceryDetailForMacroWizardArgumentModel({
    @Default(null) GenericFood? food,
    @Default(null) RequestWizardArgumentModel? requestWizardArgumentModel
  })= _GenericGroceryDetailForMacroWizardArgumentModel;

}

