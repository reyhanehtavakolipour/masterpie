import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';


@freezed
class Profile with _$Profile{

  factory Profile({
    @Default('') String email,
    @Default('') String id,
    @Default('') String firstName,
    @Default('') String lastName,
    @Default('') String weight,
    @Default('') String height,
    @Default('') String weightUnit,
    @Default('') String heightUnit,
    @Default('') String goalWeight,
    @Default('') String gender,
    @Default(['', '', '', '']) List<String> dailyMacroGoal,
    @Default('') String age,
    @Default('') String activityLevel,
    @Default('') String weightChangeWeekly,
    @Default(false) bool updateProfileShown,
    @Default([]) List<String> favoriteCategories,
    @Default([]) List<String> hateCategories,
    @Default([]) List<String> mainDishTypes,
    @Default([]) List<String> sideDishTypes,
    @Default([]) List<String> allergens,
  })= _Profile;

}