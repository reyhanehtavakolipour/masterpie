

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/domain/usecase/auto_generate_foods_usecase.dart';
import 'package:masterpie/feature/foods/presentation/bloc/auto_generate_bloc/state_event/auto_generate_foods_state_event.dart';
import 'package:masterpie/feature/foods/presentation/screen/ui_helper/model_converter.dart';
import '../../../../../util/core/di/service_locator.dart';


class AutoGenerateFoodsBloc extends Bloc<AutoGenerateFoodsEvent, AutoGenerateFoodsState> {

  AutoGenerateFoodsBloc() : super(const AutoGenerateFoodsInitialState()) {

    on<Reset>((event, emit) async {
      emit(const AutoGenerateFoodsState.initial());
    });


    on<AutoGenerateFoodsForDay>(
            (event, emit) async {
              final useCase= serviceLocator<AutoGenerateFoodsUseCase>();

            emit(const AutoGenerateFoodsState.loading());

            var result = await useCase.autoGenerateFoods(event.mainDishType, event.sideDishTypes);
            result.fold(
                  (failure) {
                emit(AutoGenerateFoodsState.error(failure.message));
              },
                  (data) {
                emit(AutoGenerateFoodsState.foodsLoaded(foods: data));
              },
            );

        }
    );

    on<AutoGenerateFood>(
            (event, emit) async {
          final useCase= serviceLocator<AutoGenerateFoodsUseCase>();

          emit(const AutoGenerateFoodsState.loading());

          var result = await useCase.autoGenerateFood(event.type);
          result.fold(
                (failure) {
              emit(AutoGenerateFoodsState.error(failure.message));
            },
                (data) {
              emit(AutoGenerateFoodsState.foodLoaded(food: data, type: event.type, index: event.index, isMainDish: event.isMainDish));
            },
          );

        }
    );
  }


}