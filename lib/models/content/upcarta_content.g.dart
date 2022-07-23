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
    slug: json['slug'] as String?,
    type: $enumDecodeNullable(_$ContentTypeEnumMap, json['type']),
    parent: json['parent'] == null
        ? null
        : Content.fromJson(json['parent'] as Map<String, dynamic>),
    children: (json['children'] as List<dynamic>?)
        ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
        .toList(),
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
    publicCollectionsCount: json['public_collections_count'] as int?,
    featuredRecommendersCount: json['featured_recommenders_count'] as int?,
    contextRecommendersCount: json['context_recommenders_count'] as int?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdAtAccuracy: $enumDecodeNullable(
        _$CreatedAtAccuracyEnumMap, json['created_at_accuracy']),
    createdAtStr: json['created_at_str'] as String?,
    followable: json['followable'] as bool?,
    personalCurations: (json['personal_curations'] as List<dynamic>?)
        ?.map((e) => Curation.fromJson(e as Map<String, dynamic>))
        .toList(),
    personalCollections: (json['personal_collections'] as List<dynamic>?)
        ?.map((e) => Collection.fromJson(e as Map<String, dynamic>))
        .toList(),
    contentFollowing: json['content_following'] == null
        ? null
        : User.fromJson(json['content_following'] as Map<String, dynamic>),
    insertedAt: json['inserted_at'] == null
        ? null
        : DateTime.parse(json['inserted_at'] as String),
  );
}

Map<String, dynamic> _$$_ContentToJson(_$_Content instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'slug': instance.slug,
      'type': _$ContentTypeEnumMap[instance.type],
      'parent': instance.parent?.toJson(),
      'children': instance.children?.map((e) => e.toJson()).toList(),
      'added_by': instance.addedBy?.toJson(),
      'added_by_id': instance.addedById,
      'content_topics': instance.contentTopics?.map((e) => e.toJson()).toList(),
      'contributions': instance.contributions?.map((e) => e.toJson()).toList(),
      'content_links': instance.contentLinks.map((e) => e.toJson()).toList(),
      'content_links_count': instance.contentLinksCount,
      'recommenders_count': instance.recommendersCount,
      'followers_count': instance.followersCount,
      'public_collections_count': instance.publicCollectionsCount,
      'featured_recommenders_count': instance.featuredRecommendersCount,
      'context_recommenders_count': instance.contextRecommendersCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_at_accuracy':
          _$CreatedAtAccuracyEnumMap[instance.createdAtAccuracy],
      'created_at_str': instance.createdAtStr,
      'followable': instance.followable,
      'personal_curations':
          instance.personalCurations?.map((e) => e.toJson()).toList(),
      'personal_collections':
          instance.personalCollections?.map((e) => e.toJson()).toList(),
      'content_following': instance.contentFollowing?.toJson(),
      'inserted_at': instance.insertedAt?.toIso8601String(),
    };

const _$ContentTypeEnumMap = {
  ContentType.video: 'video',
  ContentType.article: 'article',
  ContentType.podcastEpisode: 'podcast_episode',
  ContentType.book: 'book',
  ContentType.course: 'course',
  ContentType.tweet: 'tweet',
  ContentType.presentation: 'presentation',
  ContentType.paper: 'paper',
  ContentType.audio: 'audio',
  ContentType.documentary: 'documentary',
  ContentType.website: 'website',
  ContentType.report: 'report',
  ContentType.transcript: 'transcript',
  ContentType.forumPost: 'forum_post',
  ContentType.movie: 'movie',
  ContentType.series: 'series',
  ContentType.channel: 'channel',
  ContentType.blog: 'blog',
  ContentType.newsletter: 'newsletter',
  ContentType.podcast: 'podcast',
  ContentType.tvEpisode: 'tv_episode',
};

const _$CreatedAtAccuracyEnumMap = {
  CreatedAtAccuracy.year: 'year',
  CreatedAtAccuracy.month: 'month',
  CreatedAtAccuracy.day: 'day',
  CreatedAtAccuracy.hour: 'hour',
};
