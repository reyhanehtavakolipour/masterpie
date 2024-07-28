import 'dart:async';

import 'package:flutter_config/flutter_config.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import '../../constant/sqflite_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


const SQFLITE_PASSWORD_KEY = 'SQFLITE_PASSWORD_KEY';

class DatabaseHelper {

  static Database? _database;

  Future<Database?> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }




  initDatabase() async {
    var docdir = await getApplicationDocumentsDirectory();
    String path = join(docdir.path, 'masterpie_db.db');
    final password= await FlutterConfig.get(SQFLITE_PASSWORD_KEY);




    bool dbExists = await databaseExists(path);

    if (dbExists) {
      await deleteDatabase(path);
      print('Database deleted');
    }


    return await openDatabase(
        path,
        version: 1,
        onCreate: _onCreate,
        password: password,
      // onUpgrade: (db, oldVersion, newVersion) async {
      //   if (oldVersion < 5) {
      //
      //     await db.execute('ALTER TABLE $TABLE_PROFILE ADD COLUMN $MAIN_DISH_TYPES TEXT');
      //     await db.execute('ALTER TABLE $TABLE_PROFILE ADD COLUMN $SIDE_DISH_TYPES TEXT');
      //     await db.execute('ALTER TABLE $TABLE_PROFILE ADD COLUMN $FAVORITE_CATEGORIES TEXT');
      //     await db.execute('ALTER TABLE $TABLE_PROFILE ADD COLUMN $HATE_CATEGORIES TEXT');
      //     await db.execute('ALTER TABLE $TABLE_PROFILE ADD COLUMN $FAVORITE_SUBCATEGORIES TEXT');
      //     await db.execute('ALTER TABLE $TABLE_PROFILE ADD COLUMN $HATE_SUBCATEGORIES TEXT');
      //     await db.execute('ALTER TABLE $TABLE_PROFILE ADD COLUMN $ALLERGENS TEXT');
      //
      //
      //     await db.execute('ALTER TABLE $TABLE_LOGGED_FOODS ADD COLUMN $CREATED_FROM_FAT_SECRET_RECIPES INTEGER');
      //
      //     await db.execute('ALTER TABLE $TABLE_MY_COOKBOOK ADD COLUMN $CREATED_FROM_FAT_SECRET_RECIPES INTEGER');
      //
      //     await db.execute('ALTER TABLE $TABLE_MY_FOOD ADD COLUMN $CREATED_FROM_FAT_SECRET_RECIPES INTEGER');
      //
      //
      //
      //
      //   }
      // },
    );
  }

  Future _onCreate(Database db, int version) async {

    await db.execute('CREATE TABLE IF NOT EXISTS $TABLE_PROFILE '
        '($ID TEXT PRIMARY KEY,'
        ' $EMAIL TEXT,'
        ' $FIRST_NAME TEXT,'
        ' $LAST_NAME TEXT,'
        ' $GENDER TEXT,'
        ' $WEIGHT TEXT,'
        ' $HEIGHT TEXT,'
        ' $WEIGHT_UNIT TEXT,'
        ' $HEIGHT_UNIT TEXT,'
        ' $GOAL_WEIGHT TEXT,'
        ' $AGE TEXT,'
        ' $DAILY_MACRO_GOAL TEXT,'
        ' $ACTIVITY_LEVEL TEXT,'
        ' $WEIGHT_CHANGE_WEEKLY TEXT,'
        ' $MAIN_DISH_TYPES TEXT,'
        ' $SIDE_DISH_TYPES TEXT,'
        ' $FAVORITE_CATEGORIES TEXT,'
        ' $HATE_CATEGORIES TEXT,'
        ' $FAVORITE_SUBCATEGORIES TEXT,'
        ' $HATE_SUBCATEGORIES TEXT,'
        ' $ALLERGENS TEXT'
        ')');



    //myId should be the userId from supabase

    await db.execute('CREATE TABLE IF NOT EXISTS $TABLE_LOGGED_FOODS '
        '($ID TEXT PRIMARY KEY,'
        ' $MY_ID TEXT,'
        ' $DATE TEXT,'
        ' $FOOD_TYPE TEXT,'
        ' $BARCODE TEXT,'
        ' $NAME TEXT,'
        ' $BRAND_NAME TEXT,'
        ' $DESCRIPTION TEXT,'
        ' $NATIONALITY TEXT,'
        ' $IMAGE TEXT,'
        ' $SERVING_AMOUNTS TEXT,'
        ' $UNITS TEXT,'
        ' $RECIPE TEXT,'
        ' $INGREDIENTS TEXT,'
        ' $SERVING_INGREDIENTS_COUNT TEXT,'
        ' $SERVING_AMOUNT INTEGER,'
        ' $DIET TEXT,'
        ' $ALLERGIES TEXT,'
        ' $FOOD_UNIT TEXT,'
        ' $CALORIE TEXT,'
        ' $PROTEIN TEXT,'
        ' $CARB TEXT,'
        ' $FAT TEXT,'
        ' $CREATED_FROM_FAT_SECRET_RECIPES INTEGER,'
        ' $COUNT TEXT'
        ')');


    await db.execute('CREATE TABLE IF NOT EXISTS $TABLE_FOOD '
        '($FOOD_ID TEXT PRIMARY KEY,'
        ' $FOOD_TYPE TEXT,'
        ' $BARCODE TEXT,'
        ' $NAME TEXT,'
        ' $BRAND_NAME TEXT,'
        ' $DESCRIPTION TEXT,'
        ' $NATIONALITY TEXT,'
        ' $IMAGE TEXT,'
        ' $SERVING_AMOUNTS TEXT,'
        ' $UNITS TEXT,'
        ' $RECIPE TEXT,'
        ' $INGREDIENTS TEXT,'
        ' $SERVING_INGREDIENTS_COUNT TEXT,'
        ' $SERVING_AMOUNT INTEGER,'
        ' $DIET TEXT,'
        ' $ALLERGIES TEXT,'
        ' $FOOD_UNIT TEXT,'
        ' $CALORIE TEXT,'
        ' $PROTEIN TEXT,'
        ' $CARB TEXT,'
        ' $FAT TEXT'
        ')');

    await db.execute('CREATE TABLE IF NOT EXISTS $TABLE_INTERNATIONAL_MEAL '
        '($FOOD_ID INTEGER PRIMARY KEY,'
        ' $BARCODE TEXT,'
        ' $NAME TEXT,'
        ' $BRAND_NAME TEXT,'
        ' $DESCRIPTION TEXT,'
        ' $NATIONALITY TEXT,'
        ' $IMAGE TEXT,'
        ' $SERVING_AMOUNTS TEXT,'
        ' $UNITS TEXT,'
        ' $RECIPE TEXT,'
        ' $INGREDIENTS TEXT,'
        ' $SERVING_INGREDIENTS_COUNT TEXT,'
        ' $SERVING_AMOUNT INTEGER,'
        ' $DIET TEXT,'
        ' $ALLERGIES TEXT,'
        ' $FOOD_UNIT TEXT,'
        ' $CALORIE TEXT,'
        ' $PROTEIN TEXT,'
        ' $CARB TEXT,'
        ' $FAT TEXT'
        ')');

    await db.execute('CREATE TABLE IF NOT EXISTS $TABLE_MY_FOOD '
        '($FOOD_ID TEXT PRIMARY KEY,'
        ' $MY_ID TEXT,'
        ' $FOOD_TYPE TEXT,'
        ' $BARCODE TEXT,'
        ' $NAME TEXT,'
        ' $BRAND_NAME TEXT,'
        ' $DESCRIPTION TEXT,'
        ' $NATIONALITY TEXT,'
        ' $IMAGE TEXT,'
        ' $SERVING_AMOUNTS TEXT,'
        ' $UNITS TEXT,'
        ' $RECIPE TEXT,'
        ' $INGREDIENTS TEXT,'
        ' $SERVING_INGREDIENTS_COUNT TEXT,'
        ' $SERVING_AMOUNT INTEGER,'
        ' $DIET TEXT,'
        ' $ALLERGIES TEXT,'
        ' $FOOD_UNIT TEXT,'
        ' $CALORIE TEXT,'
        ' $PROTEIN TEXT,'
        ' $CARB TEXT,'
        ' $CREATED_FROM_FAT_SECRET_RECIPES INTEGER,'
        ' $FAT TEXT'
        ')');


    await db.execute('CREATE TABLE IF NOT EXISTS $TABLE_MY_COOKBOOK '
        '($FOOD_ID TEXT PRIMARY KEY,'
        ' $MY_ID TEXT,'
        ' $FOOD_TYPE TEXT,'
        ' $BARCODE TEXT,'
        ' $NAME TEXT,'
        ' $BRAND_NAME TEXT,'
        ' $DESCRIPTION TEXT,'
        ' $NATIONALITY TEXT,'
        ' $IMAGE TEXT,'
        ' $SERVING_AMOUNTS TEXT,'
        ' $UNITS TEXT,'
        ' $RECIPE TEXT,'
        ' $INGREDIENTS TEXT,'
        ' $SERVING_INGREDIENTS_COUNT TEXT,'
        ' $SERVING_AMOUNT INTEGER,'
        ' $DIET TEXT,'
        ' $ALLERGIES TEXT,'
        ' $FOOD_UNIT TEXT,'
        ' $CALORIE TEXT,'
        ' $PROTEIN TEXT,'
        ' $CARB TEXT,'
        ' $CREATED_FROM_FAT_SECRET_RECIPES INTEGER,'
        ' $FAT TEXT'
        ')');
  }

  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}