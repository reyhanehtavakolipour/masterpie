

import 'package:bloc/bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/suggest_food_bloc/state_event/suggest_food_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/suggest_food_usecase.dart';

class SuggestFoodBloc extends Bloc<SuggestFoodEvent, SuggestFoodState> {
  SuggestFoodBloc() : super(const SuggestFoodStateInitialState()) {

    on<Reset>((event, emit) async {
      emit(const SuggestFoodState.initial());
    }
    );

    // suggest food
    on<SuggestMealEvent>(
            (event, emit) async {
          emit(const SuggestFoodState.loading());
          var result = await serviceLocator<SuggestFoodUseCase>().suggestFood(
            event.ingredientsIncluded,
            event.allergies,
            event.nationality,
            event.diet
          );
          result.fold(
                (failure) {
              emit(SuggestFoodState.error(failure.message));
            },
                (data) {
              emit(SuggestFoodState.loaded(food: data));
            },
          );
        }
    );
  }


}