

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/state_event/add_or_update_my_cook_book_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/add_to_my_cook_book_usecase.dart';



class AddOrUpdateMyCookBookBloc extends Bloc<AddOrUpdateMyCookBookEvent, AddOrUpdateMyCookBookState> {

  AddOrUpdateMyCookBookBloc() : super(const AddOrUpdateMyCookBookInitialState()) {

    on<Reset>((event, emit) async {
      emit(const AddOrUpdateMyCookBookState.initial());
    }
    );

    on<AddFoodToMyCookBook>((event, emit) async {
          emit(const AddOrUpdateMyCookBookState.loading());
          final useCase= serviceLocator<AddToMyCookBookUseCase>();
          var result = await useCase.addToMyCookBook(
              event.food,
          );
          result.fold(
                (failure) {
              emit(AddOrUpdateMyCookBookState.error(failure.message));
            },
                (data) {
              emit(AddOrUpdateMyCookBookState.loaded(data));
            },
          );
        }
    );

    on<UpdateMyCookBookFood>((event, emit) async {
      emit(const AddOrUpdateMyCookBookState.loading());
      final useCase= serviceLocator<AddToMyCookBookUseCase>();
      var result = await useCase.updateMyCookBookFood(
        event.food,
      );
      result.fold(
            (failure) {
          emit(AddOrUpdateMyCookBookState.error(failure.message));
        },
            (data) {
          emit(AddOrUpdateMyCookBookState.loaded(data));
        },
      );
    }
    );



    on<AddOrUpdateFoodMyCookBook>((event, emit) async {
      emit(const AddOrUpdateMyCookBookState.loading());
      final useCase= serviceLocator<AddToMyCookBookUseCase>();
      var result = await useCase.addOrUpdateMyCookBookFood(
          event.food,
      );
      result.fold(
            (failure) {
          emit(AddOrUpdateMyCookBookState.error(failure.message));
        },
            (data) {
          emit(AddOrUpdateMyCookBookState.loaded(data));
        },
      );
    }
    );

  }
}