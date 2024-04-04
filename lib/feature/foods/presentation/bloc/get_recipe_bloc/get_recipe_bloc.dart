

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_recipe_bloc/state_event/get_recipe_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/get_recipe_usecase.dart';


class GetRecipeBloc extends Bloc<GetRecipeEvent, GetRecipeState> {

  GetRecipeBloc() : super(const GetRecipeInitialState()) {

    on<Reset>((event, emit) async {
      emit(const GetRecipeState.initial());
    }
    );
    // get food
    on<GetRecipeDetailEvent>(
            (event, emit) async {
              final useCase= serviceLocator<GetRecipeUseCase>();

            emit(const GetRecipeState.loading());

            var result = await useCase.getRecipe(
                event.genericFood,
            );
            result.fold(
                  (failure) {
                emit(GetRecipeState.error(failure.message));
              },
                  (data) {
                emit(GetRecipeState.loaded(food: data));
              },
            );

        }
    );
  }


}