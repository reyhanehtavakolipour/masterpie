

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import '../../../../util/core/di/service_locator.dart';
import '../../../../util/core/response/failure.dart';
import '../model/user_credentials_model.dart';
import '../repository/user_repository.dart';

class GetUserCredentialsUseCase{

  final repo = serviceLocator<UserRepository>();

  Future<Either<Failure, UserCredentials>> getUserCredentials() async{
    final user = await repo.getUserCredentialsFromHive();
    return Right(user.asRight());
  }

}