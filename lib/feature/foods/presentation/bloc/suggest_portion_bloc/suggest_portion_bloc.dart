

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/suggest_portion_bloc/state_event/suggest_portion_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/suggest_foods_portions_usecase.dart';

class SuggestPortionsBloc extends Bloc<SuggestFoodsPortionEvent, SuggestFoodsPortionState> {


  SuggestPortionsBloc() : super(const SuggestFoodsPortionInitialState()) {

    on<Reset>((event, emit) async {
      emit(const SuggestFoodsPortionState.initial());
    }
    );

    on<SuggestPortionsEvent>((event, emit) async {
      emit(const SuggestFoodsPortionState.loading());
      final useCase= serviceLocator<SuggestFoodsPortionsUseCase>();
      var result = await useCase.suggestFoodsPortions(
        event.foods,
        event.isMainDishList,
        event.servingsRange,
        event.macroGoalsRange,
        event.restriction,
        event.macroGoalType,
        event.macroPercentage
      );
      result.fold(
            (failure) {
          emit(SuggestFoodsPortionState.error(failure.message));
        },
            (data) {
          emit(SuggestFoodsPortionState.loaded(wizardResponseModel: data));
        },
      );
    }
    );
  }
}