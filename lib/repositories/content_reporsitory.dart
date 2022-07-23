import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository_interface.dart';

class ContentRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;

  late String userId;

  ContentRepository(
      {required this.remoteDataSource,
      required this.localDataStorage,
      required this.networkInfo});

  Future<Either<Failure, IList<Content>>> getAllContents() async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        final decoded = await remoteDataSource.getAllContents();

        List<Content> contents =
            List<Content>.from(decoded!.map((e) => Content.fromJson(e)));

        print(IList.from(contents).toString());

        return Right(IList.from(contents));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
