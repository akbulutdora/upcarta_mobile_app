// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Collection _$$_CollectionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['entity_id'],
  );
  return _$_Collection(
    id: json['id'] as int?,
    title: json['title'] as String,
    entityId: json['entity_id'] as int,
    entity: json['entity'] == null
        ? null
        : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    addedBy: json['added_by'] == null
        ? null
        : Entity.fromJson(json['added_by'] as Map<String, dynamic>),
    addedById: json['added_by_id'] as int?,
    description: json['description'] as String?,
    slug: json['slug'] as String?,
    type: $enumDecode(_$CollectionTypeEnumMap, json['type']),
    sort: $enumDecodeNullable(_$CollectionSortEnumMap, json['sort']),
    createdAtStr: json['created_at_str'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdAtAccuracy: $enumDecodeNullable(
        _$CollectionCreatedAtAccuracyEnumMap, json['created_at_accuracy']),
    link: json['link'] as String?,
    sourceContent: json['source_content'] == null
        ? null
        : Content.fromJson(json['source_content'] as Map<String, dynamic>),
    sourceContentId: json['source_content_id'] as int?,
    visibility:
        $enumDecodeNullable(_$CollectionVisibilityEnumMap, json['visibility']),
    verifiedAt: json['verified_at'] == null
        ? null
        : DateTime.parse(json['verified_at'] as String),
    featuredAt: json['featured_at'] == null
        ? null
        : DateTime.parse(json['featured_at'] as String),
    recommended: json['recommended'] as bool?,
    publishedAt: json['published_at'] == null
        ? null
        : DateTime.parse(json['published_at'] as String),
    collectionTopics: (json['collection_topics'] as List<dynamic>?)
        ?.map((e) => Topic.fromJson(e as Map<String, dynamic>))
        .toList(),
    insertedAt: json['inserted_at'] == null
        ? null
        : DateTime.parse(json['inserted_at'] as String),
  );
}

Map<String, dynamic> _$$_CollectionToJson(_$_Collection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'entity_id': instance.entityId,
      'entity': instance.entity?.toJson(),
      'added_by': instance.addedBy?.toJson(),
      'added_by_id': instance.addedById,
      'description': instance.description,
      'slug': instance.slug,
      'type': _$CollectionTypeEnumMap[instance.type],
      'sort': _$CollectionSortEnumMap[instance.sort],
      'created_at_str': instance.createdAtStr,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_at_accuracy':
          _$CollectionCreatedAtAccuracyEnumMap[instance.createdAtAccuracy],
      'link': instance.link,
      'source_content': instance.sourceContent?.toJson(),
      'source_content_id': instance.sourceContentId,
      'visibility': _$CollectionVisibilityEnumMap[instance.visibility],
      'verified_at': instance.verifiedAt?.toIso8601String(),
      'featured_at': instance.featuredAt?.toIso8601String(),
      'recommended': instance.recommended,
      'published_at': instance.publishedAt?.toIso8601String(),
      'collection_topics':
          instance.collectionTopics?.map((e) => e.toJson()).toList(),
      'inserted_at': instance.insertedAt?.toIso8601String(),
    };

const _$CollectionTypeEnumMap = {
  CollectionType.saved: 'saved',
  CollectionType.finished: 'finished',
  CollectionType.personal: 'personal',
  CollectionType.contributor: 'external',
  CollectionType.internalAsk: 'internal_ask',
  CollectionType.externalAsk: 'external_ask',
  CollectionType.later: 'later',
};

const _$CollectionSortEnumMap = {
  CollectionSort.manual: 'manual',
  CollectionSort.recentlyAdded: 'recently_added',
  CollectionSort.creationAsc: 'creation_asc',
  CollectionSort.creationDesc: 'creation_desc',
  CollectionSort.popularity: 'popularity',
};

const _$CollectionCreatedAtAccuracyEnumMap = {
  CollectionCreatedAtAccuracy.year: 'year',
  CollectionCreatedAtAccuracy.month: 'month',
  CollectionCreatedAtAccuracy.day: 'day',
  CollectionCreatedAtAccuracy.hour: 'hour',
};

const _$CollectionVisibilityEnumMap = {
  CollectionVisibility.private: 'private',
  CollectionVisibility.public: 'public',
};
