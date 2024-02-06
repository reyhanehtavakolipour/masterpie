import 'package:freezed_annotation/freezed_annotation.dart';
part 'forgot_password_state_event.freezed.dart';



@freezed
abstract class ForgotPasswordEvent with _$ForgotPasswordEvent {

  const factory ForgotPasswordEvent.onForgotPassword(String email) = ForgotPassword;

  const factory ForgotPasswordEvent.onReset() = Reset;

}



@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState{
  const factory ForgotPasswordState.initial()= ForgotPasswordInitialState;
  const factory ForgotPasswordState.loading()= ForgotPasswordLoadingState;
  const factory ForgotPasswordState.error(String message)= ForgotPasswordErrorState;
  const factory ForgotPasswordState.loaded()= ForgotPasswordLoadedState;
}

