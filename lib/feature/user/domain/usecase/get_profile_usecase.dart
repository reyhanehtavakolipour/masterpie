

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';


import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/profile_model.dart';
import '../repository/user_repository.dart';

class GetProfileUseCase{

  final repo = serviceLocator<UserRepository>();


  Future<Either<Failure, Profile>> getImmediateResponse() async{
    final emailResponse = await repo.getEmailFromHive();
    if(emailResponse.isLeft()){
      return const Left(ExceptionFailure('email not found'));
    }

    if(emailResponse.asRight().isEmpty){
      return const Left(ExceptionFailure('email not found'));
    }


    final profileResponse = await repo.getProfileFromLocal(emailResponse.asRight());
    if(profileResponse.isRight()){
      return Right(profileResponse.asRight());
    }
    return Left(getFailure(profileResponse.asLeft()));
  }

  Future<Either<Failure, Profile>> getProfile() async{
    final emailResponse = await repo.getEmailFromHive();
    final idResponse = await repo.getUserIdFromHive();
    if(emailResponse.isLeft()){
      return const Left(ExceptionFailure('email not found'));
    }
    if(emailResponse.asRight().isEmpty){
      return const Left(ExceptionFailure('email not found'));
    }
    if(idResponse.isLeft()){
      return const Left(ExceptionFailure('user not found'));
    }

    if(idResponse.asRight().isEmpty){
      return Right(Profile(id: ''));
    }

    final profileResponse = await repo.getProfileFromRemote(emailResponse.asRight());
    if(profileResponse.isRight()){
      await repo.upsertProfileInLocal(profileResponse.asRight());
      return  Right(profileResponse.asRight());
    }

    return Left(getFailure(profileResponse.asLeft()));
  }


  Future<Either<Failure, bool>> deleteProfile() async{
    final profileResponse = await repo.deleteProfileInRemote();
    if(profileResponse.isRight()){
      return  Right(profileResponse.asRight());
    }

    return Left(getFailure(profileResponse.asLeft()));
  }

}