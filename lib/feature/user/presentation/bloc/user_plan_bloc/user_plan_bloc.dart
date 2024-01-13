

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/user_plan_bloc/state_event/plan_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/user_plan_usecase.dart';



class UserPlanBloc extends Bloc<UserPlanEvent, UserPlanState>{

  UserPlanBloc() : super(const UserPlanInitialState()) {


    on<Reset>((event, emit) async {
      emit(const UserPlanState.initial());
    }
    );


    ///get user plan
    on<GetUserPlanEvent>(
            (event, emit) async {
          emit(const UserPlanState.loading());

          final useCase= serviceLocator<UserPlanUseCase>();
          var result = await useCase.getUserPlan();
          result.fold(
                (failure) {
              emit(UserPlanState.error(failure.message));
            },
                (data) {
              emit(UserPlanState.loaded(data));
            },
          );
        }
    );



    /// update user plan
    on<UpdateUserPlanEvent>(
            (event, emit) async {
          emit(const UserPlanState.loading());

          final useCase= serviceLocator<UserPlanUseCase>();
          var result = await useCase.updateUserPlan(event.plan);
          result.fold(
                (failure) {
              emit(UserPlanState.error(failure.message));
            },
                (data) {
              emit(const UserPlanState.updated());
            },
          );
        }
    );


  }
}