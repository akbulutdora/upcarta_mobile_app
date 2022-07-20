// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChannelEntity _$$_ChannelEntityFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['entity_id', 'channel_id'],
  );
  return _$_ChannelEntity(
    id: json['id'] as int?,
    role: $enumDecodeNullable(_$ChannelRoleEnumMap, json['role']),
    entityId: json['entity_id'] as int,
    entity: json['entity'] == null
        ? null
        : Entity.fromJson(json['entity'] as Map<String, dynamic>),
    channelId: json['channel_id'] as int,
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$_ChannelEntityToJson(_$_ChannelEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': _$ChannelRoleEnumMap[instance.role],
      'entity_id': instance.entityId,
      'entity': instance.entity,
      'channel_id': instance.channelId,
      'channel': instance.channel,
    };

const _$ChannelRoleEnumMap = {
  ChannelRole.author: 'author',
  ChannelRole.creator: 'creator',
  ChannelRole.speaker: 'speaker',
  ChannelRole.host: 'host',
  ChannelRole.guest: 'guest',
  ChannelRole.instructor: 'instructor',
};
