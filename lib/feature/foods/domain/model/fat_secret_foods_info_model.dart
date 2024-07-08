
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fat_secret_foods_info_model.freezed.dart';



@freezed
class FatSecretFoodsInfo with _$FatSecretFoodsInfo{

  factory FatSecretFoodsInfo({
    @Default([]) List<String> recipeTypes,
    @Default([]) List<String> categories,
    @Default([]) List<String> allergens,
  })= _FatSecretFoodsInfo;

}