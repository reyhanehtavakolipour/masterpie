

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/domain/usecase/meal_plan_usecase.dart';
import 'package:masterpie/feature/foods/presentation/bloc/meal_plan_bloc/state_event/meal_plan_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';


class MealPlanBloc extends Bloc<MealPlanEvent, MealPlanState> {

  MealPlanBloc() : super(const MealPlanInitialState()) {


    on<Reset>((event, emit) async {
      emit(const MealPlanState.initial());
    });


    on<SaveMealPlan>(
            (event, emit) async {
          emit(const MealPlanState.loading());
          final useCase= serviceLocator<MealPlanUseCase>();
          var result = await useCase.saveMealPlan(
              event.mealPlan
          );
          result.fold(
                (failure) {
              emit(MealPlanState.error(failure.message));
            },
                (data) {
              emit(const MealPlanState.loaded());
            },
          );
        }
    );




    on<GetMealPLans>(
            (event, emit) async {
          emit(const MealPlanState.loading());
          final useCase= serviceLocator<MealPlanUseCase>();
          var result = await useCase.getMealPlans();
          result.fold(
                (failure) {
              emit(MealPlanState.error(failure.message));
            },
                (data) {
              emit(MealPlanState.plansLoaded(data));
            },
          );
        }
    );




  }


}