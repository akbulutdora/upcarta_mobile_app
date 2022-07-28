import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/content/collection.dart';
import 'package:upcarta_mobile_app/repositories/collection_repository/collection_repository_interface.dart';

class CollectionRepository implements ICollectionRepository {
  final RemoteDataSource remoteDataSource;

  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;

  /// Collection repository
  CollectionRepository(
      {required this.remoteDataSource,
        required this.localDataStorage,
        required this.networkInfo});


  @override
  Future<Either<Failure, List<Collection>>> getAllCollections() async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        // get the entities from the remote data source
        final data = await remoteDataSource.getAllCollections();
        final collections = List<Collection>.from(data!.map((model)=> Collection.fromJson(model)));
        return Right(collections);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, Collection>> getCollectionWithId(int id) async {
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // get the entity from the remote data source
        final data = await remoteDataSource.getCollectionWithId(id);
        final collection = Collection.fromJson(data!);
        return Right(collection);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }
  @override
  Future<Either<Failure, Collection>> createCollection(Collection collection) async {
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        // get the entity from the remote data source
        final data = await remoteDataSource.createCollection(collection.toJson());
        final responseCollection = Collection.fromJson(data!);
        return Right(responseCollection);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
    return Left(ServerFailure());
  }

  @override
  Future<Either<Failure, void>> deleteCollectionWithId(int id) {
    // TODO: implement deleteCollectionWithId
    throw UnimplementedError();
  }



}