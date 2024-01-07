


import 'package:bloc/bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/register_bloc/state_event/register_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/register_usecase.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {


  RegisterBloc() : super(const RegisterInitialState()) {

    on<Reset>((event, emit) async {
      emit(const RegisterState.initial());
    }
    );

    /// register with credentials
    on<RegisterWithCredentialEvent>(
            (event, emit) async {
          emit(const RegisterState.loading());

          final useCase= serviceLocator<RegisterUseCase>();
          var result = await useCase.registerWithCredentials(
            event.email, event.password
          );
          result.fold(
                (failure) {
              emit(RegisterState.error(failure.message));
            },
                (data) {
              emit(RegisterState.loaded(data));
            },
          );
        }
    );



    /// register with google
    on<RegisterWithGoogleEvent>(
            (event, emit) async {
          emit(const RegisterState.loading());

          final useCase= serviceLocator<RegisterUseCase>();
          var result = await useCase.registerWithGoogle();
          result.fold(
                (failure) {
              emit(RegisterState.error(failure.message));
            },
                (data) {
              emit(RegisterState.loaded(data));
            },
          );
        }
    );


  }
}