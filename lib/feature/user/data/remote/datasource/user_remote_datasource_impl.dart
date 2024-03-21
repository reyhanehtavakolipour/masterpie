
import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masterpie/feature/user/data/remote/model/subscription_plan_remote_model.dart';
import 'package:masterpie/feature/user/data/remote/model/user_plan_remote_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/google_signin_remote_model.dart';
import '../model/profile_remote.dart';
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

    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }



  @override
  Future<Either<Failure, GoogleSignInRemote>> signInUserWithGoogle() async{

    final webClientId= await FlutterConfig.get(WEB_CLIENT_ID);
    final iosClientId= await FlutterConfig.get(IOS_CLIENT_ID);


    final GoogleSignIn googleSignIn = GoogleSignIn(
      clientId: iosClientId,
      serverClientId: webClientId,
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
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
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
  Future<Either<Failure, ProfileRemote>> getProfile(String email) async{
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(PROFILE_REMOTE_TABLE)
          .select<List<dynamic>>()
          .eq('email', email);

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
        gender: data[0]['gender'],
        weightUnit: data[0]['weightUnit'] ?? '',
        heightUnit: data[0]['heightUnit'] ?? '',
        goalWeight: data[0]['goalWeight'] ?? '',
        activityLevel: data[0]['activityLevel'] ?? '',
        dailyMacroGoal: data[0]['dailyMacroGoal'] == null ? ['', '', '', ''] : (data[0]['dailyMacroGoal'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        age: data[0]['age'] ?? '',
        weightChangeWeekly: data[0]['weightChangeWeekly'] ?? '',
        updateProfileShown: data[0]['update_profile_shown'] ?? false
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


      final macroGoalApi= await FlutterConfig.get(CALCULATE_MACRO_GOAL_API);

      final response= await request.post(macroGoalApi, data: calculateMacroGoalRemoteBody);

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

      int timestamp = DateTime.now().millisecondsSinceEpoch;

      final subscriptions = await getSubscriptionPlans();
      if(subscriptions.isRight()){
        
        final freeSubscription = subscriptions.asRight().firstWhere((element) => element.plan == FREE_LABEL);

        final updates = {
          'plan_name': freeSubscription.plan,
          'suggest_food_left_request': freeSubscription.suggestFoodRequestsLimit,
          'food_portion_left_request': freeSubscription.foodPortionRequestsLimit,
          'favorite_food_left': freeSubscription.favoriteFoodLimit,
          'cook_book_left': freeSubscription.cookBookFoodLimit,
          'plan_updated_at': timestamp.toString(),
          'plan_interval': freeSubscription.intervals[0],
          'macro_edition': false,
        };


        final data = await supabase
            .from(USER_PLAN_TABLE)
            .update(updates)
            .eq('id', userId);

        return const Right(Success());
      }
      return const Left(FailureResponse(''));
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }


  @override
  Future<Either<Failure, Success>> updateFavoriteRequestsLeft(String userId, int requestsLeft) async{
    try{
      final supabase = Supabase.instance.client;
      final updates = {
        'favorite_food_left': requestsLeft,
      };
      final data = await supabase
          .from(USER_PLAN_TABLE)
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
  Future<Either<Failure, Success>> updateFoodsPortionRequestsLeft(String userId, int requestsLeft) async{
    try{
      final supabase = Supabase.instance.client;
      final updates = {
        'food_portion_left_request': requestsLeft,
      };

      final data = await supabase
          .from(USER_PLAN_TABLE)
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
  Future<Either<Failure, Success>> updateSuggestFoodRequestsLeft(String userId, int requestsLeft) async{
    try{
      final supabase = Supabase.instance.client;
      final updates = {
        'suggest_food_left_request': requestsLeft,
      };

      final data = await supabase
          .from(USER_PLAN_TABLE)
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
  Future<Either<Failure, Success>> updateSubscriptionPlan(String userId, String plan) async{
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> checkSubscription(String userId) async{
    try{
      final supabase = Supabase.instance.client;
      final userPlan = await supabase
          .from(USER_PLAN_TABLE)
          .select<List<Map<String, dynamic>>>()
          .eq('id', userId);

      if(userPlan.isNotEmpty){

        if(userPlan[0]['current_period_end'] == null){
          return const Right(Success());
        }

        int currentTime = DateTime.now().millisecondsSinceEpoch;

        DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(currentTime);
        DateTime currentPeriodEnd = DateTime.fromMillisecondsSinceEpoch(int.parse(userPlan[0]['current_period_end']) * 1000);
        DateTime yearlyNextRequestUpdate = DateTime.fromMillisecondsSinceEpoch(int.parse(userPlan[0]['yearly_next_requests_update_date'] ?? '0') * 1000);

        final subscriptions = await getSubscriptionPlans();


        if (currentDate.isAfter(currentPeriodEnd) && (userPlan[0]['cancel_at_period_end'] ?? true) && userPlan[0]['plan_name'] != FREE_LABEL) {

          int favoriteLeft = 0;
          int cookBookLeft = 0;
          int suggestFoodLeft = 0;
          int foodPortionLeft = 0;

          if(subscriptions.isRight()){

            final freeSubscription = subscriptions.asRight().firstWhere((element) => element.plan == FREE_LABEL);
            suggestFoodLeft = freeSubscription.suggestFoodRequestsLimit;
            foodPortionLeft = freeSubscription.foodPortionRequestsLimit;

            if(userPlan[0]['favorites_created_count'] >= freeSubscription.favoriteFoodLimit){
              favoriteLeft = 0;
            }else{
              favoriteLeft = freeSubscription.favoriteFoodLimit - ((userPlan[0]['favorites_created_count'] ?? 0) as int);
            }

            if(userPlan[0]['cook_book_created_count'] >= freeSubscription.cookBookFoodLimit){
              cookBookLeft = 0;
            }else{
              cookBookLeft = freeSubscription.cookBookFoodLimit - ((userPlan[0]['cook_book_created_count'] ?? 0) as int);
            }
          }

          final updates = {
            'plan_name': FREE_LABEL,
            'suggest_food_left_request' : suggestFoodLeft,
            'food_portion_left_request' : foodPortionLeft,
            'favorite_food_left' :  favoriteLeft,
            'cook_book_left': cookBookLeft,
            'macro_edition' : false
          };

          final data = await supabase
              .from(USER_PLAN_TABLE)
              .update(updates)
              .eq('id', userId);

        }else if(currentDate.isAfter(yearlyNextRequestUpdate) && userPlan[0]['plan_interval'] == 'yearly'){

          int suggestFoodLeft = 0;
          int foodPortionLeft = 0;

          if(subscriptions.isRight()){

            final yearlySubscription = subscriptions.asRight().firstWhere((element) => element.plan == userPlan[0]['plan_name']);
            suggestFoodLeft = yearlySubscription.suggestFoodRequestsLimit;
            foodPortionLeft = yearlySubscription.foodPortionRequestsLimit;

            String nextRequestUpdateDate = calculateNextDate(yearlyNextRequestUpdate, 1, 'month').millisecondsSinceEpoch.toString();

            final updates = {
              'suggest_food_left_request' : suggestFoodLeft,
              'food_portion_left_request' : foodPortionLeft,
              'favorite_food_left' :  10000,
              'cook_book_left' : 10000,
              'yearly_next_requests_update_date' : nextRequestUpdateDate,
              'macro_edition' : true
            };

            final data = await supabase
                .from(USER_PLAN_TABLE)
                .update(updates)
                .eq('id', userId);

          }
        }
      }

    }catch(e){
      return const Left(FailureResponse(''));
    }
    return const Right(Success());
  }


  DateTime calculateNextDate(DateTime inputDate, int interval, String intervalType) {
    if (interval <= 0) {
      return DateTime.now();
    }
    DateTime resultDate;

    switch (intervalType) {
      case 'month':
        resultDate = DateTime.utc(
          inputDate.year,
          inputDate.month + interval,
          inputDate.day,
          inputDate.hour,
          inputDate.minute,
          inputDate.second,
          inputDate.millisecond,
          inputDate.microsecond,
        );
        break;
      case 'year':
        resultDate = DateTime.utc(
          inputDate.year + interval,
          inputDate.month,
          inputDate.day,
          inputDate.hour,
          inputDate.minute,
          inputDate.second,
          inputDate.millisecond,
          inputDate.microsecond,
        );
        break;
      default:
        return DateTime.now();
    }

    while (resultDate.month != (inputDate.month + interval) % 12) {
      resultDate = resultDate.subtract(const Duration(days: 1));
    }

    if (inputDate.month == 2 && inputDate.day == 29 && !isLeapYear(resultDate.year)) {
      resultDate = DateTime.utc(resultDate.year, 2, 28);
    }

    return resultDate;
  }

  bool isLeapYear(int year) {
    if (year % 4 != 0) {
      return false;
    } else if (year % 100 != 0) {
      return true;
    } else if (year % 400 != 0) {
      return false;
    } else {
      return true;
    }
  }


  @override
  Future<Either<Failure, List<SubscriptionPlanRemote>>> getSubscriptionPlans() async{
    try {
      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(PLANS_TABLE)
          .select<List<Map<String, dynamic>>>();

      List<SubscriptionPlanRemote> subscriptionPlans= [];
      data.forEach((element) {
        final plan= SubscriptionPlanRemote(
          plan: element['plan_name'] ?? '',
          prices: [double.parse((element['price'] ?? '0').toString())],
          intervals: [element['interval'] ?? ''],
          ids: [element['plan_id'] ?? ''],
          macroEdition: element['macro_edition'] ?? false,
          favoriteFoodLimit: element['favorite_food_limit'] ?? 0,
          cookBookFoodLimit: element['cook_book_limit'] ?? 0,
          suggestFoodRequestsLimit: element['suggest_food_limit'] ?? 0,
          foodPortionRequestsLimit: element['food_portion_limit'] ?? 0
        );
        subscriptionPlans.add(plan);
      });



      return Right(subscriptionPlans);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, UserPlanRemote>> getUserPlan(String userId) async{
    try {

      final supabase = Supabase.instance.client;
      final data = await supabase
          .from(USER_PLAN_TABLE)
          .select<List<dynamic>>()
          .eq('id', userId);


      UserPlanRemote userSubscriptionPlanRemote = UserPlanRemote(
        id: data[0]['id'],
        subscriptionPlan: SubscriptionPlanRemote(
          ids: [userId],
          plan: data[0]['plan_name'] ?? FREE_LABEL,
          intervals: [data[0]['plan_interval'] ?? ''],
          macroEdition: data[0]['macro_edition'] ?? false
        ),
        customerId: data[0]['customer_id'] ?? '',
        interval: data[0]['plan_interval'] ?? '',
        cancelReason: data[0]['cancel_reason'] ?? '',
        cancelAtPeriodEnd: data[0]['cancel_at_period_end'] ?? true,
        endsAt: data[0]['current_period_end'] ?? '',
        updatedAt: data[0]['plan_updated_at'] ?? '',
        macroEdition: data[0]['macro_edition'] ?? false,
        subscriptionId: data[0]['subscription_id'] ?? '',
        suggestFoodRequestsLeft: data[0]['suggest_food_left_request'] ?? 0,
        foodPortionRequestsLeft: data[0]['food_portion_left_request'] ?? 0,
        favoriteFoodLeft: data[0]['favorite_food_left'] ?? 0,
        favoriteFoodsCreatedCount: data[0]['favorites_created_count'] ?? 0,
        cookBookFoodLeft: data[0]['cook_book_left'] ?? 0,
        cookBookFoodsCreatedCount: data[0]['cook_book_created_count'] ?? 0
      );

      return Right(userSubscriptionPlanRemote);

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> forgotPassword(String email) async{
    try {
      final supabase = Supabase.instance.client;
      await supabase.auth.resetPasswordForEmail(email,
        redirectTo: RESET_PASSWORD_URL,
      );
      return const Right(Success());

    } on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

  @override
  Future<Either<Failure, Success>> updateFavoritesCreatedCount(String userId, int count) async{
    try{
      final supabase = Supabase.instance.client;
      final updates = {
        'favorites_created_count': count,
      };
      final data = await supabase
          .from(USER_PLAN_TABLE)
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
  Future<Either<Failure, Success>> updateCookBookCreatedCount(String userId, int count) async{
    try{
      final supabase = Supabase.instance.client;
      final updates = {
        'cook_book_created_count': count,
      };
      final data = await supabase
          .from(USER_PLAN_TABLE)
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
  Future<Either<Failure, Success>> updateCookBookRequestsLeft(String userId, int requestsLeft) async{
    try{
      final supabase = Supabase.instance.client;
      final updates = {
        'cook_book_left': requestsLeft,
      };
      final data = await supabase
          .from(USER_PLAN_TABLE)
          .update(updates)
          .eq('id', userId);

      return const Right(Success());

    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

}