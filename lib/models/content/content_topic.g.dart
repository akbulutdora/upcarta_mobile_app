// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_topic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentTopic _$$_ContentTopicFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['content_id', 'topic_id'],
  );
  return _$_ContentTopic(
    id: json['id'] as int?,
    content: json['content'] == null
        ? null
        : Content.fromJson(json['content'] as Map<String, dynamic>),
    contentId: json['content_id'] as int,
    topic: json['topic'] == null
        ? null
        : Topic.fromJson(json['topic'] as Map<String, dynamic>),
    topicId: json['topic_id'] as int,
    pos: json['pos'] as int?,
    addedBy: json['added_by'] == null
        ? null
        : User.fromJson(json['added_by'] as Map<String, dynamic>),
    addedById: json['added_by_id'] as int?,
  );
}

Map<String, dynamic> _$$_ContentTopicToJson(_$_ContentTopic instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content?.toJson(),
      'content_id': instance.contentId,
      'topic': instance.topic?.toJson(),
      'topic_id': instance.topicId,
      'pos': instance.pos,
      'added_by': instance.addedBy?.toJson(),
      'added_by_id': instance.addedById,
    };
