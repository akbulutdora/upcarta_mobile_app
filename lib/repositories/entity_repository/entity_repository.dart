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
  Future<Either<Failure, Entity>> getEntityWithId(
      {required String token, required int id}) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // get the entity from the remote data source
        final data = await remoteDataSource.getEntityById(id);
        final entity = Entity.fromJson(data!);
        return Right(entity);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, void>> followEntityWithId(int id) {
    // TODO: implement followEntityWithId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> unfollowEntityWithId(int id) {
    // TODO: implement unfollowEntityWithId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Entity>>> getAllEntities() {
    // TODO: implement getAllEntities
    throw UnimplementedError();
  }
}
