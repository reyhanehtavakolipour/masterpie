

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';


import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/profile_model.dart';
import '../repository/user_repository.dart';

class GetProfileUseCase{

  final repo = serviceLocator<UserRepository>();


  Future<Either<Failure, Profile>> getLocalResponseForGuestUser() async{
    final profileResponse = await repo.getProfileFromLocal();
    if(profileResponse.isRight()){
      return Right(profileResponse.asRight());
    }
    return Left(getFailure(profileResponse.asLeft()));
  }

  Future<Either<Failure, Profile>> getProfile() async{
    final emailResponse = await repo.getEmailFromHive();
    final idResponse = await repo.getUserIdFromHive();

    if(idResponse.isLeft()){
      return await getLocalResponseForGuestUser();
    }

    if(idResponse.asRight().isEmpty || emailResponse.isLeft()){
      return await getLocalResponseForGuestUser();
    }


    if(emailResponse.asRight().isEmpty){
      return await getLocalResponseForGuestUser();
    }

    final profileResponse = await repo.getProfileFromRemote(emailResponse.asRight());
    if(profileResponse.isRight()){
      await repo.updateProfileInLocal(profileResponse.asRight());
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