

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_favorite_bloc/state_event/add_or_update_my_favorite_state_event.dart';

import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/add_to_my_favorite_usecase.dart';



class AddOrUpdateMyFavoriteBloc extends Bloc<AddOrUpdateMyFavoriteEvent, AddOrUpdateMyFavoriteState> {

  AddOrUpdateMyFavoriteBloc() : super(const AddOrUpdateMyFavoriteInitialState()) {

    on<Reset>((event, emit) async {
      emit(const AddOrUpdateMyFavoriteState.initial());
    }
    );

    on<AddFoodToMyFavorites>((event, emit) async {
          emit(const AddOrUpdateMyFavoriteState.loading());
          final useCase= serviceLocator<AddToMyFavoriteUseCase>();
          var result = await useCase.addToMyFavorites(
              event.food,
          );
          result.fold(
                (failure) {
              emit(AddOrUpdateMyFavoriteState.error(failure.message));
            },
                (data) {
              emit(AddOrUpdateMyFavoriteState.loaded(data));
            },
          );
        }
    );

    on<UpdateMyFavoriteFood>((event, emit) async {
      emit(const AddOrUpdateMyFavoriteState.loading());
      final useCase= serviceLocator<AddToMyFavoriteUseCase>();
      var result = await useCase.updateMyFavoriteFood(
        event.food,
      );
      result.fold(
            (failure) {
          emit(AddOrUpdateMyFavoriteState.error(failure.message));
        },
            (data) {
          emit(AddOrUpdateMyFavoriteState.loaded(data));
        },
      );
    }
    );



    on<AddOrUpdateFoodMyFavorites>((event, emit) async {
      emit(const AddOrUpdateMyFavoriteState.loading());
      final useCase= serviceLocator<AddToMyFavoriteUseCase>();
      var result = await useCase.addOrUpdateMyFavoriteFood(
          event.food,
      );
      result.fold(
            (failure) {
          emit(AddOrUpdateMyFavoriteState.error(failure.message));
        },
            (data) {
          emit(AddOrUpdateMyFavoriteState.loaded(data));
        },
      );
    }
    );

  }
}