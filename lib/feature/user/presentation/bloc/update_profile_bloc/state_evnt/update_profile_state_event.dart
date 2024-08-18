import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_state_event.freezed.dart';



@freezed
abstract class UpdateProfileEvent with _$UpdateProfileEvent {

  const factory UpdateProfileEvent.onUpdateProfile(
      String email,
      String fName,
      String lName,
      String gender,
      String weight,
      String height,
      String weightUnit,
      String heightUnit,
      String goalWeight,
      String age,
      String activityLevel,
      String weightChangeWeekly,
      List<String> mainDishTypes,
      List<String> sideDishTypes,
      String diet,
      List<String> hateCategories,
      List<String> allergens,
      List<String> dailyMacroGoal
      ) = UpdateProfile;


  const factory UpdateProfileEvent.onUpdateUserInfo(
      String firstName,
      String lastName,
      ) = UpdateUserInfo;


  const factory UpdateProfileEvent.onCalculateDailyMacroGoal(
      String gender,
      String weight,
      String height,
      String weightUnit,
      String heightUnit,
      String goalWeight,
      String age,
      String activityLevel,
      String diet,
      String weightChangeWeekly
      ) = CalculateDailyMacroGoal;


  const factory UpdateProfileEvent.onUpdateDailyMacroGoal(
      String calorie,
      String protein,
      String carb,
      String fat,
      ) = UpdateDailyMacroGoal;


  const factory UpdateProfileEvent.onUpdateMacroGoalsAndInputs(
      String gender,
      String weight,
      String height,
      String weightUnit,
      String heightUnit,
      String goalWeight,
      String age,
      String activityLevel,
      String weightChangeWeekly,
      String calorie,
      String protein,
      String carb,
      String fat,
      String diet
      ) = UpdateMacroGoalsAndInputs;

  const factory UpdateProfileEvent.onReset() = Reset;

}



@freezed
abstract class UpdateProfileState with _$UpdateProfileState{
  const factory UpdateProfileState.initial()= UpdateProfileInitialState;
  const factory UpdateProfileState.loading()= UpdateProfileLoadingState;
  const factory UpdateProfileState.error(String message)= UpdateProfileErrorState;
  const factory UpdateProfileState.profileUpdated()= ProfileUpdatedState;
  const factory UpdateProfileState.macroGoalsCalculated(List<String> dailyGoals)= MacroGoalsCalculatedState;
  const factory UpdateProfileState.userInfoUpdated()= UserInfoUpdatedState;
  const factory UpdateProfileState.macroGoalsUpdated()= MacroGoalsUpdatedState;
  const factory UpdateProfileState.macroGoalsAndInputsUpdated()= MacroGoalsAndInputsUpdatedState;
}

