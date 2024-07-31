import 'dart:async';

import 'package:path_provider/path_provider.dart';

import '../../constant/sqflite_constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


const SQFLITE_PASSWORD_KEY = 'SQFLITE_PASSWORD_KEY';

class DatabaseHelper {

  // Singleton instance
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  // Private constructor
  DatabaseHelper._internal();

  // Factory constructor to return the same instance
  factory DatabaseHelper() {
    return _instance;
  }

  static Database? _database;

  Future<Database> get db async {
    if (_database != null) return _database!;
    _database = await _initializeDatabase();
    return _database!;
  }

  Future<Database> _initializeDatabase() async {

    //delete old db
    var docdir = await getApplicationDocumentsDirectory();
    String path = join(docdir.path, 'masterpie_db.db');
    bool dbExists = await databaseExists(path);
    if (dbExists) {
      await deleteDatabase(path);
    }



    var databasesPath = await getDatabasesPath();
    String newPath = join(databasesPath, 'masterpie_db.db');

    return await openDatabase(
      newPath,
      version: 1,
      onCreate: (Database db, int version) async {

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

      },
    );
  }


  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}