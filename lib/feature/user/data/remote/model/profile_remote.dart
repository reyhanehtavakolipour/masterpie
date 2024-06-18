import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_remote.freezed.dart';


@freezed
class ProfileRemote with _$ProfileRemote{

  factory ProfileRemote({
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
  })= _ProfileRemote;

}


Map<String, dynamic> profileRemoteToJson(ProfileRemote profileRemote) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['email'] = profileRemote.email;
  data['firstName'] = profileRemote.firstName;
  data['lastName'] = profileRemote.lastName;
  data['gender'] = profileRemote.gender;
  data['weight'] = profileRemote.weight;
  data['height'] = profileRemote.height;
  data['weightUnit'] = profileRemote.weightUnit;
  data['heightUnit'] = profileRemote.heightUnit;
  data['goalWeight'] = profileRemote.goalWeight;
  data['age'] = profileRemote.age;
  data['dailyMacroGoal'] = profileRemote.dailyMacroGoal;
  data['activityLevel'] = profileRemote.activityLevel;
  data['weightChangeWeekly'] = profileRemote.weightChangeWeekly;
  data['update_profile_shown'] = profileRemote.updateProfileShown;
  return data;
}