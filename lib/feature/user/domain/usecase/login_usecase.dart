

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../repository/user_repository.dart';

class LoginUseCase{

  final repo = serviceLocator<UserRepository>();

  Future<Either<Failure, Success>> loginWithCredentials(String email, String password) async{
    final loginResponseRemote = await repo.loginUserWithCredentialInRemote(email, password);
    if(loginResponseRemote.isRight()){
      await repo.saveUserIdInHive(loginResponseRemote.getOrElse(() => ''));
      await repo.saveUserEmailInHive(email);
      await repo.saveUserPasswordInHive(password);
      await repo.updateSubscriptionPlanAfterLoginIfNeededInRemote();
      return const Right(Success());
    }
    return Left(getFailure(loginResponseRemote.asLeft()));
  }


  Future<Either<Failure, Success>> loginWithGoogle() async{
    final loginResponseRemote = await repo.loginUserWithGoogleInRemote();
    if(loginResponseRemote.isRight()){
      await repo.saveUserIdInHive(loginResponseRemote.asRight().id);
      await repo.saveUserEmailInHive(loginResponseRemote.asRight().email);
      await repo.saveUserPasswordInHive('');
      await repo.updateSubscriptionPlanAfterLoginIfNeededInRemote();
      return const Right(Success());
    }
    return Left(getFailure(loginResponseRemote.asLeft()));
  }

}