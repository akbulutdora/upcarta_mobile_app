abstract class IAuthenticationRepository {
  /// Creates the repository for authenticating an user
  const IAuthenticationRepository();

  /// Email of the signed user
  String get signedEmail;

  /// Login with username and password
  Future<bool> authenticate(String username, String password);

  /// Registration with username and password
  Future<bool> register(String username, String password);

  /// Logout
  Future<void> logOut();
}
