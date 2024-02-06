

import 'package:dartz/dartz.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/core/constant/sqflite_constants.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../../../util/core/helper/sqflite/sqflite_db_helper.dart';
import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/profile_local.dart';
import 'user_local_datasource.dart';


class UserLocalDataSourceImpl extends UserLocalDataSource{


  @override
  Future<Either<Failure, Success>> upsertProfileAfterRegister(ProfileLocal profileLocal) async{

    final db = await serviceLocator<DatabaseHelper>().db;

    try{
      final result = await db?.query(
        TABLE_PROFILE,
        where: 'id = ?',
        whereArgs: [profileLocal.id],
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
  Future<Either<Failure, ProfileLocal>> getProfile(String email) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    ProfileLocal profile;
    try{
      final list = await db?.query(
        TABLE_PROFILE,
        where: '$EMAIL = ?',
        whereArgs: [email],
      );

      if(list == null){
        return const Left(ExceptionFailure('profile not found'));
      }

      if(list.isEmpty){
        return const Left(ExceptionFailure('profile not found'));
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
  Future<Either<Failure, Success>> updateDailyMacroGoal(ProfileLocal profile) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.update(
        TABLE_PROFILE,
        {DAILY_MACRO_GOAL: profile.dailyMacroGoal},
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
          DAILY_MACRO_GOAL: profile.dailyMacroGoal,
          GENDER: profile.gender,
          AGE: profile.age,
          WEIGHT: profile.weight,
          HEIGHT: profile.height,
          WEIGHT_UNIT: profile.weightUnit,
          HEIGHT_UNIT: profile.heightUnit,
          ACTIVITY_LEVEL: profile.activityLevel,
          WEEKLY_WEIGHT_CHANGE_LABEL: profile.weightChangeWeekly,
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
  Future<Either<Failure, Success>> deleteAllTables() async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.delete(TABLE_PROFILE);
      await db?.delete(TABLE_MY_FOOD);
      await db?.delete(TABLE_FOOD);
      await db?.delete(TABLE_LOGGED_FOODS);
    }on DatabaseException catch (e) {
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }




}