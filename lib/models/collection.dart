import 'package:json_annotation/json_annotation.dart';
import 'package:upcarta_mobile_app/models/content.dart';
part 'collection.g.dart';

enum CollectionType {
  @JsonValue(0)
  saved,
  @JsonValue(1)
  recommendations,
  @JsonValue(2)
  collection,
  @JsonValue(3)
  ask,
}

@JsonSerializable()
class Collection {
  final String collectionId;
  final CollectionType collectionType;
  final String ownerId;
  final String description;
  final String creationDate;
  List<String> recommendersIDs;
  List<String> postIDs;
  final bool isAsk;
  final ContentType contentType;
  final bool isPrivate;

  Collection({
    required this.collectionId,
    required this.collectionType,
    required this.ownerId,
    this.description = 'This content has no description.',
    required this.creationDate,
    required this.recommendersIDs,
    required this.postIDs,
    required this.isAsk,
    required this.contentType,
    required this.isPrivate,
  });

  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);
}
