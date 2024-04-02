


import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/food_model.dart';
part 'request_wizard_argument_model.freezed.dart';


@freezed
class RequestWizardArgumentModel with _$RequestWizardArgumentModel{

  factory RequestWizardArgumentModel({
    @Default([]) List<List<double>> macroGoalRanges,
    @Default([]) List<String> restriction,
    @Default([]) List<Food> foods,
    @Default([]) List<RangeValues> servingRanges
  })= _RequestWizardArgumentModel;

}

