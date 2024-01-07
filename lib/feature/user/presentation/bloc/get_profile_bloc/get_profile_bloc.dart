

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_profile_bloc/state_event/get_profile_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/get_profile_usecase.dart';



class GetProfileBloc extends Bloc<GetProfileEvent, GetProfileState> {

  GetProfileBloc() : super(const GetProfileInitialState()) {

    on<Reset>((event, emit) async {
      emit(const GetProfileState.initial());
    }
    );

    on<GetProfile>(
            (event, emit) async {
          emit(const GetProfileState.loading());

          ///get immediate response
          final useCase= serviceLocator<GetProfileUseCase>();
          var immediateResult = await useCase.getImmediateResponse();
          immediateResult.fold(
                (failure) {
              emit(GetProfileState.error(failure.message));
            },
                (data) {
              emit(GetProfileState.loaded(data));
            },
          );
            emit(const GetProfileState.loading());

            /// get fresh data
            var result = await useCase.getProfile();
            result.fold(
                  (failure) {
                emit(GetProfileState.error(failure.message));
              },
                  (data) {
                emit(GetProfileState.loaded(data));
              },
            );

        }
    );
  }


}