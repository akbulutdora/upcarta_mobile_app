import 'package:upcarta_mobile_app/models/upcarta_user.dart';
import 'package:upcarta_mobile_app/core/api/http_client.dart';

abstract class RemoteDataSource {
  /// Calls the endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> authenticate({String email, String password});

  /// Calls the endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<String> register({String email, String password});
}