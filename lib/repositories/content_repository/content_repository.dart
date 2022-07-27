import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/local_data_storage.dart';
import 'package:upcarta_mobile_app/core/api/data_sources/remote_data_source.dart';
import 'package:upcarta_mobile_app/core/error/exception.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/core/platform/network_info.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/repositories/content_repository/content_repository_interface.dart';

class ContentRepository implements IContentRepository {
  final RemoteDataSource remoteDataSource;
  final LocalDataStorage localDataStorage;
  final NetworkInfo networkInfo;
  late String _appUserToken;
  late User _appUser;

  ContentRepository(
      {
      required this.remoteDataSource,
      required this.localDataStorage,
      required this.networkInfo
      });

  @override
  Future<Either<Failure, List<Content>>> getAllContents() async {
    // check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {

        final data = await remoteDataSource.getAllContents();
        final contents = List<Content>.from(data!.map((model)=>Content.fromJson(model)));
        return Right(contents);
        
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, Content>> getContentWithId(int id) async {
    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        final data = await remoteDataSource.getContentWithId(id);
        //unlem ne ise yariyor ?
        final content = Content.fromJson(data!);

        return Right(content);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  // todo : api endpoint gelince implement edilecek
  @override
  Future<Either<Failure, void>> followContent(int id)async{
    // TODO: implement followContent
    throw UnimplementedError();
    /*//check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        //todo: remoteDataSource.followContentWithId yazilacak
        await remoteDataSource.followContent(id);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    } */

  }
  //todo: api endpoint geldigi zaman implemente edilecek
  @override
  Future<Either<Failure, void>> unfollowContent(int id)async{
         // TODO: implement unfollowContent
    throw UnimplementedError();/*
    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        // todo: remoteDataSource.unfollowContentWithId() yazilacak
        await remoteDataSource.unfollowContent(id);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }*/

  }


  @override
  Future<Either<Failure, Content?>> createContent(Content content)async{

    //check connectivity
    final isConnected = await networkInfo.isConnected;

    if (isConnected) {
      try {
        // content mi donmeli yoksa json hali mi onun ?
        // bir sey dondurmeli mi yoksa void fonksiyon mu yapiyim aynisi api request icin de gecerli
        final response = await remoteDataSource.createContent(content.toJson());
        return Right(Content.fromJson(response!));
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, void>> deleteContent(int id)async{

    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        await remoteDataSource.deleteContent(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, void>> saveContent(int id)async{

    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {

        await remoteDataSource.saveContent(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, void>> deleteContentSave(int id)async{

    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {

        await remoteDataSource.deleteContentSave(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, void>> markContentAsFinished(int id)async{
    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        await remoteDataSource.markContentAsFinished(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, void>> unmarkContentAsFinished(int id)async{

    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        await remoteDataSource.unmarkContentAsFinished(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

  @override
  Future<Either<Failure, void>> addContentToCollection(int id)async{
    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        await remoteDataSource.addContentToCollection(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteCollectionContent(int id)async{
    //check connectivity
    final isConnected = await networkInfo.isConnected;
    if (isConnected) {
      try {
        await remoteDataSource.deleteCollectionContent(id);
        return const Right(null);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }

  }

}
