import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/channel/channel.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/identity.dart';

part 'channel_entity.freezed.dart';

part 'channel_entity.g.dart';
//contributor role ile ayni
enum ChannelRole {
  @JsonValue('author')
  author,
  @JsonValue('creator')
  creator,
  @JsonValue('speaker')
  speaker,
  @JsonValue('host')
  host,
  @JsonValue('guest')
  guest,
  @JsonValue('instructor')
  instructor
}

@freezed
class ChannelEntity with _$ChannelEntity {
  const factory ChannelEntity({
    int? id,
    ChannelRole? role,
    @JsonKey(name: 'entity_id', required: true) required int entityId,
    Entity? entity,
    @JsonKey(name:'channel_id', required: true) required int channelId,
    Channel? channel,
  }) = _ChannelEntity;

  factory ChannelEntity.fromJson(Map<String, Object?> json) => _$ChannelEntityFromJson(json);
}
