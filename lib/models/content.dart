import 'package:json_annotation/json_annotation.dart';

part "content.g.dart";

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
class Content {
  final String title;
  final String createDate;
  final ContentType contentType;
  final String uId;
  final String postId;
  final String username;
  final String contentTopic;
  List<String> recommendersIDs;
  final String recommendationText;
  final String imageLocation;
  final String description;
  final String url;



  Content({
    required this.title,
    required this.uId,
    required this.postId,
    required this.username,
    required this.contentType,
    this.description = "This content has no description.",
    required this.createDate,
    required this.imageLocation,
    required this.url,
    required this.contentTopic,
    required this.recommendationText,
    required this.recommendersIDs,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
