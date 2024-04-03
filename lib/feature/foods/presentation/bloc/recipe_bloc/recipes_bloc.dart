

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/domain/usecase/search_recipe_usecase.dart';
import 'package:masterpie/feature/foods/presentation/bloc/recipe_bloc/state_event/recipes_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';


class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {

  RecipesBloc() : super(const RecipesInitialState()) {

    on<Reset>((event, emit) async {
      emit(const RecipesState.initial());
    }
    );
    // get foods
    on<GetRecipesEvent>(
            (event, emit) async {
              final useCase= serviceLocator<RecipesUseCase>();
              if(event.query.isNotEmpty){

            emit(const RecipesState.loading());

            var result = await useCase.getRecipes(
                event.query,
            );
            result.fold(
                  (failure) {
                emit(RecipesState.error(failure.message));
              },
                  (data) {
                emit(RecipesState.loaded(foods: data));
              },
            );
          }
        }
    );
  }


}