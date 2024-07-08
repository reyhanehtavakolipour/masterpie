

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/domain/usecase/get_fat_secret_foods_info_usecase.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_fat_secret_foods_info_bloc/state_event/get_fat_secret_foods_info_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';



class GetFatSecretFoodsInfoBloc extends Bloc<GetFatSecretFoodsInfoEvent, GetFatSecretFoodsInfoState> {

  GetFatSecretFoodsInfoBloc() : super(const FatSecretFoodInfoInitialState()) {

    on<Reset>((event, emit) async {
      emit(const GetFatSecretFoodsInfoState.initial());
    });

    on<GetFatSecretFoodsInfo>((event, emit) async {
          emit(const GetFatSecretFoodsInfoState.loading());
          final useCase= serviceLocator<GetFatSecretFoodsInfoUseCase>();
          var result = await useCase.getFatSecretFoodsInfo();
          result.fold(
                (failure) {
              emit(GetFatSecretFoodsInfoState.error(failure.message));
            },
                (data) {
              emit(GetFatSecretFoodsInfoState.loaded(data));
            },
          );
        }
    );

  }
}