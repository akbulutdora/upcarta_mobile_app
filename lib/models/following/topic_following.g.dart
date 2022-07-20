// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopicFollowing _$$_TopicFollowingFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['entity_id', 'topic_id'],
  );
  return _$_TopicFollowing(
    id: json['id'] as int?,
    entityId: json['entity_id'] as int,
    entity: json['entity'] == null
        ? null
        : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    topicId: json['topic_id'] as int,
    topic: json['topic'] == null
        ? null
        : Topic.fromJson(json['topic'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$_TopicFollowingToJson(_$_TopicFollowing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity_id': instance.entityId,
      'entity': instance.entity,
      'topic_id': instance.topicId,
      'topic': instance.topic,
    };
