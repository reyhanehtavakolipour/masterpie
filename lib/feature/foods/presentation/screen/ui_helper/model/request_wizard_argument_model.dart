


import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:masterpie/util/core/constant/messages_constants.dart';

import '../../../../domain/model/food_model.dart';
part 'request_wizard_argument_model.freezed.dart';


@freezed
class RequestWizardArgumentModel with _$RequestWizardArgumentModel{

  factory RequestWizardArgumentModel({
    @Default([]) List<List<double>> macroGoalRanges,
    @Default([]) List<String> restriction,
    @Default([]) List<Food> foods,
    @Default([]) List<RangeValues> servingRanges,
    @Default(BY_PERCENTAGE_LABEL) String goalType,
    @Default([]) List<double> macroPercentage
  })= _RequestWizardArgumentModel;

}

