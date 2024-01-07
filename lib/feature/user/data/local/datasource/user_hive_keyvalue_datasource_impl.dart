

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import '../../../../../util/core/constant/hive_constants.dart';
import 'user_hive_keyvalue_datasource.dart';

class UserHiveDataSourceImpl extends UserHiveDataSource{

  @override
  Future<int> getInt(String key) async{
    if (!kIsWeb && !Hive.isBoxOpen(AUTH_BOX)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    await Hive.openBox(AUTH_BOX);
    var authBox = Hive.box(AUTH_BOX);
    return authBox.get(key) ?? 0;
  }

  @override
  Future<String> getString(String key) async{
    if (!kIsWeb && !Hive.isBoxOpen(AUTH_BOX)) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }
    await Hive.openBox(AUTH_BOX);
    var authBox = Hive.box(AUTH_BOX);
    return authBox.get(key) ?? '';
  }

  @override
  void putInt(String key, int value) async{
    await Hive.openBox(AUTH_BOX);
    var authBox = Hive.box(AUTH_BOX);
    authBox.put(key, value);
  }

  @override
  void putString(String key, String value) async{
    await Hive.openBox(AUTH_BOX);
    var authBox = Hive.box(AUTH_BOX);
    authBox.put(key, value);
  }

}