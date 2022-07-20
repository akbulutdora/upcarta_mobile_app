// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Curation _$$_CurationFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['entity_id', 'content_id'],
  );
  return _$_Curation(
    id: json['id'] as int?,
    entityId: json['entity_id'] as int,
    entity: json['entity'] == null
        ? null
        : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    createdAtAccuracy: $enumDecodeNullable(
        _$CurationCreatedAtAccuracyEnumMap, json['created_at_accuracy']),
    createdAtStr: json['created_at_str'] as String?,
    contentId: json['content_id'] as int,
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    addedBy: json['added_by'] == null
        ? null
        : Entity.fromJson(json['added_by'] as Map<String, dynamic>),
    addedById: json['added_by_id'] as int?,
    type: $enumDecode(_$CurationTypeEnumMap, json['type']),
    verifiedAt: json['verified_at'] == null
        ? null
        : DateTime.parse(json['verified_at'] as String),
    featuredAt: json['featured_at'] == null
        ? null
        : DateTime.parse(json['featured_at'] as String),
    undecidedAt: json['undecided_at'] == null
        ? null
        : DateTime.parse(json['undecided_at'] as String),
    link: json['link'] as String?,
    comment: json['comment'] as String?,
    pos: json['pos'] as int?,
    collectionId: json['collection_id'] as int?,
    collection: json['collection'] == null
        ? null
        : Collection.fromJson(json['collection'] as Map<String, dynamic>),
    sourceContentId: json['source_content_id'] as int?,
    sourceContent: json['source_content'] == null
        ? null
        : Content.fromJson(json['source_content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$_CurationToJson(_$_Curation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity_id': instance.entityId,
      'entity': instance.entity,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_at_accuracy':
          _$CurationCreatedAtAccuracyEnumMap[instance.createdAtAccuracy],
      'created_at_str': instance.createdAtStr,
      'content_id': instance.contentId,
      'content': instance.content,
      'added_by': instance.addedBy,
      'added_by_id': instance.addedById,
      'type': _$CurationTypeEnumMap[instance.type],
      'verified_at': instance.verifiedAt?.toIso8601String(),
      'featured_at': instance.featuredAt?.toIso8601String(),
      'undecided_at': instance.undecidedAt?.toIso8601String(),
      'link': instance.link,
      'comment': instance.comment,
      'pos': instance.pos,
      'collection_id': instance.collectionId,
      'collection': instance.collection,
      'source_content_id': instance.sourceContentId,
      'source_content': instance.sourceContent,
    };

const _$CurationCreatedAtAccuracyEnumMap = {
  CurationCreatedAtAccuracy.year: 'year',
  CurationCreatedAtAccuracy.month: 'month',
  CurationCreatedAtAccuracy.day: 'day',
  CurationCreatedAtAccuracy.hour: 'hour',
};

const _$CurationTypeEnumMap = {
  CurationType.internal: 'internal',
  CurationType.external: 'external',
  CurationType.internalCollection: 'internal_collection',
  CurationType.externalCollection: 'external_collection',
  CurationType.internalAsk: 'internal_ask',
  CurationType.externalAsk: 'external_ask',
  CurationType.later: 'later',
  CurationType.finished: 'finished',
};
