



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/my_favorite_foods/state_event/my_favorite_foods_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/get_my_favorite_foods_usecase.dart';

class MyFavoriteFoodsBloc extends Bloc<MyFavoriteFoodsEvent, MyFavoriteFoodsState> {

  MyFavoriteFoodsBloc() : super(const MyFavoriteFoodsInitialState()) {

    on<Reset>((event, emit) async {
      emit(const MyFavoriteFoodsState.initial());
    }
    );

    on<ImmediateSearchFavoriteFoods>((event, emit) async {

      final useCase= serviceLocator<GetMyFavoriteFoodsUseCase>();

      emit(const MyFavoriteFoodsState.loading());

      ///get immediate search response
      var immediateResult = await useCase.searchFoodLocally(event.food);
      immediateResult.fold(
            (failure) {
          emit(MyFavoriteFoodsState.error(failure.message));
        },
            (data) {
          emit(MyFavoriteFoodsState.immediateSearchInFavoritesLoaded(favoriteId: data));
        },
      );
    }
    );

    on<FavoriteFoods>((event, emit) async {

      final useCase= serviceLocator<GetMyFavoriteFoodsUseCase>();

      emit(const MyFavoriteFoodsState.loading());

      ///get immediate response
      var immediateResult = await useCase.getImmediateResponse(event.foodType, event.query);
      immediateResult.fold(
            (failure) {
          emit(MyFavoriteFoodsState.error(failure.message));
        },
            (data) {
          emit(MyFavoriteFoodsState.loaded(foods: data));
        },
      );

      emit(const MyFavoriteFoodsState.loading());

      var result = await useCase.getMyFavoriteFoods(
        event.foodType,
        event.query
      );
      result.fold(
            (failure) {
          emit(MyFavoriteFoodsState.error(failure.message));
        },
            (data) {
          emit(MyFavoriteFoodsState.loaded(foods: data));
        },
      );
    }
    );
  }


}