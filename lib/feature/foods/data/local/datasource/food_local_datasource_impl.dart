



import 'package:dartz/dartz.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import '../../../../../util/core/constant/sqflite_constants.dart';
import '../../../../../util/core/di/service_locator.dart';
import '../../../../../util/core/helper/print.dart';
import '../../../../../util/core/helper/request_api.dart';
import '../../../../../util/core/helper/sqflite/sqflite_db_helper.dart';
import '../../../../../util/core/response/failure.dart';
import '../../../../../util/core/response/success.dart';
import '../model/food_local_model.dart';
import '../model/food_type_local.dart';
import '../model/international_meal_local_model.dart';
import '../model/logged_foods_local_model.dart';
import '../model/my_food_local_model.dart';
import 'food_local_datasource.dart';

class FoodLocalDataSourceImpl extends FoodLocalDataSource{

  @override
  Future<Either<Failure, List<MyFoodLocal>>> getMyMeals(String query) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<MyFoodLocal> myProducts = [];
    try{
      final list = await db?.query(
        TABLE_MY_FOOD,
        where: '$FOOD_TYPE = ? AND ($NAME LIKE ? OR $BRAND_NAME LIKE ?)',
        whereArgs: [FoodTypeLocal.meal.name, '%$query%', '%$query%'],
      );
      list?.forEach((element) {
        final product = MyFoodLocal.fromJson(element);
        myProducts.add(product);
      });
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(myProducts);
  }

  @override
  Future<Either<Failure, List<MyFoodLocal>>> getMyGroceryProducts(String query) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<MyFoodLocal> myProducts = [];
    try{
      final list = await db?.query(
        TABLE_MY_FOOD,
        where: '$FOOD_TYPE = ? AND ($NAME LIKE ? OR $BRAND_NAME LIKE ?)',
        whereArgs: [FoodTypeLocal.groceryProduct.name, '%$query%', '%$query%'],
      );
      list?.forEach((element) {
        final product = MyFoodLocal.fromJson(element);
        myProducts.add(product);
      });
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(myProducts);
  }

  @override
  Future<Either<Failure, List<FoodLocal>>> getSearchedGroceryProducts(String query) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<FoodLocal> products = [];
    try{
      final list = await db?.query(
        TABLE_FOOD,
        where: '$NAME LIKE ? OR $BRAND_NAME LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
      );
      list?.forEach((element) {
        final product = FoodLocal.fromJson(element);
        products.add(product);
      });
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(products);
  }

  @override
  Future<Either<Failure, Success>> saveMyFood(MyFoodLocal myFoodLocal, String myId) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      myFoodLocal.myId = myId;
      await db!.insert(TABLE_MY_FOOD , myFoodLocal.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }on DatabaseException catch (e) {
    safePrint('SQL_Error_myFood: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> saveFoods(List<FoodLocal> foodsLocal) async {
    final db = await serviceLocator<DatabaseHelper>().db;
    try {
      Batch? batch = db?.batch();

      for (FoodLocal foodLocal in foodsLocal) {
        final existingFood = await db?.query(
          TABLE_FOOD,
          where: 'foodId = ?',
          whereArgs: [foodLocal.foodId],
        );


        if ((existingFood?.length ?? 0) == 0) {
          batch?.insert(TABLE_FOOD, foodLocal.toJson());
        } else {
          batch?.update(
            TABLE_FOOD,
            foodLocal.toJson(),
            where: 'foodId = ?',
            whereArgs: [foodLocal.foodId],
          );
        }
      }

      await batch?.commit(noResult: true);
    } on DatabaseException catch (e) {
      safePrint('SQL_Error_products: $e');
      return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }


  @override
  Future<Either<Failure, List<InternationalMealLocal>>> getInternationalMeals(String query) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<InternationalMealLocal> meals = [];
    try{
      final list = await db?.query(
        TABLE_INTERNATIONAL_MEAL,
        where: '$NAME LIKE ? OR $BRAND_NAME LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
      );
      list?.forEach((element) {
        final meal = InternationalMealLocal.fromJson(element);
        meals.add(meal);
      });
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(meals);
  }



  @override
  Future<Either<Failure, Success>> saveInternationalMeals(List<InternationalMealLocal> meals) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try {
      Batch? batch = db?.batch();

      for (InternationalMealLocal foodLocal in meals) {
        final existingFood = await db?.query(
          TABLE_INTERNATIONAL_MEAL,
        );

        if ((existingFood ?? []).isEmpty) {
          batch?.insert(TABLE_INTERNATIONAL_MEAL, foodLocal.toJson());
        } else {
          batch?.update(
            TABLE_INTERNATIONAL_MEAL,
            foodLocal.toJson(),
          );
        }
      }
      await batch?.commit(noResult: true);
    } on DatabaseException catch (e) {
    safePrint('SQL_Error_international_meals: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }



  @override
  Future<Either<Failure, List<FoodLocal>>> getLastSearchedGroceryProducts() async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<FoodLocal> products = [];
    try{
      final list = await db?.query(
        TABLE_FOOD,
        limit: 10
      );
      list?.forEach((element) {
        final product = FoodLocal.fromJson(element);
        products.add(product);
      });
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(products);
  }

  @override
  Future<Either<Failure, List<MyFoodLocal>>> getMyFoods(String query) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<MyFoodLocal> foods = [];
    try{
      final list = await db?.query(
          TABLE_MY_FOOD,
        where: '$NAME LIKE ? OR $BRAND_NAME LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
      );

      list?.forEach((element) {
        final food = MyFoodLocal.fromJson(element);
        foods.add(food);
      });

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, Success>> saveMyFoods(List<MyFoodLocal> myFoodsLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try {

      await db?.delete(TABLE_MY_FOOD);

      Batch? batch = db?.batch();

      for (MyFoodLocal foodLocal in myFoodsLocal) {
        batch?.insert(TABLE_MY_FOOD, foodLocal.toJson());
      }
      await batch?.commit(noResult: true);
    } on DatabaseException catch (e) {
    safePrint('SQL_Error_my_foods: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> saveMyGroceries(List<MyFoodLocal> myFoodsLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try {

    Batch? batch = db?.batch();

    for (MyFoodLocal foodLocal in myFoodsLocal) {
    batch?.insert(TABLE_MY_FOOD, foodLocal.toJson());
    }
    await batch?.commit(noResult: true);
    } on DatabaseException catch (e) {
    safePrint('SQL_Error_my_foods: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> saveMyMeals(List<MyFoodLocal> myFoodsLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try {

    Batch? batch = db?.batch();

    for (MyFoodLocal foodLocal in myFoodsLocal) {
    batch?.insert(TABLE_MY_FOOD, foodLocal.toJson());
    }
    await batch?.commit(noResult: true);
    } on DatabaseException catch (e) {
    safePrint('SQL_Error_my_foods: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateMyFood(MyFoodLocal myFoodLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db!.update(
        TABLE_MY_FOOD,
        myFoodLocal.toJson(),
        where: 'foodId = ?',
        whereArgs: [myFoodLocal.foodId],
      );
    }on DatabaseException catch (e) {
    safePrint('SQL_Error_update_myFood: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }


  @override
  Future<Either<Failure, bool>> isItInMyFavorites(String id) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      List<MyFoodLocal> foods = [];
      final list = await db?.query(TABLE_MY_FOOD, where: 'foodId = ?', whereArgs: [id]);
      list?.forEach((element) {
        final food = MyFoodLocal.fromJson(element);
        foods.add(food);
      });
      if(foods.isEmpty){
        return const Right(false);
      }
    }on DatabaseException catch (e) {
      safePrint('SQL_Error_Exist: $e');
      return Left(ExceptionFailure(e));
    }
    return const Right(true);
  }

  @override
  Future<Either<Failure, Success>> updateFavoriteFieldOfFood(FoodLocal foodLocal, bool isFavorite) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db!.update(TABLE_FOOD , {'isFavorite': isFavorite ? 1 : 0} , where: 'foodId = ?', whereArgs: [foodLocal.foodId]);
    }on DatabaseException catch (e) {
      safePrint('SQL_Error_update_fav_Food: $e');
      return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> removeMyFood(MyFoodLocal myFoodLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.delete(TABLE_MY_FOOD, where: 'foodId = ?', whereArgs: [myFoodLocal.foodId],);
    }on DatabaseException catch (e) {
    safePrint('SQL_Error_remove_fav_Food: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, List<LoggedFoodsLocal>>> getLoggedFoods(String date, String myId) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<LoggedFoodsLocal> foods = [];
    try{
      final list = await db?.query(TABLE_LOGGED_FOODS, where: '$DATE = ? AND $MY_ID = ?', whereArgs: [date, myId],);
      list?.forEach((element) {
        final food = LoggedFoodsLocal.fromJson(element);
        foods.add(food);
      });
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, List<LoggedFoodsLocal>>> saveLoggedFoods(List<LoggedFoodsLocal> foods) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try {

      for (LoggedFoodsLocal foodLocal in foods) {

        if(foodLocal.foodTypeLocal == FoodTypeLocal.groceryProduct){
          final existingFood = await db?.query(
              TABLE_LOGGED_FOODS,  where: '$FOOD_TYPE = ? AND $MY_ID = ? AND $NAME = ? AND $SERVING_AMOUNTS = ? AND $UNITS = ? AND $CALORIE = ? AND $PROTEIN = ? AND $CARB = ? AND $FAT = ?',
              whereArgs: [getFoodType(foodLocal.toJson()['foodTypeLocal']).name, foodLocal.toJson()['myId'], foodLocal.toJson()['name'], foodLocal.toJson()['servingAmounts'],
                foodLocal.toJson()['units'], foodLocal.toJson()['calorie'], foodLocal.toJson()['protein'], foodLocal.toJson()['carb'], foodLocal.toJson()['fat'],
              ]
          );

          if ((existingFood ?? []).isEmpty) {
            foodLocal.id = generateRandomId();
            await db!.insert(TABLE_LOGGED_FOODS , foodLocal.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
          } else {
            final food = LoggedFoodsLocal.fromJson(existingFood![0]);
            foodLocal.id= food.id;
            foodLocal.count = (double.parse(food.count) + double.parse(foodLocal.count)).toString();
            await db!.insert(TABLE_LOGGED_FOODS , foodLocal.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
          }
        }else{
          final existingFood = await db?.query(
              TABLE_LOGGED_FOODS, where: '$FOOD_TYPE = ? AND $MY_ID = ? AND $NAME = ? AND $SERVING_AMOUNTS = ? AND $UNITS = ? AND $RECIPE = ? AND $INGREDIENTS = ?'
              ' AND $SERVING_INGREDIENTS_COUNT = ? AND $SERVING_AMOUNT = ? AND $FOOD_UNIT = ? AND $CALORIE = ? AND $PROTEIN = ? AND $CARB = ? AND $FAT = ?',
              whereArgs: [getFoodType(foodLocal.toJson()['foodTypeLocal']).name, foodLocal.toJson()['myId'], foodLocal.toJson()['name'], foodLocal.toJson()['servingAmounts'], foodLocal.toJson()['units'], foodLocal.toJson()['recipe'], foodLocal.toJson()['ingredients'],
                foodLocal.toJson()['servingIngredientsCount'],foodLocal.toJson()['servingAmount'], foodLocal.toJson()['unit'], foodLocal.toJson()['calorie'], foodLocal.toJson()['protein'], foodLocal.toJson()['carb'], foodLocal.toJson()['fat'],
              ]
          );

          if ((existingFood ?? []).isEmpty) {
            foodLocal.id = generateRandomId();
            await db!.insert(TABLE_LOGGED_FOODS , foodLocal.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
          } else {
            final food = LoggedFoodsLocal.fromJson(existingFood![0]);
            foodLocal.id= food.id;
            foodLocal.count = (double.parse(food.count) + double.parse(foodLocal.count)).toString();
            await db!.insert(TABLE_LOGGED_FOODS , foodLocal.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
          }
        }
      }

      List<LoggedFoodsLocal> loggedFoods = [];
      final list = await db?.query(
          TABLE_LOGGED_FOODS
      );
      list?.forEach((element) {
        final food = LoggedFoodsLocal.fromJson(element);
        loggedFoods.add(food);
      });

      return Right(loggedFoods);

    } on DatabaseException catch (e) {
    safePrint('SQL_Error_logged_foods: $e');
    return Left(ExceptionFailure(e));
    }
  }

  @override
  Future<Either<Failure, Success>> deleteLog(String date) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.delete(TABLE_LOGGED_FOODS);
    }on DatabaseException catch (e) {
    safePrint('SQL_Error_delete_log_foods: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }


  @override
  Future<Either<Failure, String>> isFoodInMyFavorites(MyFoodLocal foodLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    String favoriteId = '';
    try{

      final list = await db?.query(TABLE_MY_FOOD,
          where: '$FOOD_TYPE = ? AND $MY_ID = ? AND $NAME = ? AND $SERVING_AMOUNTS = ? AND $UNITS = ? AND $RECIPE = ? AND $INGREDIENTS = ?'
              ' AND $SERVING_INGREDIENTS_COUNT = ? AND $SERVING_AMOUNT = ? AND $FOOD_UNIT = ? AND $CALORIE = ? AND $PROTEIN = ? AND $CARB = ? AND $FAT = ?',
          whereArgs: [getFoodType(foodLocal.toJson()['foodTypeLocal']).name.toString(), foodLocal.toJson()['myId'].toString(), foodLocal.toJson()['name'].toString(),
            foodLocal.toJson()['servingAmounts'].toString(), foodLocal.toJson()['units'].toString(), foodLocal.toJson()['recipe'].toString(), foodLocal.toJson()['ingredients'].toString(),
            foodLocal.toJson()['servingIngredientsCount'].toString(),foodLocal.toJson()['servingAmount'].toString(), foodLocal.toJson()['unit'].toString(), foodLocal.toJson()['calorie'].toString(),
            foodLocal.toJson()['protein'].toString(), foodLocal.toJson()['carb'].toString(), foodLocal.toJson()['fat'].toString(),
          ]);

      if((list ?? []).isNotEmpty){
        final food = MyFoodLocal.fromJson(list![0]);
        favoriteId= food.foodId;
      }
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(favoriteId);
  }

  @override
  Future<Either<Failure, List<MyFoodLocal>>> getMyCookBookFoods(String query) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    List<MyFoodLocal> foods = [];
    try{
      final list = await db?.query(
        TABLE_MY_COOKBOOK,
        where: '$NAME LIKE ? OR $BRAND_NAME LIKE ?',
        whereArgs: ['%$query%', '%$query%'],
      );

      list?.forEach((element) {
        final food = MyFoodLocal.fromJson(element);
        foods.add(food);
      });

    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(foods);
  }

  @override
  Future<Either<Failure, Success>> removeMyCookBookFood(MyFoodLocal myFoodLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db?.delete(TABLE_MY_COOKBOOK, where: 'foodId = ?', whereArgs: [myFoodLocal.foodId],);
    }on DatabaseException catch (e) {
    safePrint('SQL_Error_remove_fav_Food: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> saveMyCookBookFood(MyFoodLocal myFoodLocal, String myId) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      myFoodLocal.myId = myId;
      await db!.insert(TABLE_MY_COOKBOOK , myFoodLocal.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    }on DatabaseException catch (e) {
    safePrint('SQL_Error_myFood: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> saveMyCookBookFoods(List<MyFoodLocal> myFoodsLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try {

      await db?.delete(TABLE_MY_COOKBOOK);

    Batch? batch = db?.batch();

    for (MyFoodLocal foodLocal in myFoodsLocal) {
    batch?.insert(TABLE_MY_FOOD, foodLocal.toJson());
    }
    await batch?.commit(noResult: true);
    } on DatabaseException catch (e) {
    safePrint('SQL_Error_my_foods: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, Success>> updateMyCookBookFood(MyFoodLocal myFoodLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      await db!.update(
    TABLE_MY_COOKBOOK,
    myFoodLocal.toJson(),
    where: 'foodId = ?',
    whereArgs: [myFoodLocal.foodId],
    );
    }on DatabaseException catch (e) {
    safePrint('SQL_Error_update_myFood: $e');
    return Left(ExceptionFailure(e));
    }
    return const Right(Success());
  }

  @override
  Future<Either<Failure, bool>> isItInMyCookBook(String id) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    try{
      List<MyFoodLocal> foods = [];
      final list = await db?.query(TABLE_MY_COOKBOOK, where: 'foodId = ?', whereArgs: [id]);
      list?.forEach((element) {
        final food = MyFoodLocal.fromJson(element);
        foods.add(food);
      });
      if(foods.isEmpty){
        return const Right(false);
      }
    }on DatabaseException catch (e) {
      safePrint('SQL_Error_Exist: $e');
      return Left(ExceptionFailure(e));
    }
    return const Right(true);
  }

  @override
  Future<Either<Failure, String>> isFoodInMyCookBook(MyFoodLocal foodLocal) async{
    final db = await serviceLocator<DatabaseHelper>().db;
    String favoriteId = '';
    try{

      final list = await db?.query(TABLE_MY_COOKBOOK,
          where: '$FOOD_TYPE = ? AND $MY_ID = ? AND $NAME = ? AND $SERVING_AMOUNTS = ? AND $UNITS = ? AND $RECIPE = ? AND $INGREDIENTS = ?'
              ' AND $SERVING_INGREDIENTS_COUNT = ? AND $SERVING_AMOUNT = ? AND $FOOD_UNIT = ? AND $CALORIE = ? AND $PROTEIN = ? AND $CARB = ? AND $FAT = ?',
          whereArgs: [getFoodType(foodLocal.toJson()['foodTypeLocal']).name.toString(), foodLocal.toJson()['myId'].toString(), foodLocal.toJson()['name'].toString(),
            foodLocal.toJson()['servingAmounts'].toString(), foodLocal.toJson()['units'].toString(), foodLocal.toJson()['recipe'].toString(), foodLocal.toJson()['ingredients'].toString(),
            foodLocal.toJson()['servingIngredientsCount'].toString(),foodLocal.toJson()['servingAmount'].toString(), foodLocal.toJson()['unit'].toString(), foodLocal.toJson()['calorie'].toString(),
            foodLocal.toJson()['protein'].toString(), foodLocal.toJson()['carb'].toString(), foodLocal.toJson()['fat'].toString(),
          ]);

      if((list ?? []).isNotEmpty){
        final food = MyFoodLocal.fromJson(list![0]);
        favoriteId= food.foodId;
      }
    }on DatabaseException catch (e) {
      return Left(ExceptionFailure(e));
    }
    return Right(favoriteId);
  }


}