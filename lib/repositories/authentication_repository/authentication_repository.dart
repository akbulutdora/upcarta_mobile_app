import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository_interface.dart';
// import 'package:upcarta_mobile_app/api/http_client.dart';
import 'package:upcarta_mobile_app/core/api/virtual_api.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final VirtualDB _db;
  var userId = -1;

  /// Authentication repository
  AuthenticationRepository(this._db);

  @override
  Future<Either<Failure, User>>  authenticate(String username, String password) async {
    try {
      var item = await _db.findByUsername(username);
      if (item!['password'] == password) {
        item['login'] = true;
        _db.update(item);
        return Future.delayed(const Duration(seconds: 1), () => User(email: ''));
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<Either<Failure, User>>  register(String username, String password) async {
    try {
      userId = await _db.insert(
          {'username': username, 'password': password, 'login': true});
      return User.fromJson('');
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
