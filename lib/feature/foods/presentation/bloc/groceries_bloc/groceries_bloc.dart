

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/groceries_bloc/state_event/groceries_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/groceries_usecase.dart';


class GroceriesBloc extends Bloc<GroceriesEvent, GroceriesState> {

  GroceriesBloc() : super(const GroceriesInitialState()) {

    on<Reset>((event, emit) async {
      emit(const GroceriesState.initial());
    }
    );
    // get foods
    on<GetGroceriesEvent>(
            (event, emit) async {
              final useCase= serviceLocator<GroceriesUseCase>();
              if(event.query.isNotEmpty){

            emit(const GroceriesState.loading());

            var result = await useCase.getGroceries(
                event.query,
            );
            result.fold(
                  (failure) {
                emit(GroceriesState.error(failure.message));
              },
                  (data) {
                emit(GroceriesState.loaded(foods: data));
              },
            );
          }
        }
    );
  }


}