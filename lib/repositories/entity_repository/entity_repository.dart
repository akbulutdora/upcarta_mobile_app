import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/repositories/entity_repository/entity_repository_interface.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';

class EntityRepository implements IEntityRepository {
  final RemoteDataSource remoteDataSource;

  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;

  /// Entity repository
  EntityRepository(
      {required this.remoteDataSource,
      required this.localDataStorage,
      required this.networkInfo});

  @override
  Future<Either<Failure, Entity>> getEntityWithId(int id) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // get the entity from the remote data source
        final data = await remoteDataSource.getEntityWithId(id);
        final entity = Entity.fromJson(data!);
        return Right(entity);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, void>> followEntityWithId(int id) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        await remoteDataSource.followEntityWithId(id);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, void>> unfollowEntityWithId(int id) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        await remoteDataSource.unfollowEntityWithId(id);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<Entity>>> getAllEntities() async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // get the entities from the remote data source
        final data = await remoteDataSource.getAllEntities();
        final entities = List<Entity>.from(data!.map((model)=> Entity.fromJson(model)));
        return Right(entities);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<Entity>>> getEntityFollowers(int id) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // get the entity from the remote data source
        final data = await remoteDataSource.getEntityFollowers(id);
        final entities = List<Entity>.from(data!.map((model)=> Entity.fromJson(model)));
        return Right(entities);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, List<Entity>>> getEntityFollowing(int id) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // get the entity from the remote data source
        final data = await remoteDataSource.getEntityFollowing(id);
        final entities = List<Entity>.from(data!.map((model)=> Entity.fromJson(model)));
        return Right(entities);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
}
