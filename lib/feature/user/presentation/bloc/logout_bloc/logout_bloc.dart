

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/logout_bloc/state_event/logout_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/logout_usecase.dart';



class LogoutBloc extends Bloc<LogoutEvent, LogoutState>{

  LogoutBloc() : super(const LogoutInitialState()) {

    on<Reset>((event, emit) async {
      emit(const LogoutState.initial());
    }
    );

    on<LogoutUserEvent>(
            (event, emit) async {
          emit(const LogoutState.loading());

          final useCase= serviceLocator<LogOutUseCase>();
          var result = await useCase.logout();
          result.fold(
                (failure) {
              emit(LogoutState.error(failure.message));
            },
                (data) {
              emit(const LogoutState.loaded());
            },
          );
        }
    );

  }
}