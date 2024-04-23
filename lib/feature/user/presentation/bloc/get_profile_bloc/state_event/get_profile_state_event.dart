import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/profile_model.dart';
part 'get_profile_state_event.freezed.dart';



@freezed
abstract class GetProfileEvent with _$GetProfileEvent {

  const factory GetProfileEvent.onGetProfile() = GetProfile;


  const factory GetProfileEvent.onDeleteProfile() = DeleteProfile;


  const factory GetProfileEvent.onReset() = Reset;

}



@freezed
abstract class GetProfileState with _$GetProfileState{
  const factory GetProfileState.initial()= GetProfileInitialState;
  const factory GetProfileState.loading()= GetProfileLoadingState;
  const factory GetProfileState.userNotFound()= UserNotFoundState;
  const factory GetProfileState.error(String message)= GetProfileErrorState;
  const factory GetProfileState.loaded(Profile profile)= GetProfileLoadedState;
  const factory GetProfileState.profileDeleted(bool isDeleted)= ProfileDeletedState;
}

