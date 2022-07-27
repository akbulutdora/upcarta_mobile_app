import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';

abstract class IContentRepository {

  const IContentRepository();
  /// get a list of Contents
  Future<Either<Failure,List<Content>>> getAllContents();

  /// get the content with given id
  Future<Either<Failure, Content>> getContentWithId(int id);

  /// follow the entity with given id
  Future<Either<Failure, void>> followContent(int id);

  /// unfollow the entity with given id
  Future<Either<Failure, void>> unfollowContent(int id);

  /// creates new content
  Future<Either<Failure, void>> createContent(Content content);

  /// deletes the content with id
  Future<Either<Failure, void>> deleteContent(int id);

  /// add the content to saved collection
  Future<Either<Failure, void>> saveContent(int id);

  /// delete the content from the saved collection
  Future<Either<Failure, void>> deleteContentSave(int id);

  /// marks content as finished and adds to finished collection
  Future<Either<Failure, void>> markContentAsFinished(int id);

  ///remove content from finished
  Future<Either<Failure, void>> unmarkContentAsFinished(int id);

  Future<Either<Failure, void>> addContentToCollection(int id);

  Future<Either<Failure, void>> deleteCollectionContent(int id);


}