

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/add_or_update_my_cook_book_bloc/add_or_update_my_cook_book_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/get_recipe_bloc/get_recipe_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/my_cook_book_foods_bloc/my_cook_book_foods_bloc.dart';
import 'package:masterpie/feature/foods/presentation/bloc/remove_from_cook_book_bloc/remove_from_my_cook_book_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/forgot_password_bloc/forgot_password_bloc.dart';
import 'package:masterpie/feature/user/presentation/bloc/get_subscription_plans_bloc/get_subscription_plans_bloc.dart';
import 'package:masterpie/main_screen.dart';
import '../feature/foods/presentation/bloc/add_or_update_my_favorite_bloc/add_or_update_my_favorite_bloc.dart';
import '../feature/foods/presentation/bloc/get_logged_foods_bloc/get_logged_foods_bloc.dart';
import '../feature/foods/presentation/bloc/groceries_bloc/groceries_bloc.dart';
import '../feature/foods/presentation/bloc/international_meals_bloc/international_meals_bloc.dart';
import '../feature/foods/presentation/bloc/log_foods_bloc/log_foods_bloc.dart';
import '../feature/foods/presentation/bloc/my_favorite_foods/my_favorite_foods_bloc.dart';
import '../feature/foods/presentation/bloc/recipes_bloc/recipes_bloc.dart';
import '../feature/foods/presentation/bloc/remove_from_favorite_bloc/remove_from_my_favorite_bloc.dart';
import '../feature/foods/presentation/bloc/suggest_food_bloc/suggest_food_bloc.dart';
import '../feature/foods/presentation/bloc/suggest_portion_bloc/suggest_portion_bloc.dart';
import '../feature/user/data/local/datasource/user_hive_keyvalue_datasource.dart';
import '../feature/user/presentation/bloc/get_profile_bloc/get_profile_bloc.dart';
import '../feature/user/presentation/bloc/get_user_credentials_bloc/get_user_credentials_bloc.dart';
import '../feature/user/presentation/bloc/login_bloc/login_bloc.dart';
import '../feature/user/presentation/bloc/logout_bloc/logout_bloc.dart';
import '../feature/user/presentation/bloc/register_bloc/register_bloc.dart';
import '../feature/user/presentation/bloc/update_profile_bloc/update_profile_bloc.dart';
import '../feature/user/presentation/bloc/user_plan_bloc/user_plan_bloc.dart';
import '../feature/user/presentation/screen/landing_screen.dart';
import '../util/core/constant/hive_constants.dart';
import '../util/core/di/service_locator.dart';



class App extends StatelessWidget {

  static const routeName = '/';


  App({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => RegisterBloc(),
          ),
          BlocProvider(
            create: (_) => LoginBloc(),
          ),
          BlocProvider(
            create: (_) => UserPlanBloc(),
          ),
          BlocProvider(
            create: (_) => GetSubscriptionPlansBloc(),
          ),
          BlocProvider(
            create: (_) => ForgotPasswordBloc(),
          ),
          BlocProvider(
            create: (_) => LogoutBloc(),
          ),
          BlocProvider(
            create: (_) => GetProfileBloc(),
          ),
          BlocProvider(
            create: (_) => UpdateProfileBloc(),
          ),
          BlocProvider(
            create: (_) => GetUserCredentialsBloc(),
          ),
          BlocProvider(
            create: (_) => GroceriesBloc(),
          ),
          BlocProvider(
            create: (_) => SuggestFoodBloc(),
          ),
          BlocProvider(
            create: (_) => AddOrUpdateMyFavoriteBloc(),
          ),
          BlocProvider(
            create: (_) => MyFavoriteFoodsBloc(),
          ),
          BlocProvider(
            create: (_) => RemoveFromMyFavoriteBloc(),
          ),
          BlocProvider(
            create: (_) => SuggestPortionsBloc(),
          ),
          BlocProvider(
            create: (_) => InternationalMealsBloc(),
          ),
          BlocProvider(
            create: (_) => LogFoodsBloc(),
          ),
          BlocProvider(
            create: (_) => GetLoggedFoodsBloc(),
          ),
          BlocProvider(
            create: (_) => MyCookBookFoodsBloc(),
          ),
          BlocProvider(
            create: (_) => RemoveFromMyCookBookBloc(),
          ),
          BlocProvider(
            create: (_) => AddOrUpdateMyCookBookBloc(),
          ),
          BlocProvider(
            create: (_) => RecipesBloc(),
          ),
          BlocProvider(
            create: (_) => GetRecipeBloc(),
          ),
        ],
        child: MaterialApp(
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          routes: {
            App.routeName: (context) =>  const MainScreen(),
          },
        ),
    );
  }
}