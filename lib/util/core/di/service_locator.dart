



import 'package:get_it/get_it.dart';
import 'package:masterpie/feature/foods/domain/usecase/add_to_my_cook_book_usecase.dart';
import 'package:masterpie/feature/foods/domain/usecase/auto_generate_foods_usecase.dart';
import 'package:masterpie/feature/foods/domain/usecase/get_fat_secret_foods_info_usecase.dart';
import 'package:masterpie/feature/foods/domain/usecase/get_my_cook_book_foods_usecase.dart';
import 'package:masterpie/feature/foods/domain/usecase/meal_plan_usecase.dart';
import 'package:masterpie/feature/foods/domain/usecase/remove_from_my_cook_book_usecase.dart';
import 'package:masterpie/feature/foods/domain/usecase/search_recipe_usecase.dart';
import 'package:masterpie/feature/user/data/local/datasource/user_hive_keyvalue_datasource.dart';
import 'package:masterpie/feature/user/data/local/datasource/user_hive_keyvalue_datasource_impl.dart';
import 'package:masterpie/feature/user/data/local/datasource/user_local_datasource.dart';
import 'package:masterpie/feature/user/data/local/datasource/user_local_datasource_impl.dart';
import 'package:masterpie/feature/user/data/mapper/user_mapper.dart';
import 'package:masterpie/feature/user/data/mapper/user_mapper_impl.dart';
import 'package:masterpie/feature/user/data/remote/datasource/user_remote_datasource.dart';
import 'package:masterpie/feature/user/data/remote/datasource/user_remote_datasource_impl.dart';
import 'package:masterpie/feature/user/data/repository_impl/user_repository_impl.dart';
import 'package:masterpie/feature/user/domain/repository/user_repository.dart';
import 'package:masterpie/feature/user/domain/usecase/forgot_password_usecase.dart';
import 'package:masterpie/feature/user/domain/usecase/subscriptions_usecase.dart';
import '../../../feature/foods/data/local/datasource/food_local_datasource.dart';
import '../../../feature/foods/data/local/datasource/food_local_datasource_impl.dart';
import '../../../feature/foods/data/mapper/foods_mapper.dart';
import '../../../feature/foods/data/mapper/foods_mapper_impl.dart';
import '../../../feature/foods/data/remote/datasource/fat_secret_food_remote_datasource.dart';
import '../../../feature/foods/data/remote/datasource/fat_secret_food_remote_datasource_impl.dart';
import '../../../feature/foods/data/remote/datasource/masterpie_food_remote_datasource.dart';
import '../../../feature/foods/data/remote/datasource/masterpie_food_remote_datasource_impl.dart';
import '../../../feature/foods/data/remote/datasource/openai_food_remote_datasource.dart';
import '../../../feature/foods/data/remote/datasource/openai_food_remote_datasource_impl.dart';
import '../../../feature/foods/data/repository_impl/foods_repository_impl.dart';
import '../../../feature/foods/domain/repository/foods_repository.dart';
import '../../../feature/foods/domain/usecase/add_to_my_favorite_usecase.dart';
import '../../../feature/foods/domain/usecase/get_international_meals_usecase.dart';
import '../../../feature/foods/domain/usecase/get_logged_foods_usecase.dart';
import '../../../feature/foods/domain/usecase/get_my_favorite_foods_usecase.dart';
import '../../../feature/foods/domain/usecase/get_recipe_usecase.dart';
import '../../../feature/foods/domain/usecase/groceries_usecase.dart';
import '../../../feature/foods/domain/usecase/log_foods_usecase.dart';
import '../../../feature/foods/domain/usecase/remove_from_my_favorite_usecase.dart';
import '../../../feature/foods/domain/usecase/suggest_food_usecase.dart';
import '../../../feature/foods/domain/usecase/suggest_foods_portions_usecase.dart';
import '../../../feature/user/domain/usecase/get_profile_usecase.dart';
import '../../../feature/user/domain/usecase/get_user_credentials_usecase.dart';
import '../../../feature/user/domain/usecase/login_usecase.dart';
import '../../../feature/user/domain/usecase/logout_usecase.dart';
import '../../../feature/user/domain/usecase/user_plan_usecase.dart';
import '../../../feature/user/domain/usecase/register_usecase.dart';
import '../../../feature/user/domain/usecase/update_profile_usecase.dart';
import '../helper/request_api.dart';
import '../helper/sqflite/sqflite_db_helper.dart';

final serviceLocator = GetIt.instance;
Future<void> setUpServiceLocator() async{

  // request
  serviceLocator.registerSingleton<BaseRequest>(BaseRequest());

  // // sqflite database
  serviceLocator.registerFactory<DatabaseHelper>(() => DatabaseHelper());

  /**
   * Authentication
   */
  //usecase
  serviceLocator.registerFactory<LoginUseCase>(() => LoginUseCase());

  serviceLocator.registerFactory<RegisterUseCase>(() => RegisterUseCase());

  serviceLocator.registerFactory<GetProfileUseCase>(() => GetProfileUseCase());

  serviceLocator.registerFactory<UpdateProfileUseCase>(() => UpdateProfileUseCase());

  serviceLocator.registerFactory<GetUserCredentialsUseCase>(() => GetUserCredentialsUseCase());

  serviceLocator.registerFactory<LogOutUseCase>(() => LogOutUseCase());

  serviceLocator.registerFactory<UserPlanUseCase>(() => UserPlanUseCase());

  serviceLocator.registerFactory<SubscriptionPlansUseCase>(() => SubscriptionPlansUseCase());

  serviceLocator.registerFactory<ForgotPasswordUseCase>(() => ForgotPasswordUseCase());



  //datasource
  serviceLocator.registerFactory<UserRemoteDataSource>(
          () => UserRemoteDataSourceImpl());
  serviceLocator.registerFactory<UserLocalDataSource>(
          () => UserLocalDataSourceImpl());
  //hive key-value datasource
  serviceLocator.registerFactory<UserHiveDataSource>(() => UserHiveDataSourceImpl());

  //repositories
  serviceLocator.registerFactory<UserRepository>(() => UserRepositoryImpl());

  //mapper
  serviceLocator.registerFactory<UserMapper>(() => UserMapperImpl());


  /**
   * Foods
   */

  //usecase
  serviceLocator.registerFactory<GroceriesUseCase>(() => GroceriesUseCase());

  serviceLocator.registerFactory<SuggestFoodUseCase>(() => SuggestFoodUseCase());

  serviceLocator.registerFactory<AddToMyFavoriteUseCase>(() => AddToMyFavoriteUseCase());

  serviceLocator.registerFactory<AddToMyCookBookUseCase>(() => AddToMyCookBookUseCase());

  serviceLocator.registerFactory<GetMyFavoriteFoodsUseCase>(() => GetMyFavoriteFoodsUseCase());

  serviceLocator.registerFactory<GetMyCookBookFoodsUseCase>(() => GetMyCookBookFoodsUseCase());

  serviceLocator.registerFactory<RemoveFromMyFavoriteUseCase>(() => RemoveFromMyFavoriteUseCase());

  serviceLocator.registerFactory<RemoveFromMyCookBookUseCase>(() => RemoveFromMyCookBookUseCase());

  serviceLocator.registerFactory<SuggestFoodsPortionsUseCase>(() => SuggestFoodsPortionsUseCase());

  serviceLocator.registerFactory<GetInternationalMealsUseCase>(() => GetInternationalMealsUseCase());

  serviceLocator.registerFactory<LogFoodsUseCase>(() => LogFoodsUseCase());

  serviceLocator.registerFactory<GetLoggedFoodsUseCase>(() => GetLoggedFoodsUseCase());

  serviceLocator.registerFactory<RecipesUseCase>(() => RecipesUseCase());

  serviceLocator.registerFactory<GetRecipeUseCase>(() => GetRecipeUseCase());

  serviceLocator.registerFactory<GetFatSecretFoodsInfoUseCase>(() => GetFatSecretFoodsInfoUseCase());

  serviceLocator.registerFactory<AutoGenerateFoodsUseCase>(() => AutoGenerateFoodsUseCase());

  serviceLocator.registerFactory<MealPlanUseCase>(() => MealPlanUseCase());


  //repositories
  serviceLocator.registerFactory<FoodsRepository>(() => FoodsRepositoryImpl());

  //datasource
  serviceLocator.registerFactory<FatSecretRemoteDataSource>(
          () => FatSecretFoodRemoteDataSourceImpl());
  serviceLocator.registerFactory<MasterPieFoodRemoteDataSource>(
          () => MasterPieFoodRemoteDataSourceImpl());
  serviceLocator.registerFactory<FoodLocalDataSource>(
          () => FoodLocalDataSourceImpl());
  serviceLocator.registerFactory<OpenAIFoodRemoteDataSource>(
          () => OpenAIFoodRemoteDataSourceImpl());

   //mapper
  serviceLocator.registerFactory<FoodsMapper>(() => FoodsMapperImpl());

}