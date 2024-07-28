



import 'package:dartz/dartz.dart';

import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/profile_local.dart';

abstract class UserLocalDataSource{

  Future<Either<Failure, Success>> updateUserProfile(ProfileLocal profileLocal);

  Future<Either<Failure, Success>> insertUserProfile(ProfileLocal profileLocal);


  Future<Either<Failure, Success>> upsertGuestProfile(ProfileLocal profileLocal);

  Future<Either<Failure, ProfileLocal>> getProfile();


  Future<Either<Failure, Success>> updateUserInfo(ProfileLocal profile);


  Future<Either<Failure, Success>> updateDailyMacroGoal(List<String> dailyMacroGoal);


  Future<Either<Failure, Success>> updateDailyMacroAndInputs(ProfileLocal profile);

  Future<Either<Failure, Success>> deleteAllTables();

  Future<Either<Failure, Success>> deleteProfileTable();


}