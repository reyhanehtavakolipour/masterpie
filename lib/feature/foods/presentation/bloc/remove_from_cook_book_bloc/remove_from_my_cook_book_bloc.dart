

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/remove_from_cook_book_bloc/state_event/remove_from_cook_book_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/remove_from_my_cook_book_usecase.dart';



class RemoveFromMyCookBookBloc extends Bloc<RemoveFromMyCookBookEvent, RemoveFromMyCookBookState> {


  RemoveFromMyCookBookBloc() : super(const RemoveFromMyCookBookInitialState()) {

    on<Reset>((event, emit) async {
      emit(const RemoveFromMyCookBookState.initial());
    });

    on<RemoveFoodFromMyCookBook>((event, emit) async {
          emit(const RemoveFromMyCookBookState.loading());
          final useCase= serviceLocator<RemoveFromMyCookBookUseCase>();
          var result = await useCase.removeFromMyCookBook(
              event.food,
          );
          result.fold(
                (failure) {
              emit(RemoveFromMyCookBookState.error(failure.message));
            },
                (data) {
              emit(RemoveFromMyCookBookState.loaded(data));
            },
          );
        }
    );
  }
}