import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/contributor.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';
import 'package:upcarta_mobile_app/models/topic.dart';
import 'package:upcarta_mobile_app/models/contributor.dart.dart';

part 'upcarta_content.freezed.dart';

part 'upcarta_content.g.dart';

enum Type {
  @JsonValue('video')
  video,
  @JsonValue('article')
  article,
  @JsonValue('podcast_episode')
  podcastEpisode,
  @JsonValue('book')
  book,
  @JsonValue('course')
  course,
  @JsonValue('tweet')
  tweet,
  @JsonValue('presentation')
  presentation,
  @JsonValue('paper')
  paper,
  @JsonValue('audio')
  audio,
  @JsonValue('documentary')
  documentary,
  @JsonValue('website')
  website,
  @JsonValue('report')
  report,
  @JsonValue('transcript')
  transcript,
  @JsonValue('forum_post')
  forumPost,
  @JsonValue('movie')
  movie,
  @JsonValue('series')
  series,
  @JsonValue('channel')
  channel,
  @JsonValue('blog')
  blog,
  @JsonValue('newsletter')
  newsletter,
  @JsonValue('podcast')
  podcast,
  @JsonValue('tv_episode')
  tvEpisode,

}

@freezed
class Content with _$Content {
  const factory Content({
    int? id,
    required String title,
    String? description,
    Type? type,
    // obje olarak addedBy da ne tutuluyor sadece isim mi user mı ?
    @JsonKey(name: 'added_by') User? addedBy,
    @JsonKey(name: 'content_topics') List<Topic>? contentTopics,
    // contributitions ne objesi
    List<Contributor> contributions,
    // content linkler string olucak onlari string olarak mi sakliyoruz
    // TODO : * at least one link is required
    // liste gonderilmesini zorunlu kilarak ici bos olmasini kontrol edemiyoruz
    @JsonKey(name: 'content_links', required: true) List<String> contentLinks,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'created_at_accuracy') String? createdAtAccuracy,
    @JsonKey(name: 'inserted_at') Timestamp? insertedAt,
    @JsonKey(name: 'updated_at') Timestamp? updatedAt,

  }) = _Content;

  factory Content.fromJson(Map<String, Object?> json) => _$ContentFromJson(json);
}
