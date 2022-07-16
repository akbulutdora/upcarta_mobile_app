// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcarta_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Content _$$_ContentFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['content_links'],
  );
  return _$_Content(
    id: json['id'] as int?,
    title: json['title'] as String,
    description: json['description'] as String?,
    type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
    details: json['details'] == null
        ? null
        : ContentDetails.fromJson(json['details'] as Map<String, dynamic>),
    addedBy: json['added_by'] == null
        ? null
        : Entity.fromJson(json['added_by'] as Map<String, dynamic>),
    addedById: json['added_by_id'] as int?,
    contentTopics: (json['content_topics'] as List<dynamic>?)
        ?.map((e) => ContentTopic.fromJson(e as Map<String, dynamic>))
        .toList(),
    contributions: (json['contributions'] as List<dynamic>?)
        ?.map((e) => Contribution.fromJson(e as Map<String, dynamic>))
        .toList(),
    contentLinks: (json['content_links'] as List<dynamic>)
        .map((e) => ContentLink.fromJson(e as Map<String, dynamic>))
        .toList(),
    contentLinksCount: json['content_links_count'] as int?,
    recommendersCount: json['recommenders_count'] as int?,
    followersCount: json['followers_count'] as int?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdAtAccuracy: $enumDecodeNullable(
        _$CreatedAtAccuracyEnumMap, json['created_at_accuracy']),
    featuredAt: json['featured_at'] == null
        ? null
        : DateTime.parse(json['featured_at'] as String),
    insertedAt: json['inserted_at'] == null
        ? null
        : DateTime.parse(json['inserted_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': _$TypeEnumMap[instance.type],
      'details': instance.details,
      'added_by': instance.addedBy,
      'added_by_id': instance.addedById,
      'content_topics': instance.contentTopics,
      'contributions': instance.contributions,
      'content_links': instance.contentLinks,
      'content_links_count': instance.contentLinksCount,
      'recommenders_count': instance.recommendersCount,
      'followers_count': instance.followersCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_at_accuracy':
          _$CreatedAtAccuracyEnumMap[instance.createdAtAccuracy],
      'featured_at': instance.featuredAt?.toIso8601String(),
      'inserted_at': instance.insertedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

const _$TypeEnumMap = {
  Type.video: 'video',
  Type.article: 'article',
  Type.podcastEpisode: 'podcast_episode',
  Type.book: 'book',
  Type.course: 'course',
  Type.tweet: 'tweet',
  Type.presentation: 'presentation',
  Type.paper: 'paper',
  Type.audio: 'audio',
  Type.documentary: 'documentary',
  Type.website: 'website',
  Type.report: 'report',
  Type.transcript: 'transcript',
  Type.forumPost: 'forum_post',
  Type.movie: 'movie',
  Type.series: 'series',
  Type.channel: 'channel',
  Type.blog: 'blog',
  Type.newsletter: 'newsletter',
  Type.podcast: 'podcast',
  Type.tvEpisode: 'tv_episode',
};

const _$CreatedAtAccuracyEnumMap = {
  CreatedAtAccuracy.year: 'year',
  CreatedAtAccuracy.month: 'month',
  CreatedAtAccuracy.day: 'day',
  CreatedAtAccuracy.hour: 'hour',
};
