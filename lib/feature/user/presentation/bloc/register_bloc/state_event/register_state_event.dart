import 'package:freezed_annotation/freezed_annotation.dart';
part 'register_state_event.freezed.dart';



@freezed
abstract class RegisterEvent with _$RegisterEvent {

  const factory RegisterEvent.onRegisterWithCredential(String email, String password) = RegisterWithCredentialEvent;

  const factory RegisterEvent.onRegisterWithGoogle() = RegisterWithGoogleEvent;

  const factory RegisterEvent.onReset() = Reset;


}



@freezed
abstract class RegisterState with _$RegisterState{
  const factory RegisterState.initial()= RegisterInitialState;
  const factory RegisterState.loading()= RegisterLoadingState;
  const factory RegisterState.error(String message)= RegisterErrorState;
  const factory RegisterState.loaded(String email)= RegisterLoadedState;
}

