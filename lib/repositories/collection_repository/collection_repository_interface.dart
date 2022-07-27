
import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/content/collection.dart';

abstract class ICollectionRepository {
  /// Creates the repository for collections
  const ICollectionRepository();
  /// Gets all existing collections
  Future<Either<Failure, List<Collection>>> getAllCollections();
  /// Gets a collection by its id
  Future<Either<Failure, Collection>> getCollectionWithId(int id);
  /// Creates a collection
  Future<Either<Failure, Collection>> createCollection(Collection collection);
  /// Deletes a collection
  Future<Either<Failure, void>> deleteCollectionWithId(int id);
}