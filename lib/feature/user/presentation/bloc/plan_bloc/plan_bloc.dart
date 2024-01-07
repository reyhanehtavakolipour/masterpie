

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/plan_bloc/state_event/plan_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/plan_usecase.dart';



class PlanBloc extends Bloc<PlanEvent, PlanState>{

  PlanBloc() : super(const PlanInitialState()) {


    on<Reset>((event, emit) async {
      emit(const PlanState.initial());
    }
    );


    ///get user plan
    on<GetUserPlanEvent>(
            (event, emit) async {
          emit(const PlanState.loading());

          final useCase= serviceLocator<PlanUseCase>();
          var result = await useCase.getUserPlan();
          result.fold(
                (failure) {
              emit(PlanState.error(failure.message));
            },
                (data) {
              emit(PlanState.loaded(data));
            },
          );
        }
    );



    /// update user plan
    on<UpdateUserPlanEvent>(
            (event, emit) async {
          emit(const PlanState.loading());

          final useCase= serviceLocator<PlanUseCase>();
          var result = await useCase.updateUserPlan(event.plan);
          result.fold(
                (failure) {
              emit(PlanState.error(failure.message));
            },
                (data) {
              emit(const PlanState.updated());
            },
          );
        }
    );


  }
}