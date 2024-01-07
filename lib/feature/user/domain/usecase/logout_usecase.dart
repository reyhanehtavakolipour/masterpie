

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/helper/error_handling.dart';
import '../../../../util/core/response/failure.dart';
import '../../../../util/core/response/success.dart';
import '../repository/user_repository.dart';

class LogOutUseCase{

  final repo = serviceLocator<UserRepository>();

  Future<Either<Failure, Success>> logout() async{
    final logoutResponseRemote = await repo.logoutInRemote();
    if(logoutResponseRemote.isRight()){
      await repo.logoutInHive();
      await repo.logoutInLocal();
      return const Right(Success());
    }
    return Left(getFailure(logoutResponseRemote.asLeft()));
  }
}