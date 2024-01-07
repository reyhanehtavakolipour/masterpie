


abstract class UserHiveDataSource{

  void putString(String key, String value);

  void putInt(String key, int value);

  Future<String> getString(String key);

  Future<int> getInt(String key);

}