


import 'package:freezed_annotation/freezed_annotation.dart';
part 'request_wizard_argument_model.freezed.dart';


@freezed
class RequestWizardArgumentModel with _$RequestWizardArgumentModel{

  factory RequestWizardArgumentModel({
    @Default([]) List<List<double>> macroGoalRanges,
    @Default([]) List<String> restriction
  })= _RequestWizardArgumentModel;

}

