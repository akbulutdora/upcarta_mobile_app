import 'package:json_annotation/json_annotation.dart';

part "collection.g.dart";

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
enum ContentType {
  @JsonValue(0)
  video,
  @JsonValue(1)
  article,
  @JsonValue(2)
  podcastEpisode,
  @JsonValue(3)
  book,
  @JsonValue(4)
  course,
  @JsonValue(5)
  tweet,
  @JsonValue(6)
  presentation,
  @JsonValue(7)
  paper,
  @JsonValue(8)
  audio,
  @JsonValue(9)
  documentary,
  @JsonValue(10)
  website,
  @JsonValue(11)
  report,
  @JsonValue(12)
  transcript,
  @JsonValue(13)
  forumPost,
  @JsonValue(14)
  movie,
  @JsonValue(15)
  series,
  @JsonValue(16)
  channel,
  @JsonValue(17)
  blog,
  @JsonValue(18)
  newsletter,
  @JsonValue(19)
  podcast,
  @JsonValue(20)
  tvEpisode
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
    this.description = "This content has no description.",
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
