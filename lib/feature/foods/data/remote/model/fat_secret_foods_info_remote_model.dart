
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fat_secret_foods_info_remote_model.freezed.dart';



@freezed
class FatSecretFoodsInfoRemote with _$FatSecretFoodsInfoRemote{

  factory FatSecretFoodsInfoRemote({
    @Default([]) List<String> recipeTypes,
    @Default([]) List<String> categories,
    @Default([]) List<String> allergens,
  })= _FatSecretFoodsInfoRemote;

}