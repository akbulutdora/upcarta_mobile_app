import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';

abstract class IAuthenticationRepository {
  /// Creates the repository for authenticating an user
  const IAuthenticationRepository();

  /// Login with username and password
  Future<Either<Failure, String>> authenticate(String username, String password);

  /// Registration with username and password
  Future<Either<Failure, String>> register(String username, String password);

  /// Logout
  Future<void> logOut();

  /// Email of the signed user
  String get signedEmail;
}
