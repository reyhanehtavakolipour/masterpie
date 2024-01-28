



import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../model/profile_model.dart';
import '../repository/user_repository.dart';

class RegisterUseCase{

  final repo = serviceLocator<UserRepository>();

  Future<Either<Failure, String>> registerWithCredentials(String email, String password) async{
    final registerResponseRemote = await repo.registerUserWithCredentialInRemote(email, password);
    if(registerResponseRemote.isRight()){
      await repo.saveUserEmailInHive(email);
      await repo.saveUserPasswordInHive(password);
      await repo.saveUserIdInHive(registerResponseRemote.getOrElse(() => ''));
      await repo.setUserSubscriptionPlanAfterRegisterInRemote();
      final loginResponseRemote = await repo.loginUserWithCredentialInRemote(email, password);
      if(loginResponseRemote.isRight()){
        await repo.upsertProfileInLocal(Profile(id: registerResponseRemote.asRight(), email: email));
        return  Right(email);
      }
      return Left(getFailure(const FailureResponse('login failed')));
    }
    if(registerResponseRemote.asLeft().message == 'User already registered'){
      return Left(getFailure(const FailureResponse('User already registered')));
    }
    return Left(getFailure(registerResponseRemote.asLeft()));
  }


  Future<Either<Failure, String>> registerWithGoogle() async{
    final registerResponseRemote = await repo.registerUserWithGoogleInRemote();
    if(registerResponseRemote.isRight()){
      await repo.saveUserIdInHive(registerResponseRemote.asRight().id);
      await repo.saveUserEmailInHive(registerResponseRemote.asRight().email);
      await repo.saveUserPasswordInHive('');
      await repo.setUserSubscriptionPlanAfterRegisterInRemote();
      await repo.upsertProfileInLocal(Profile(id: registerResponseRemote.asRight().id, email: registerResponseRemote.asRight().email));
      return Right(registerResponseRemote.asRight().email);
    }
    return Left(getFailure(registerResponseRemote.asLeft()));
  }

}
