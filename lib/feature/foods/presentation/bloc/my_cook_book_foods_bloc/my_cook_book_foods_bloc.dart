



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/my_cook_book_foods_bloc/state_event/my_cook_book_foods_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/get_my_cook_book_foods_usecase.dart';

class MyCookBookFoodsBloc extends Bloc<MyCookBookFoodsEvent, MyCookBookFoodsState> {

  MyCookBookFoodsBloc() : super(const MyCookBookFoodsInitialState()) {

    on<Reset>((event, emit) async {
      emit(const MyCookBookFoodsState.initial());
    }
    );




    on<GetCookBookFoodsImmediately>((event, emit) async {

      final useCase= serviceLocator<GetMyCookBookFoodsUseCase>();

      emit(const MyCookBookFoodsState.loading());

      ///get immediate  response
      var immediateResult = await useCase.getImmediateResponse('');

      immediateResult.fold(
            (failure) {
          emit(MyCookBookFoodsState.error(failure.message));
        },
            (data) {
          emit(MyCookBookFoodsState.loadedImmediately(foods: data));
        },
      );
    }
    );


    on<ImmediateSearchCookBookFoods>((event, emit) async {

      final useCase= serviceLocator<GetMyCookBookFoodsUseCase>();

      emit(const MyCookBookFoodsState.loading());

      ///get immediate search response
      var immediateResult = await useCase.searchFoodLocally(event.food);
      immediateResult.fold(
            (failure) {
          emit(MyCookBookFoodsState.error(failure.message));
        },
            (data) {
          emit(MyCookBookFoodsState.immediateSearchInCookBookLoaded(cookBookId: data));
        },
      );
    }
    );

    on<CookBookFoods>((event, emit) async {

      final useCase= serviceLocator<GetMyCookBookFoodsUseCase>();

      emit(const MyCookBookFoodsState.loading());

      ///get immediate response
      var immediateResult = await useCase.getImmediateResponse(event.query);
      immediateResult.fold(
            (failure) {
          emit(MyCookBookFoodsState.error(failure.message));
        },
            (data) {
          emit(MyCookBookFoodsState.loaded(foods: data));
        },
      );

      emit(const MyCookBookFoodsState.loading());

      var result = await useCase.getMyCookBookFoods(
        event.query
      );
      result.fold(
            (failure) {
          emit(MyCookBookFoodsState.error(failure.message));
        },
            (data) {
          emit(MyCookBookFoodsState.loaded(foods: data));
        },
      );
    }
    );
  }


}