

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/international_meals_bloc/state_event/international_meals_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/get_international_meals_usecase.dart';



class InternationalMealsBloc extends Bloc<InternationalMealsEvent, InternationalMealsState> {

  InternationalMealsBloc() : super(const InternationalMealsInitialState()) {


    on<Reset>((event, emit) async {
      emit(const InternationalMealsState.initial());
    }
    );

    on<GetInternationalMealsEvent>(
            (event, emit) async {
          emit(const InternationalMealsState.loading());

          ///get immediate response
          final useCase= serviceLocator<GetInternationalMealsUseCase>();
          var immediateResult = await useCase.getImmediateResponse(event.query);
          immediateResult.fold(
                (failure) {
              emit(InternationalMealsState.error(failure.message));
            },
                (data) {
              emit(InternationalMealsState.loaded(foods: data));
            },
          );

            emit(const InternationalMealsState.loading());

            /// get fresh data
            var result = await useCase.getInternationalMeals(
                event.query,
            );
            result.fold(
                  (failure) {
                emit(InternationalMealsState.error(failure.message));
              },
                  (data) {
                emit(InternationalMealsState.loaded(foods: data));
              },
            );
        }
    );
  }


}