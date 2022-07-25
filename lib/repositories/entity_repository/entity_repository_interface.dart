import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

abstract class IEntityRepository {
  /// Creates the repository for entities
  const IEntityRepository();

  /// get the entity with given id
  Future<Either<Failure, Entity>> getEntityWithId(int id);

  /// follow the entity with given id
  Future<Either<Failure, void>> followEntityWithId(int id);

  /// unfollow the entity with given id
  Future<Either<Failure, void>> unfollowEntityWithId(int id);

  /// get a list of entities
  Future<Either<Failure, List<Entity>>> getAllEntities();

  /// get the list of entity followers
 Future<Either<Failure, List<Entity>>> getEntityFollowers(int id);


  /// get the list of entity followings
  Future<Either<Failure, List<Entity>>> getEntityFollowing(int id);
}
