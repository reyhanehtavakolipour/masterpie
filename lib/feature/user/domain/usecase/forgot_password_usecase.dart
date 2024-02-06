

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/response/success.dart';


import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../repository/user_repository.dart';

class ForgotPasswordUseCase{

  final repo = serviceLocator<UserRepository>();

  Future<Either<Failure, Success>> forgotPassword(String email) async{
    final forgotPasswordResponse = await repo.forgotPasswordInRemote(email);
    if(forgotPasswordResponse.isRight()){
      return  Right(forgotPasswordResponse.asRight());
    }

    return Left(getFailure(forgotPasswordResponse.asLeft()));
  }

}