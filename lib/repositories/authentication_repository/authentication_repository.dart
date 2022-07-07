import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository_interface.dart';
// import 'package:upcarta_mobile_app/api/http_client.dart';
import 'package:upcarta_mobile_app/api/virtual_api.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final VirtualDB _db;
  var userId = -1;

  /// Authentication repository
  AuthenticationRepository(this._db);

  @override
  Future<bool> authenticate(String username, String password) async {
    try {
      var item = await _db.findByUsername(username);
      if (item!['password'] == password) {
        item['login'] = true;
        _db.update(item);
        return true;
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> register(String username, String password) async {
    try {
      userId = await _db.insert(
          {'username': username, 'password': password, 'login': true});
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<void> logOut() async {

  }

  @override
  String get signedEmail => 'email';
}
