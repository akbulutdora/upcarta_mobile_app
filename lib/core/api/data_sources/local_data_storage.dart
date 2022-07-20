import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

abstract class LocalDataStorage {
  /// Gets the cached [String Token] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<String> getUserToken();

  Future<User> getUser();

  Future<void> cacheUserToken(String token);

  Future<void> cacheUser(User user);
}

const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';
const CACHED_USER = 'CACHED_USER';

class LocalDataStorageImpl implements LocalDataStorage {
  final SharedPreferences sharedPreferences;

  LocalDataStorageImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUserToken(String token) async {
    Map<String, dynamic> myMap = {'jwt': token};
    sharedPreferences.setString(CACHED_USER_TOKEN, json.encode(myMap));
  }

  @override
  Future<void> cacheUser(User user) async {
    Map<String, dynamic> myMap = user.toJson();
    sharedPreferences.setString(CACHED_USER, json.encode(myMap));
  }

  @override
  Future<String> getUserToken() {
    final jsonString = sharedPreferences.getString(CACHED_USER_TOKEN);
    if (jsonString != null) {
      Map<String, dynamic> decoded = json.decode(json.decode(jsonString));

      return Future.value(decoded['jwt']);
    } else {
      throw CacheException();
    }
  }

  @override
  Future<User> getUser() {
    final jsonString = sharedPreferences.getString(CACHED_USER);
    if (jsonString != null) {
      Map<String, dynamic> decoded = json.decode(jsonString);
      final user = User.fromJson(decoded);
      return Future.value(user);
    } else {
      throw CacheException();
    }
  }
}
