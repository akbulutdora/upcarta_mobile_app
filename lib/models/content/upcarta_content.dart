import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/models/content/topic.dart';
import 'package:upcarta_mobile_app/models/content/content_details.dart';

import 'content_link.dart';
import 'content_topic.dart';

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
enum CreatedAtAccuracy{
  @JsonValue('year')
  year,
  @JsonValue('month')
  month,
  @JsonValue('day')
  day,
  @JsonValue('hour')
  hour,
}

@freezed
class Content with _$Content {
  const factory Content({
    int? id,
    required String title,
    String? description,
    Type? type,
    ContentDetails? details,
    // obje olarak addedBy da ne tutuluyor sadece isim mi user mı ?
    @JsonKey(name: 'added_by') Entity? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,
    @JsonKey(name: 'content_topics') List<ContentTopic>? contentTopics,
    List<Contribution>? contributions,
    // content linkler string olucak onlari string olarak mi sakliyoruz
    // TODO : * at least one link is required
    // liste gonderilmesini zorunlu kilarak ici bos olmasini kontrol edemiyoruz
    @JsonKey(name: 'content_links', required: true) required List<ContentLink> contentLinks,
    @JsonKey(name: 'content_links_count') int? contentLinksCount,

    @JsonKey(name: 'recommenders_count')  int? recommendersCount,
    @JsonKey(name: 'followers_count')     int? followersCount,

    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'created_at_accuracy') CreatedAtAccuracy? createdAtAccuracy,

    @JsonKey(name: 'featured_at') DateTime? featuredAt,
    @JsonKey(name: 'inserted_at') DateTime? insertedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,

  }) = _Content;

  factory Content.fromJson(Map<String, Object?> json) => _$ContentFromJson(json);
}
