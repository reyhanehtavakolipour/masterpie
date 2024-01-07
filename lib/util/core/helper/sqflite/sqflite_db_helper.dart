import 'dart:async';

import '../../constant/sqflite_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    String path = join(docdir.path, 'rtp_fitness_db.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
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
        ' $WEIGHT_CHANGE_WEEKLY TEXT'
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
        ' $COUNT TEXT'
        ')');


    /**
     * This table is not needed for first version and it doesn't have any functionality in the app.
     * might be needed in future. otherwise delete it
     */
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
        ' $FAT TEXT'
        ')');
  }

  Future close() async {
    var dbClient = await db;
    dbClient?.close();
  }
}