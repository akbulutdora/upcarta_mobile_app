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

  @override
  Future<Either<Failure, String>> authenticate(
      String email, String password) async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final userInfo = await remoteDataSource.authenticate(
            email: email, password: password);
        final userToken = userInfo[0];
        final User appUser = userInfo[1];
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
  String get appUserToken => _appUserToken;

  @override
  User get appUser => _appUser;

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
