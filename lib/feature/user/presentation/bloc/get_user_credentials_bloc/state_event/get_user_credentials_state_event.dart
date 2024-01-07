import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/model/user_credentials_model.dart';
part 'get_user_credentials_state_event.freezed.dart';



@freezed
abstract class GetUserCredentialsEvent with _$GetUserCredentialsEvent {

  const factory GetUserCredentialsEvent.onGetUserCredential() = GetUserCredentials;

}



@freezed
abstract class GetUserCredentialsState with _$GetUserCredentialsState{
  const factory GetUserCredentialsState.initial()= GetUserCredentialsInitialState;
  const factory GetUserCredentialsState.loading()= GetUserCredentialsLoadingState;
  const factory GetUserCredentialsState.error(String message)= GetUserCredentialsErrorState;
  const factory GetUserCredentialsState.loaded(UserCredentials userCredentials)= GetUserCredentialsLoadedState;
}

