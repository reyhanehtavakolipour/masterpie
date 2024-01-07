

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_user_credentials_bloc/state_event/get_user_credentials_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/get_user_credentials_usecase.dart';




class GetUserCredentialsBloc extends Bloc<GetUserCredentialsEvent, GetUserCredentialsState> {

  GetUserCredentialsBloc() : super(const GetUserCredentialsInitialState()) {

    on<GetUserCredentials>(
            (event, emit) async {
          emit(const GetUserCredentialsState.loading());
          final useCase= serviceLocator<GetUserCredentialsUseCase>();
          var result = await useCase.getUserCredentials();
          result.fold(
                (failure) {
              emit(GetUserCredentialsState.error(failure.message));
            },
                (data) {
              emit(GetUserCredentialsState.loaded(data));
            },
          );

        }
    );
  }


}