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

// IS IT BETTER TO MAKE TYPE ENUM (will implement a function for getting string) OR STRING?
extension ParseToString on ContentType {
  String getString() {
    return toString().split('.').last;
  }
}

@JsonSerializable()
class Content {
  final String title;
  final int id;
  final ContentType contentType;
  final String description;
  final String created_at;
  final String image;
  final String link;
  final String added_by_id; // (id of the user who added this content initially)
  final String author_id;
  /*parent_id (you may include this self-referential association to keep track of multiple links referring to the same content)
  featured_at (you can use it for featuring specific collections)
  slug (slugified title for clean url sharing - you may leave it out of your scope)*/

  Content({
    required this.title,
    required this.id,
    required this.contentType,
    this.description = "This content has no description.",
    required this.created_at,
    required this.image,
    required this.added_by_id,
    required this.link,
    required this.author_id,
  });

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}
