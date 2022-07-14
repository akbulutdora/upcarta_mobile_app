import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository_interface.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  final RemoteDataSource remoteDataSource;

  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;
  late String userId;

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
      print('atRemovePart');
      try {
        final userToken = await remoteDataSource.authenticate(
            email: email, password: password);
        localDataStorage.cacheUserToken(userToken);

        return Right(userToken);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      print('atLocalPart');
      try {
        final userToken = await localDataStorage.getUserToken();
        return Right(userToken);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, String>> register(
      String username, String password) async {
    return Left(ServerFailure());
  }

  @override
  Future<void> logOut() async {}

  @override
  String get signedEmail => 'email';
}
