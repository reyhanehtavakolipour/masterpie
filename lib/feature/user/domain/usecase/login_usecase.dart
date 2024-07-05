

import 'package:dartz/dartz.dart';
import 'package:masterpie/feature/user/domain/model/google_signin_response_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../model/profile_model.dart';
import '../repository/user_repository.dart';

class LoginUseCase{

  final repo = serviceLocator<UserRepository>();

  Future<Either<Failure, Success>> loginWithCredentials(String email, String password) async{
    final loginResponseRemote = await repo.loginUserWithCredentialInRemote(email, password);
    if(loginResponseRemote.isRight()){
      await repo.saveUserIdInHive(loginResponseRemote.getOrElse(() => ''));
      await repo.saveUserEmailInHive(email);
      await repo.saveUserPasswordInHive(password);
      return const Right(Success());
    }
    return Left(getFailure(loginResponseRemote.asLeft()));
  }


  Future<Either<Failure, GoogleSignInResponse>> loginWithGoogle() async{
    final loginResponseRemote = await repo.loginUserWithGoogleInRemote();
    if(loginResponseRemote.isRight()){
      await repo.saveUserIdInHive(loginResponseRemote.asRight().id);
      await repo.saveUserEmailInHive(loginResponseRemote.asRight().email);
      await repo.saveUserPasswordInHive('');

      final profileResponse = await repo.getProfileFromLocal();
      if(profileResponse.isLeft()){
        if(profileResponse.asLeft().message == 'profile not found'){
          await repo.setUserSubscriptionPlanAfterRegisterInRemote();
          await repo.updateProfileInLocal(Profile(id: loginResponseRemote.asRight().id, email: loginResponseRemote.asRight().email));
        }
      }

      return Right(loginResponseRemote.asRight());
    }
    return Left(getFailure(loginResponseRemote.asLeft()));
  }

}