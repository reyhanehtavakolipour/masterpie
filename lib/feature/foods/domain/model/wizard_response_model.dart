




import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/domain/model/suggested_foods_portion_model.dart';

part 'wizard_response_model.freezed.dart';


@freezed
class WizardResponseModel with _$WizardResponseModel{

  factory WizardResponseModel({
    @Default([]) List<SuggestedFoodsPortion> foodsPortions,
    @Default([]) List<String> messages,
    @Default([]) List<int> macroGoal,
  })= _WizardResponseModel;

}

