

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/domain/usecase/forgot_password_usecase.dart';
import 'package:masterpie/feature/user/presentation/bloc/forgot_password_bloc/state_event/forgot_password_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';



class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {

  ForgotPasswordBloc() : super(const ForgotPasswordInitialState()) {

    on<Reset>((event, emit) async {
      emit(const ForgotPasswordState.initial());
    }
    );

    on<ForgotPassword>(
            (event, emit) async {
          final useCase= serviceLocator<ForgotPasswordUseCase>();
          emit(const ForgotPasswordState.loading());
          var result = await useCase.forgotPassword(event.email);
          result.fold(
                (failure) {
              emit(ForgotPasswordState.error(failure.message));
            },
                (data) {
              emit(const ForgotPasswordState.loaded());
            },
          );
        }
    );
  }


}