

import 'package:dartz/dartz.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import '../../../../../util/core/constant/sqflite_constants.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../../../util/core/helper/sqflite/sqflite_db_helper.dart';
import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/profile_local.dart';
import 'user_local_datasource.dart';


class UserLocalDataSourceImpl extends UserLocalDataSource{

  @override
  Future<Either<Failure, Success>> upsertGuestProfile(ProfileLocal profileLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      final result = await db?.query(
        TABLE_PROFILE,
      );

      if (result == null){
        // If the profile doesn't exist, insert it
        await db?.insert(TABLE_PROFILE, profileLocal.toJson());
      }else if (result.isEmpty) {
        // If the profile doesn't exist, insert it
        await db?.insert(TABLE_PROFILE, profileLocal.toJson());
      }
      else {
        // If the profile exists, update it
        await db?.update(
          TABLE_PROFILE,
          profileLocal.toJson(),
          where: '$ID = ?',
          whereArgs: [profileLocal.id],
        );
      }

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }


  @override
  Future<Either<Failure, Success>> insertUserProfile(ProfileLocal profileLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{

      //user just registered and should set the user id
      await db?.delete(TABLE_PROFILE);
      await db?.insert(TABLE_PROFILE, profileLocal.toJson());
      return const Right(Success());

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, Success>> updateUserProfile(ProfileLocal profileLocal) async{

    final db = await serviceLocator<DatabaseHelper>().db;
    try{

      await db?.update(
        TABLE_PROFILE,
        profileLocal.toJson(),
        where: '$ID = ?',
        whereArgs: [profileLocal.id],
      );
      return const Right(Success());

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, ProfileLocal>> getProfile() async{
    final db = await serviceLocator<DatabaseHelper>().db;
    ProfileLocal profile;
    try{
      final list = await db?.query(
        TABLE_PROFILE,
      );

      if(list == null){
        upsertGuestProfile(emptyProfile());
        return Right(emptyProfile());
      }

      if(list.isEmpty){
        upsertGuestProfile(emptyProfile());
        return Right(emptyProfile());
      }

      profile = ProfileLocal.fromJson(list[0]);

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
    return Right(profile);
  }


  @override
  Future<Either<Failure, Success>> updateDailyMacroGoal(List<String> dailyMacroGoal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{

      await db?.update(
        TABLE_PROFILE,
        {DAILY_MACRO_GOAL: dailyMacroGoal.join(';')},
       );

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateUserInfo(ProfileLocal profile) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.update(
        TABLE_PROFILE,
        {
          FIRST_NAME: profile.firstName,
          LAST_NAME: profile.lastName,
        },
        where: '$ID = ?',
        whereArgs: [profile.id],
      );

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }catch(e){
      return Left(ExceptionFailure(e));
    }

    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateDailyMacroAndInputs(ProfileLocal profile) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.update(
        TABLE_PROFILE,
        {
          DAILY_MACRO_GOAL: profile.dailyMacroGoal.join(';'),
          GENDER: profile.gender,
          AGE: profile.age,
          WEIGHT: profile.weight,
          HEIGHT: profile.height,
          WEIGHT_UNIT: profile.weightUnit,
          HEIGHT_UNIT: profile.heightUnit,
          GOAL_WEIGHT: profile.goalWeight,
          ACTIVITY_LEVEL: profile.activityLevel,
          WEIGHT_CHANGE_WEEKLY: profile.weightChangeWeekly,
        },
      );

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> deleteAllTables() async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.delete(TABLE_PROFILE);
      await db?.delete(TABLE_MY_FOOD);
      await db?.delete(TABLE_MY_COOKBOOK);
      await db?.delete(TABLE_FOOD);
      await db?.delete(TABLE_LOGGED_FOODS);
    }on DatabaseException catch (e) {
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }


}