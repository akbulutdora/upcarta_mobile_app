import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/repositories/authentication_repository/authentication_repository.dart';
import 'package:upcarta_mobile_app/repositories/entity_repository/entity_repository.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';

class EntityService {
  const EntityService(
      {required this.entityRepository, required this.authenticationRepository});

  final EntityRepository entityRepository;
  final AuthenticationRepository authenticationRepository;

  /// get entity
  Future<Either<Failure, Entity>> getEntityById(int id) {
    return entityRepository.getEntityWithId(
        token: authenticationRepository.appUserToken, id: id);
  }

  /// get a list of entities
  Future<Either<Failure, List<Entity>>> getAllEntities() {
    return Future.value(Left(ServerFailure()));
  }
}
