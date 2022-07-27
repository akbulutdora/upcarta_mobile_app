// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentFollowing _$$_ContentFollowingFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['entity_id', 'content_id'],
  );
  return _$_ContentFollowing(
    id: json['id'] as int?,
    entityId: json['entity_id'] as int,
    entity: json['entity'] == null
        ? null
        : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    contentId: json['content_id'] as int,
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$_ContentFollowingToJson(_$_ContentFollowing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity_id': instance.entityId,
      'entity': instance.entity?.toJson(),
      'content_id': instance.contentId,
      'content': instance.content?.toJson(),
    };
