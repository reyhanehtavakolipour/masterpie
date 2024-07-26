
import 'package:dartz/dartz.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:masterpie/feature/user/data/remote/model/subscription_plan_remote_model.dart';
import 'package:masterpie/feature/user/data/remote/model/user_plan_remote_model.dart';
import 'package:masterpie/util/core/helper/helper_get_value.dart';
import 'package:masterpie/util/core/helper/print.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../../util/core/constant/api_constant.dart';
import '../../../../../util/core/constant/messages_constants.dart';
import '../../../../../util/core/helper/helper.dart';
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




      final userPlanData = await supabase
          .from(USER_PLAN_TABLE)
          .select<List<dynamic>>()
          .eq('id', user?.id ?? '');



      if(userPlanData.isNotEmpty){
        if(userPlanData[0]['plan_name'] == null){
          setUserSubscriptionPlanAfterRegister(user?.id ?? '');
        }else if(userPlanData[0]['plan_name'].toString().isEmpty){
          setUserSubscriptionPlanAfterRegister(user?.id ?? '');
        }
      }


      return  Right(user?.id ?? '');
    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    }catch(e){
      return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, ProfileRemote>> upsertProfile(ProfileRemote profileRemote) async{
    try {
      // includes everything including name, email, gender, age, ...
      final supabase = Supabase.instance.client;
      await supabase.from(PROFILE_REMOTE_TABLE)
          .update(profileRemoteToJson(profileRemote))
          .eq('id', profileRemote.id);
      return Right(profileRemote);
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
        gender: data[0]['gender'] ?? '',
        weightUnit: data[0]['weightUnit'] ?? '',
        heightUnit: data[0]['heightUnit'] ?? '',
        goalWeight: data[0]['goalWeight'] ?? '',
        activityLevel: data[0]['activityLevel'] ?? '',
        dailyMacroGoal: data[0]['dailyMacroGoal'] == null ? ['', '', '', ''] : (data[0]['dailyMacroGoal'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        age: data[0]['age'] ?? '',
        weightChangeWeekly: data[0]['weightChangeWeekly'] ?? '',
        updateProfileShown: data[0]['update_profile_shown'] ?? false,
        favoriteCategories: data[0]['favorite_categories'] == null ? [] : (data[0]['favorite_categories'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        hateCategories: data[0]['hate_categories'] == null ? [] : (data[0]['hate_categories'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        favoriteSubCategories: data[0]['favorite_sub_categories'] == null ? [] : (data[0]['favorite_sub_categories'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        hateSubCategories: data[0]['hate_sub_categories'] == null ? [] : (data[0]['hate_sub_categories'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        mainDishTypes: data[0]['main_dish_types'] == null ? [] : (data[0]['main_dish_types'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        sideDishTypes: data[0]['side_dish_types'] == null ? [] : (data[0]['side_dish_types'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
        allergens: data[0]['allergens'] == null ? [] : (data[0]['allergens'] as List<dynamic>).map((dynamic item) => item.toString()).toList(),
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

      double weightChangeWeekly = 0.0;
      RegExp regExp = RegExp(r'(\d+(\.\d+)?)');

      Match? match = regExp.firstMatch(profile.weightChangeWeekly);
      if (match != null) {
        String matchedNumber = match.group(0)!;
        weightChangeWeekly = double.parse(matchedNumber);
      }

      //body
      Map<String, dynamic> calculateMacroGoalRemoteBody = {
        'age': double.parse(profile.age),
        'gender': profile.gender,
        'weight': double.parse(profile.weight),
        'height': double.parse(profile.height),
        'activityLevel': profile.activityLevel,
        'goalWeight': profile.goalWeight,
        'weightChangeWeekly': weightChangeWeekly,
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

      //todo uncomment when free plan should be set after registration
      // final supabase = Supabase.instance.client;
      //
      // int timestamp = DateTime.now().millisecondsSinceEpoch;
      //
      // final subscriptions = await getSubscriptionPlans();
      // if(subscriptions.isRight()){
      //
      //   final freeSubscription = subscriptions.asRight().firstWhere((element) => element.plan == FREE_LABEL);
      //
      //   DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(timestamp);
      //
      //   String newNextUpdateDate = calculateNextDate(currentDate, 1, 'month').millisecondsSinceEpoch.toString();
      //
      //   final updates = {
      //     'plan_name': freeSubscription.plan,
      //     'suggest_food_left_request': freeSubscription.suggestFoodRequestsLimit,
      //     'food_portion_left_request': freeSubscription.foodPortionRequestsLimit,
      //     'favorite_food_left': freeSubscription.favoriteFoodLimit,
      //     'cook_book_left': freeSubscription.cookBookFoodLimit,
      //     'plan_updated_at': timestamp.toString(),
      //     'next_update_date' : newNextUpdateDate,
      //     'plan_interval': freeSubscription.intervals[0],
      //     'current_period_end': ''
      //   };
      //
      //
      //   final data = await supabase
      //       .from(USER_PLAN_TABLE)
      //       .update(updates)
      //       .eq('id', userId);
      //
      //   return const Right(Success());
      // }
      // return const Left(FailureResponse(''));






    //todo delete whole when free plan should be set after registration
      final supabase = Supabase.instance.client;
      final subsData = await supabase
          .from(PLANS_TABLE)
          .select<List<Map<String, dynamic>>>();


        int foodsPortionRequests= 0;
        subsData.forEach((element) {
          if(element['plan_name'] == 'premium one-time' && element['interval'] == 'yearly'){
            foodsPortionRequests= element['food_portion_limit'] ?? 0;
          }
        });


        int timestamp = DateTime.now().millisecondsSinceEpoch;

        DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(timestamp);

        String newNextUpdateDate = calculateNextDate(currentDate, 1, 'month').millisecondsSinceEpoch.toString();

        String endsAt = calculateNextDate(currentDate, 1, 'year').millisecondsSinceEpoch.toString();



        final updates = {
          'food_portion_left_request' : foodsPortionRequests,
          'favorite_food_left' :  10000,
          'cook_book_left' : 10000,
          'next_update_date' : newNextUpdateDate,
          'current_period_end': endsAt,
          'plan_name' : PREMIUM_LABEL
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

        int currentTime = DateTime.now().millisecondsSinceEpoch;

        DateTime currentDate = DateTime.fromMillisecondsSinceEpoch(currentTime);

        DateTime currentPeriodEnd = DateTime.fromMillisecondsSinceEpoch(int.parse(userPlan[0]['current_period_end']));


        DateTime nextUpdateDate = DateTime.fromMillisecondsSinceEpoch(int.parse(userPlan[0]['next_update_date'] ?? '0'));

        final subscriptions = await getSubscriptionPlans();

        // if one month is past from previous update
        if(currentDate.isAfter(nextUpdateDate) && subscriptions.isRight()){

          int favoriteLeft = 0;
          int cookBookLeft = 0;
          int suggestFoodLeft = 0;
          int foodPortionLeft = 0;

          String newNextUpdateDate = calculateNextDate(nextUpdateDate, 1, 'month').millisecondsSinceEpoch.toString();


          if(userPlan[0]['plan_name'] == FREE_LABEL){

            // free plan
              final freeSubscription = subscriptions.asRight().firstWhere((element) => element.plan == FREE_LABEL);

              suggestFoodLeft = freeSubscription.suggestFoodRequestsLimit;
              foodPortionLeft = freeSubscription.foodPortionRequestsLimit;

              final updates = {
                'plan_name': FREE_LABEL,
                'suggest_food_left_request' : suggestFoodLeft,
                'food_portion_left_request' : foodPortionLeft,
                'next_update_date' : newNextUpdateDate,
              };

              final data = await supabase
                  .from(USER_PLAN_TABLE)
                  .update(updates)
                  .eq('id', userId);

            }else if(!currentDate.isAfter(currentPeriodEnd)){

            // premium plan which has not expired yet
              final yearlySubscription = subscriptions.asRight().firstWhere((element) => element.plan == userPlan[0]['plan_name']);

              suggestFoodLeft = yearlySubscription.suggestFoodRequestsLimit;
              foodPortionLeft = yearlySubscription.foodPortionRequestsLimit;


              final updates = {
                'suggest_food_left_request' : suggestFoodLeft,
                'food_portion_left_request' : foodPortionLeft,
                'favorite_food_left' :  10000,
                'cook_book_left' : 10000,
                'next_update_date' : newNextUpdateDate,
              };

              final data = await supabase
                  .from(USER_PLAN_TABLE)
                  .update(updates)
                  .eq('id', userId);

            }else if(currentDate.isAfter(currentPeriodEnd)){
              // premium plan which has expired and should switch to free plan

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


              final updates = {
                'plan_name': FREE_LABEL,
                'suggest_food_left_request' : suggestFoodLeft,
                'food_portion_left_request' : foodPortionLeft,
                'favorite_food_left' :  favoriteLeft,
                'next_update_date' : newNextUpdateDate,
                'cook_book_left': cookBookLeft,
                'current_period_end': ''
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
        ),
        interval: data[0]['plan_interval'] ?? '',
        nextUpdateDate: data[0]['next_update_date'] ?? '',
        endsAt: data[0]['current_period_end'] ?? '',
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

  @override
  Future<Either<Failure, bool>> deleteProfile(String userId) async{
    try{

      final supabase = Supabase.instance.client;

      final data = await supabase
          .from(PROFILE_REMOTE_TABLE)
          .delete()
          .eq('id', userId);


      return const Right(true);

    }on PostgrestException catch (error) {
      return Left(ExceptionFailure(error));
    } catch (error) {
      return Left(ExceptionFailure(error));
    }
  }

}