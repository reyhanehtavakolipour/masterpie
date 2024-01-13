

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/domain/usecase/subscriptions_usecase.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_subscription_plans_bloc/state_event/subscription_plans_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';



class GetSubscriptionPlansBloc extends Bloc<SubscriptionPlanEvent, SubscriptionPlansState>{

  GetSubscriptionPlansBloc() : super(const SubscriptionPlansInitialState()) {


    on<Reset>((event, emit) async {
      emit(const SubscriptionPlansState.initial());
    }
    );


    on<GetAllPlansEvent>(
            (event, emit) async {
          emit(const SubscriptionPlansState.loading());

          final useCase= serviceLocator<SubscriptionPlansUseCase>();
          var result = await useCase.getSubscriptionPlans();
          result.fold(
                (failure) {
              emit(SubscriptionPlansState.error(failure.message));
            },
                (data) {
              emit(SubscriptionPlansState.loaded(data));
            },
          );
        }
    );


  }
}