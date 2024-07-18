

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/domain/usecase/auto_generate_foods_usecase.dart';
import 'package:masterpie/feature/foods/presentation/bloc/auto_generate_bloc/state_event/auto_generate_foods_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';


class AutoGenerateFoodsBloc extends Bloc<AutoGenerateFoodsEvent, AutoGenerateFoodsState> {

  AutoGenerateFoodsBloc() : super(const AutoGenerateFoodsInitialState()) {

    on<Reset>((event, emit) async {
      emit(const AutoGenerateFoodsState.initial());
    });


    on<AutoGenerateFoods>(
            (event, emit) async {
              final useCase= serviceLocator<AutoGenerateFoodsUseCase>();

            emit(const AutoGenerateFoodsState.loading());

            var result = await useCase.autoGenerateFoods();
            result.fold(
                  (failure) {
                emit(AutoGenerateFoodsState.error(failure.message));
              },
                  (data) {
                emit(AutoGenerateFoodsState.loaded(foods: data));
              },
            );

        }
    );
  }


}