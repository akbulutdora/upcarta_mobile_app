import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository_interface.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final RemoteDataSource remoteDataSource;

  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;
  late String _appUserToken;
  late User _appUser;

  /// Authentication repository
  AuthenticationRepository(
      {required this.remoteDataSource,
      required this.localDataStorage,
      required this.networkInfo});

  // authenticate the user with email and password
  @override
  Future<Either<Failure, String>> authenticate(
      String email, String password) async {
    // check connectivity
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // authenticate the user and retrieve user information
        final userInfo = await remoteDataSource.authenticate(
            email: email, password: password);
        final userToken = userInfo[0];
        final User appUser = userInfo[1];

        // cache the user information
        localDataStorage.cacheUserToken(userToken);
        localDataStorage.cacheUser(appUser);
        _appUser = appUser;
        _appUserToken = userToken;

        return Right(userToken);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, String>> register(
      String username, String password) async {
    return Left(ServerFailure());
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    // make _appUser and _appUserToken empty or null
    // make cached user and user token empty or null
    throw UnimplementedError();
  }

  @override
  String get appUserToken => _appUserToken;

  @override
  User get appUser => _appUser;
}
