

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/update_profile_bloc/state_evnt/update_profile_state_event.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../domain/usecase/update_profile_usecase.dart';


class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {

  UpdateProfileBloc() : super(const UpdateProfileInitialState()) {

    on<Reset>((event, emit) async {
      emit(const UpdateProfileState.initial());
    }
    );

    on<UpdateProfile>(
            (event, emit) async {
              emit(const UpdateProfileState.loading());
          final useCase= serviceLocator<UpdateProfileUseCase>();
          var result = await useCase.updateProfile(event.email, event.fName, event.lName, event.gender, event.weight,
              event.height, event.weightUnit, event.heightUnit, event.goalWeight, event.age, event.activityLevel, event.weightChangeWeekly,
              event.mainDishTypes, event.sideDishTypes, event.favoriteCategories, event.hateCategories, event.allergens, event.dailyMacroGoal);
          result.fold(
                (failure) {
                  emit(UpdateProfileState.error(failure.message));
            },
                (data) {
              emit(const UpdateProfileState.profileUpdated());
            },
          );

        }
    );



    on<UpdateUserInfo>(
            (event, emit) async {
          emit(const UpdateProfileState.loading());
          final useCase= serviceLocator<UpdateProfileUseCase>();
          var result = await useCase.updateUserInfo(event.firstName, event.lastName);
          result.fold(
                (failure) {
              emit(UpdateProfileState.error(failure.message));
            },
                (data) {
              emit(const UpdateProfileState.userInfoUpdated());
            },
          );

        }
    );




    on<CalculateDailyMacroGoal>(
            (event, emit) async {
          emit(const UpdateProfileState.loading());
          final useCase= serviceLocator<UpdateProfileUseCase>();
          var result = await useCase.calculateDailyMacroGoal(event.gender, event.weight,
              event.height, event.weightUnit, event.heightUnit, event.goalWeight, event.age, event.activityLevel, event.weightChangeWeekly);
          result.fold(
                (failure) {
              emit(UpdateProfileState.error(failure.message));
            },
                (data) {
              emit(UpdateProfileState.macroGoalsCalculated(data));
            },
          );
        }
    );



    on<UpdateMacroGoalsAndInputs>(
            (event, emit) async {
          emit(const UpdateProfileState.loading());
          final useCase= serviceLocator<UpdateProfileUseCase>();
          var result = await useCase.updateMacroGoalsAndInputs(event.gender, event.weight,
              event.height, event.weightUnit, event.heightUnit, event.goalWeight, event.age, event.activityLevel,
            event.weightChangeWeekly, event.calorie, event.protein, event.carb, event.fat);
          result.fold(
                (failure) {
              emit(UpdateProfileState.error(failure.message));
            },
                (data) {
              emit(const UpdateProfileState.macroGoalsAndInputsUpdated());
            },
          );
        }
    );




    on<UpdateDailyMacroGoal>(
            (event, emit) async {
          emit(const UpdateProfileState.loading());
          final useCase= serviceLocator<UpdateProfileUseCase>();
          var result = await useCase.updateDailyMacroGoal(event.calorie, event.protein, event.carb, event.fat);
          result.fold(
                (failure) {
              emit(UpdateProfileState.error(failure.message));
            },
                (data) {
              emit(const UpdateProfileState.macroGoalsUpdated());
            },
          );
        }
    );

  }


}