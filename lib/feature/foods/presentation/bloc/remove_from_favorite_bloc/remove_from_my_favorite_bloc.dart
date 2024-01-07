

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/remove_from_favorite_bloc/state_event/remove_from_favorite_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/remove_from_my_favorite_usecase.dart';



class RemoveFromMyFavoriteBloc extends Bloc<RemoveFromMyFavoriteEvent, RemoveFromMyFavoriteState> {


  RemoveFromMyFavoriteBloc() : super(const RemoveFromMyFavoriteInitialState()) {

    on<Reset>((event, emit) async {
      emit(const RemoveFromMyFavoriteState.initial());
    });

    on<RemoveFoodFromMyFavorites>((event, emit) async {
          emit(const RemoveFromMyFavoriteState.loading());
          final useCase= serviceLocator<RemoveFromMyFavoriteUseCase>();
          var result = await useCase.removeFromMyFavorites(
              event.food,
          );
          result.fold(
                (failure) {
              emit(RemoveFromMyFavoriteState.error(failure.message));
            },
                (data) {
              emit(RemoveFromMyFavoriteState.loaded(data));
            },
          );
        }
    );
  }
}