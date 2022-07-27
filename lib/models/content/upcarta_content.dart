import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/models/content/topic.dart';
import 'package:upcarta_mobile_app/models/content/details.dart';
import 'package:upcarta_mobile_app/models/content/curation.dart';
import 'package:upcarta_mobile_app/models/content/collection.dart';


import 'content_link.dart';
import 'content_topic.dart';

part 'upcarta_content.freezed.dart';

part 'upcarta_content.g.dart';

enum ContentType {
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

    /// auto-generated on the back-end (used for generating the SEO friendly URL of the content)
    String? slug,

    /// video, article, podcast_episode, book, course, tweet, presentation, paper, audio, documentary
    /// website, report, transcript, forum_post, movie, series, channel ,blog, newsletter, podcast, tv_episode
    ContentType? type,

    ///  Content object (used for assigning podcast show to podcast episodes).
    Content? parent,

    /// array of content objects (used for assigning podcast show to podcast episodes).
    List<Content>? children,

    /// The entity object who added this content. Null if added automatically
    @JsonKey(name: 'added_by') Entity? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,

    @JsonKey(name: 'content_topics') List<ContentTopic>? contentTopics,
    List<Contribution>? contributions,

    // * at least one link is required documantasyonda
    // liste gonderilmesini zorunlu kilarak ici bos olmasini kontrol edemiyoruz
    @JsonKey(name: 'content_links', required: true) required List<ContentLink> contentLinks,

    /// counter for the number of links related to this content
    @JsonKey(name: 'content_links_count') int? contentLinksCount,

    /// counter for the number of different recommending entities
    @JsonKey(name: 'recommenders_count')  int? recommendersCount,

    /// counter for the number of entities following this content (podcast show, blog, newsletter, channel).
    @JsonKey(name: 'followers_count')     int? followersCount,

    /// counter for the number of public collections that include this content
    @JsonKey(name: 'public_collections_count')int? publicCollectionsCount,

    /// counter for the number of featured recommenders that appear under the content count related to user's followings.
    @JsonKey(name: 'featured_recommenders_count')int? featuredRecommendersCount,

    /// counter for the number of recommenders that appear on the context (ask, top feed, etc.)
    @JsonKey(name: 'context_recommenders_count')int? contextRecommendersCount,

    @JsonKey(name: 'created_at') DateTime? createdAt,

    /// year, month, day, hour
    @JsonKey(name: 'created_at_accuracy') CreatedAtAccuracy? createdAtAccuracy,

    /// Nullable. Required formats: "YYYY" "YYYY-MM" "YYYY-MM-DD" "YYYY-MM-DD HH:MM:SS"
    @JsonKey(name: 'created_at_str') String? createdAtStr,

    /// true if the content is followable (like a podcast show, newsletter, etc.)
    bool? followable,

    /// Indicates a list of personal curation objects for the authenticated user
    @JsonKey(name: 'personal_curations') List<Curation>? personalCurations,

    ///  Indicates a list of personal collection objects for the authenticated user
    @JsonKey(name: 'personal_collections') List<Collection>? personalCollections,

    /// Indicates whether this content is followed by the authenticated user.
    @JsonKey(name: 'content_following') User? contentFollowing,

    @JsonKey(name: 'inserted_at') DateTime? insertedAt,

  }) = _Content;

  factory Content.fromJson(Map<String, Object?> json) => _$ContentFromJson(json);
}
