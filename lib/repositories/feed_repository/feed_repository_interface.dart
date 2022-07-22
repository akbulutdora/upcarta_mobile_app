import 'package:dartz/dartz.dart';
import 'package:upcarta_mobile_app/core/error/failures.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_content.dart';

abstract class IFeedRepository {

  const IFeedRepository();
  //content listesini classin icinde tutman gerekir mi ?
  Future<Either<Failure,List<Content>>> getAllContents();


}