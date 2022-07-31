import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository_interface.dart';

enum AuthenticationStatus { authenticated, unauthenticated, uninitialized, prelanded }

class AuthenticationRepository implements IAuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final RemoteDataSource remoteDataSource;

  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;
  late String _appUserToken;
  late User _appUser;

  /// Authentication repository
  AuthenticationRepository(
      {required this.remoteDataSource,
      required this.localDataStorage,
      required this.networkInfo
      }){ _appUser = User.empty;}

  // authenticate the user with email and password
  @override
  Future<Either<Failure, User>> authenticate(
      String email, String password) async {
    // check connectivity
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // authenticate the user and retrieve user information
        final data = await remoteDataSource.login(
            email: email, password: password);
        final appUser = data![0];
        final token = data[1];

        // cache the user information
        localDataStorage.cacheUser(appUser);
        _controller.add(AuthenticationStatus.authenticated);
        _appUser = appUser;
        return Right(appUser);
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
  Future<void> logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);
    localDataStorage.deleteAllCached();
    _appUser = User.empty;
    _appUserToken = '';
  }

  void dispose() => _controller.close();

  @override
  String get appUserToken => _appUserToken;

  @override
  User get appUser => _appUser;

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

}
