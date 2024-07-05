

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_logged_foods_bloc/state_event/get_logged_foods_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/get_logged_foods_usecase.dart';


class GetLoggedFoodsBloc extends Bloc<GetLoggedFoodsEvent, GetLoggedFoodsState> {

  GetLoggedFoodsBloc() : super(const GetLoggedFoodsInitialState()) {

    on<Reset>((event, emit) async {
      emit(const GetLoggedFoodsState.initial());
    }
    );


    /// immediate
    on<GetImmediateLoggedFoodsEvent>(
            (event, emit) async {
          emit(const GetLoggedFoodsState.loading());
          final useCase= serviceLocator<GetLoggedFoodsUseCase>();
          var immediateResult = await useCase.getImmediateResponse(event.date);
          immediateResult.fold(
                (failure) {
              emit(GetLoggedFoodsState.error(failure.message));
            },
                (data) {
              emit(GetLoggedFoodsState.loadedImmediateResponse(loggedFoods: data));
            },
          );
        }
      );


    on<GetAllLoggedFoodsEvent>(
            (event, emit) async {
          emit(const GetLoggedFoodsState.loading());
           final useCase= serviceLocator<GetLoggedFoodsUseCase>();
            var result = await useCase.getLoggedFoods(
                event.date,
            );
            result.fold(
                  (failure) {
                emit(GetLoggedFoodsState.error(failure.message));
              },
                  (data) {
                emit(GetLoggedFoodsState.loaded(loggedFoods: data));
              },
            );
        }
    );
  }


}