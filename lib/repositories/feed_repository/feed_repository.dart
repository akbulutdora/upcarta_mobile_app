import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/models/repositories/feed_repository/feed_repository_interface.dart';

class FeedRepository implements IFeedRepository{
  final RemoteDataSource remoteDataSource;
  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;
  late String _appUserToken;
  late User _appUser;

  FeedRepository(
      {required this.remoteDataSource,
        required this.localDataStorage,
        required this.networkInfo});
  @override
  Future<Either<Failure,List<Content>>> getAllContents()async{
    // check connectivity
    final isConnected = await networkInfo.isConnected;
    if(isConnected){
      try{
        //devam edilecek
      } on ServerException{
        return Left(ServerFailure());
      }
    }else {
      return Left(ServerFailure());
    }
  }

}