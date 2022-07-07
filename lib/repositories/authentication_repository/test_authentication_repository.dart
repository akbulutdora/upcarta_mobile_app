import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository_interface.dart';

class TestAuthenticationRepository implements IAuthenticationRepository {
  /// The email of the user
  final String fakeEmail;

  /// Determines whether the methods will fail or not
  final bool success;

  /// Mock authentication repository (for testing)
  const TestAuthenticationRepository({
    required this.fakeEmail,
    required this.success,
  });

  @override
  Future<bool> authenticate(String username, String password) {
    return Future<bool>.delayed(const Duration(seconds: 1), () => success);
  }

  @override
  Future<bool> register(String username, String password) {
    return Future<bool>.delayed(const Duration(seconds: 1), () => success);
  }

  @override
  Future<void> logOut() => Future.delayed(const Duration(seconds: 2));

  @override
  String get signedEmail => fakeEmail;
}