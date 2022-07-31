import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/user_repository/user_repository_interface.dart';

import '../../core/api/data_sources/local_data_storage.dart';
import '../../core/error/failures.dart';

class UserRepository implements IUserRepository{

  final LocalDataStorage localDataStorage;

  User? _user;

  UserRepository({required this.localDataStorage});

  @override
  Future<Either<Exception,User?>> getUser() async {
    if( _user != null ) return Right(_user);
    try{
      final data = await localDataStorage.getUser();
      return Right(data);
    } on CacheException{
      return Left(CacheException());
    }
  }


}