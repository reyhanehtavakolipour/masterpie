




import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/feature/foods/data/remote/model/suggested_foods_portion_remote_model.dart';

part 'wizard_response_remote_model.freezed.dart';


@freezed
class WizardResponseRemoteModel with _$WizardResponseRemoteModel{

  factory WizardResponseRemoteModel({
    @Default([]) List<SuggestedFoodsPortionRemote> foodsPortions,
    @Default([]) List<String> messages,
  })= _WizardResponseRemoteModel;

}

