



import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/core/constant/subscription_constants.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/google_signin_remote_model.dart';
import '../model/profile_remote.dart';
import '../model/user_subscription_plan_remote_model.dart';
import 'user_remote_datasource.dart';

class UserRemoteDataSourceImpl extends UserRemoteDataSource{



  @override
  Future<Either<Failure, String>> registerUserWithCredential(String email, String password) async{
    try{
      final supabase = Supabase.instance.client;
      final AuthResponse res = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      final Session? session = res.session;
      final User? user = res.user;
      return  Right(user?.id ?? '');

    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }



  @override
  Future<Either<Failure, GoogleSignInRemote>> signInUserWithGoogle() async{
    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: IOS_CLIENT_ID,
      serverClientId: WEB_CLIENT_ID,
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final accessToken = googleAuth?.accessToken;
    final idToken = googleAuth?.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }

    final supabase = Supabase.instance.client;

    final response= await supabase.auth.signInWithIdToken(
      provider: Provider.google,
      idToken: idToken,
      accessToken: accessToken,
    );

    if(response.session == null){
      return const Left(ExceptionFailure('authentication failed'));
    }

    if(response.session!.user.email == null){
      return const Left(ExceptionFailure('authentication failed'));
    }

    return Right(
      GoogleSignInRemote(
        id: response.session!.user.id,
        email: response.session!.user.email!
      )
    );

  }

  @override
  Future<Either<Failure, String>> loginUserWithCredential(String email, String password) async{
    try{
      final supabase = Supabase.instance.client;
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final User? user = res.user;
      return  Right(user?.id ?? '');
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, Success>> upsertProfileAfterRegister(ProfileRemote profileRemote) async{
    try {
      // includes everything including name, email, gender, age, ...
      final supabase = Supabase.instance.client;
      await supabase.from(PROFILE_REMOTE_TABLE).upsert(profileRemoteToJson(profileRemote));
      List<String> dailyMacros= ['0', '0', '0', '0'];
      if(profileRemote.age.isNotEmpty && profileRemote.height.isNotEmpty && profileRemote.weight.isNotEmpty &&
          profileRemote.goalWeight.isNotEmpty && profileRemote.gender.isNotEmpty){
        final dailyMacroResponse= await calculateDailyMacroGoal(profileRemote);
        if(dailyMacroResponse.isRight()){
          dailyMacros= dailyMacroResponse.asRight();
        }
      }
      profileRemote= profileRemote.copyWith(dailyMacroGoal: dailyMacros);
      await updateDailyMacroGoal(profileRemote);

      return const Right(Success());
    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, ProfileRemote>> getProfile(String email, String id) async{
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(PROFILE_REMOTE_TABLE)
          .select<List<dynamic>>()
          .eq('email', email)
          .eq('id', id);

      if(data.isEmpty){
        return Right(ProfileRemote());
      }

      ProfileRemote profileRemote = ProfileRemote(
        email: email,
        id: data[0]['id'],
        firstName: data[0]['firstName'] ?? '',
        lastName: data[0]['lastName'] ?? '',
        weight: data[0]['weight'] ?? '',
        height: data[0]['height'] ?? '',
        weightUnit: data[0]['weightUnit'] ?? '',
        heightUnit: data[0]['heightUnit'] ?? '',
        goalWeight: data[0]['goalWeight'] ?? '',
        activityLevel: data[0]['activityLevel'] ?? '',
        dailyMacroGoal: data[0]['dailyMacroGoal'] == null ? ['', '', '', ''] : (data[0]['dailyMacroGoal'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        age: data[0]['age'] ?? '',
        weightChangeWeekly: data[0]['weightChangeWeekly'] ?? '',
      );

      return Right(profileRemote);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, List<String>>> calculateDailyMacroGoal(ProfileRemote profile) async {
    try{
      final NetworkRequest request = await NetworkRequest.create();


      String weightChangeWeekly = '';
      if(profile.weightUnit == LB_LABEL){
        weightChangeWeekly = LB_1_LABEL;
      }else{
        weightChangeWeekly = GRAM_500_LABEL;
      }
      RegExp regex = RegExp(r'\d+');
      RegExpMatch? match = regex.firstMatch(profile.weightChangeWeekly);
      if (match != null) {
        if(match.group(0) != null){
          weightChangeWeekly = match.group(0)!;
        }
      }

      //body
      Map<String, dynamic> calculateMacroGoalRemoteBody = {
        'age': double.parse(profile.age),
        'gender': profile.gender,
        'weight': double.parse(profile.weight),
        'height': double.parse(profile.height),
        'activityLevel': profile.activityLevel,
        'goalWeight': profile.goalWeight,
        'weightChangeWeekly': double.parse(weightChangeWeekly),
        'weightUnit': profile.weightUnit,
        'heightUnit': profile.heightUnit
      };


      final response= await request.post(CALCULATE_MACRO_GOAL_API, data: calculateMacroGoalRemoteBody);

      if(response.statusCode == SUCCESS_API_CODE){
        List<String> macroGoal = [
          response.data['calorie'].toString(),
          response.data['protein'].toString(),
          response.data['carb'].toString(),
          response.data['fat'].toString(),
        ];
        return  Right(macroGoal);
      }
      return  Left(RemoteFailure(response.statusCode, response.data['message']));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, Success>> updateDailyMacroGoal(ProfileRemote profile) async{
    try{
      final supabase = Supabase.instance.client;

      final updates = {
        'dailyMacroGoal': profile.dailyMacroGoal,
      };

      final data = await supabase
          .from(PROFILE_REMOTE_TABLE)
          .update(updates)
          .eq('id', profile.id);

      return const Right(Success());

    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> updateUserInfo(ProfileRemote profile) async{
    try{
      final supabase = Supabase.instance.client;

      final updates = {
        'firstName': profile.firstName,
        'lastName': profile.lastName,
      };

      final data = await supabase
          .from(PROFILE_REMOTE_TABLE)
          .update(updates)
          .eq('id', profile.id);

      return const Right(Success());

    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> updateDailyMacroAndInputs(ProfileRemote profile) async{
    try{
      final supabase = Supabase.instance.client;

      final updates = {
        'gender': profile.gender,
        'weight': profile.weight,
        'height': profile.height,
        'weightUnit': profile.weightUnit,
        'heightUnit': profile.heightUnit,
        'goalWeight': profile.goalWeight,
        'age': profile.age,
        'activityLevel': profile.activityLevel,
        'weightChangeWeekly': profile.weightChangeWeekly,
        'dailyMacroGoal': profile.dailyMacroGoal,
      };

      final data = await supabase
          .from(PROFILE_REMOTE_TABLE)
          .update(updates)
          .eq('id', profile.id);

      return const Right(Success());

    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> logout() async{
    try{
      final supabase = Supabase.instance.client;
      await supabase.auth.signOut();
      return  const Right(Success());
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, Success>> setUserSubscriptionPlanAfterRegister(String userId) async{
    try{

      final supabase = Supabase.instance.client;

      String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

      final updates = {
        'plan': FREE_PLAN,
        'suggest_food_left_request': FREE_SUGGEST_FOOD_LIMIT,
        'food_portion_left_request': FREE_FOODS_PORTION_REQUEST_LIMIT,
        'favorite_food_left': FREE_FAVORITE_LIMIT,
        'upgrade_date': formattedDate,
        'plan_type': MONTHLY_PLAN,
      };

      final data = await supabase
          .from(SUBSCRIPTION_PLAN_TABLE)
          .update(updates)
          .eq('id', userId);

      return const Right(Success());

    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, UserSubscriptionPlanRemote>> getUserSubscriptionPlan(String userId) async{
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(SUBSCRIPTION_PLAN_TABLE)
          .select<List<dynamic>>()
          .eq('id', userId);


      UserSubscriptionPlanRemote userSubscriptionPlanRemote = UserSubscriptionPlanRemote(
        userId: data[0]['id'],
        plan: data[0]['plan'] ?? '',
        planType: data[0]['plan_type'] ?? '',
        suggestFoodRequestsLeft: data[0]['suggest_food_left_request'] ?? 0,
        foodPortionRequestsLeft: data[0]['food_portion_left_request'] ?? 0,
        favoriteFoodRequestsLeft: data[0]['favorite_food_left'] ?? 0,
        upgradeDate: data[0]['upgrade_date'] ?? '',
      );

      return Right(userSubscriptionPlanRemote);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> updateFavoriteRequestsLeft(String userId, int requestsLeft) async{
    //todo handle
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateFoodsPortionRequestsLeft(String userId, int requestsLeft) async{
    //todo handle
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateSuggestFoodRequestsLeft(String userId, int requestsLeft) async{
    //todo handle
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateSubscriptionPlan(String userId, String plan) async{
    //todo handle
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateSubscriptionPlanAfterLoginIfNeeded(String userId) async{
    //todo handle
    return const Right(Success());
  }




}