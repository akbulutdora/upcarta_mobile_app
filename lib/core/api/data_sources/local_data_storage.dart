import 'package:upcarta_mobile_app/models/upcarta_user.dart';

abstract class LocalDataStorage {
  /// Gets the cached [String Token] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<String> getUserToken();

  Future<void> cacheUserToken(String token);
}