import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';

abstract class LocalDataStorage {
  /// Gets the cached [String Token] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<String> getUserToken();

  Future<void> cacheUserToken(String token);
}

const CACHED_USER_TOKEN = 'CACHED_USER_TOKEN';


class LocalDataStorageImpl implements LocalDataStorage {
  final SharedPreferences sharedPreferences;

  LocalDataStorageImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUserToken(String token) {
    // TODO: implement cacheUserToken
    throw UnimplementedError();
  }

  @override
  Future<String> getUserToken() {
    final jsonString = sharedPreferences.getString('CACHED_USER_TOKEN');
    if (jsonString != null) {
      return Future.value(json.decode(jsonString)['jwt']);
    } else {
      throw CacheException();
    }
  }
  
  
}