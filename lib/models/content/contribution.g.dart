// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contribution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Contribution _$$_ContributionFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['content_id', 'entity_id'],
  );
  return _$_Contribution(
    id: json['id'] as int?,
    role: $enumDecodeNullable(_$ContributionRoleEnumMap, json['role']),
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    contentId: json['content_id'] as int,
    entity: json['entity'] == null
        ? null
        : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    entityId: json['entity_id'] as int,
    pos: json['pos'] as int?,
    addedBy: json['added_by'] == null
        ? null
        : Entity.fromJson(json['added_by'] as Map<String, dynamic>),
    addedById: json['added_by_id'] as int?,
  );
}

Map<String, dynamic> _$$_ContributionToJson(_$_Contribution instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ContributionRoleEnumMap[instance.role],
      'content': instance.content,
      'content_id': instance.contentId,
      'entity': instance.entity,
      'entity_id': instance.entityId,
      'pos': instance.pos,
      'added_by': instance.addedBy,
      'added_by_id': instance.addedById,
    };

const _$ContributionRoleEnumMap = {
  ContributionRole.author: 'author',
  ContributionRole.creator: 'creator',
  ContributionRole.speaker: 'speaker',
  ContributionRole.host: 'host',
  ContributionRole.guest: 'guest',
  ContributionRole.instructor: 'instructor',
};
