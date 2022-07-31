import 'dart:async';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:dartz/dartz.dart';

//TODO: fix comments

abstract class IUserRepository {
  /// Creates the repository for users
  const IUserRepository();

  /// Get current user, async in implementation
  Future<Either<Exception,User?>> getUser();

}
