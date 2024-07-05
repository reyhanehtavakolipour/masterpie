

import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../model/food_model.dart';
import '../repository/foods_repository.dart';

class LogFoodsUseCase{

  final repo = serviceLocator<FoodsRepository>();
  final userRepo = serviceLocator<UserRepository>();


  Future<Either<Failure, Success>> logFoods(List<Food> foods) async{
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    final idResponse = await userRepo.getUserIdFromHive();

    if((idResponse.isRight() ?  idResponse.asRight() : '').isEmpty){
      await repo.saveLoggedFoodsToLocalDb(foods, formattedDate);
      return const Right(Success());
    }

    final foodsResponseLocal = await repo.saveLoggedFoodsToLocalDb(foods, formattedDate);
    await repo.logFoodsInRemote(foodsResponseLocal.asRight());
    return const Right(Success());
  }

}