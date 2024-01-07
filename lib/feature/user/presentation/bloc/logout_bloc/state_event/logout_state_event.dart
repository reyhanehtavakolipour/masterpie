import 'package:freezed_annotation/freezed_annotation.dart';
part 'logout_state_event.freezed.dart';



@freezed
abstract class LogoutEvent with _$LogoutEvent {

 const factory LogoutEvent.onLogOut() = LogoutUserEvent;

 const factory LogoutEvent.onReset() = Reset;


}



@freezed
abstract class LogoutState with _$LogoutState{
 const factory LogoutState.initial()= LogoutInitialState;
 const factory LogoutState.loading()= LogoutLoadingState;
 const factory LogoutState.error(String message)= LogoutErrorState;
 const factory LogoutState.loaded()= LogoutLoadedState;
}

