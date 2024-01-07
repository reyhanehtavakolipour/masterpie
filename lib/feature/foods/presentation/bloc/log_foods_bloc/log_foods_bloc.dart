

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/log_foods_bloc/state_event/log_foods_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/log_foods_usecase.dart';


class LogFoodsBloc extends Bloc<LogFoodsEvent, LogFoodsState> {

  LogFoodsBloc() : super(const LogFoodsInitialState()) {


    on<Reset>((event, emit) async {
      emit(const LogFoodsState.initial());
    }
    );

    on<LogAllFoodsEvent>(
            (event, emit) async {
          emit(const LogFoodsState.loading());
          final useCase= serviceLocator<LogFoodsUseCase>();
          var result = await useCase.logFoods(
            event.foods
          );
          result.fold(
                (failure) {
              emit(LogFoodsState.error(failure.message));
            },
                (data) {
              emit(const LogFoodsState.loaded());
            },
          );
        }
    );
  }


}