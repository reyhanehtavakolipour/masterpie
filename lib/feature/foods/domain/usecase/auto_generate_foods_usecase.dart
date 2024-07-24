


import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/foods/domain/model/generic_food_model.dart';
import 'package:masterpie/feature/user/domain/model/profile_model.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/response/failure.dart';
import '../model/food_model.dart';
import '../repository/foods_repository.dart';



class AutoGenerateFoodsUseCase{

  final repo = serviceLocator<FoodsRepository>();

  final userRepo = serviceLocator<UserRepository>();


  Future<Either<Failure, List<Food>>> autoGenerateFoods() async{
    final userResponse= await userRepo.getProfileFromLocal();
    final foodsResponse = await repo.autoGenerateFoods(userResponse.isRight() ? userResponse.asRight() : Profile());
    if(foodsResponse.isLeft()){
      return Left(foodsResponse.asLeft());
    }

    return Right(foodsResponse.asRight());
  }


  Future<Either<Failure, Food>> autoGenerateFood(String type) async{
    final userResponse= await userRepo.getProfileFromLocal();
    final foodsResponse = await repo.autoGenerateFood(userResponse.isRight() ? userResponse.asRight() : Profile(), type);
    if(foodsResponse.isLeft()){
      return Left(foodsResponse.asLeft());
    }

    return Right(foodsResponse.asRight());
  }


}