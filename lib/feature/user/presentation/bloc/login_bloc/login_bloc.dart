

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/login_bloc/state_event/login_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/login_usecase.dart';



class LoginBloc extends Bloc<LoginEvent, LoginState>{

  LoginBloc() : super(const LoginInitialState()) {


    on<Reset>((event, emit) async {
      emit(const LoginState.initial());
    }
    );


    /// login with credentials
    on<LoginWithCredentialEvent>(
            (event, emit) async {
          emit(const LoginState.loading());

          final useCase= serviceLocator<LoginUseCase>();
          var result = await useCase.loginWithCredentials(
              event.email, event.password
          );
          result.fold(
                (failure) {
              emit(LoginState.error(failure.message));
            },
                (data) {
              emit(const LoginState.loaded());
            },
          );
        }
    );



    /// login with google
    on<LoginWithGoogleEvent>(
            (event, emit) async {
          emit(const LoginState.loading());

          final useCase= serviceLocator<LoginUseCase>();
          var result = await useCase.loginWithGoogle();
          result.fold(
                (failure) {
              emit(LoginState.error(failure.message));
            },
                (data) {

                if(!data.updateProfileShown){
                  emit(const LoginState.registerWithGoogleLoaded());
                }else{
                  emit(const LoginState.loaded());
                }
            },
          );
        }
    );


  }
}