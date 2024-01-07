



import 'package:dartz/dartz.dart';

import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/profile_local.dart';

abstract class UserLocalDataSource{

  Future<Either<Failure, Success>> upsertProfileAfterRegister(ProfileLocal profileLocal);

  Future<Either<Failure, ProfileLocal>> getProfile(String email);


  Future<Either<Failure, Success>> updateUserInfo(ProfileLocal profile);


  Future<Either<Failure, Success>> updateDailyMacroGoal(ProfileLocal profile);


  Future<Either<Failure, Success>> updateDailyMacroAndInputs(ProfileLocal profile);

  Future<Either<Failure, Success>> deleteAllTables();

}