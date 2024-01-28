import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_state_event.freezed.dart';



@freezed
abstract class LoginEvent with _$LoginEvent {

 const factory LoginEvent.onLoginWithCredential(String email, String password) = LoginWithCredentialEvent;

 const factory LoginEvent.onLoginWithGoogle() = LoginWithGoogleEvent;

 const factory LoginEvent.onReset() = Reset;


}



@freezed
abstract class LoginState with _$LoginState{
 const factory LoginState.initial()= LoginInitialState;
 const factory LoginState.loading()= LoginLoadingState;
 const factory LoginState.error(String message)= LoginErrorState;
 const factory LoginState.loaded()= LoginLoadedState;
 const factory LoginState.registerWithGoogleLoaded()= RegisterWithGoogleLoadedState;

}

