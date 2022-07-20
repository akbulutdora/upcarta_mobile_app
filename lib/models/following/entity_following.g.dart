// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity_following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EntityFollowing _$$_EntityFollowingFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['followed_entity_id', 'following_entity_id'],
  );
  return _$_EntityFollowing(
    id: json['id'] as int?,
    followedEntityId: json['followed_entity_id'] as int,
    followedEntity: json['followed_entity'] == null
        ? null
        : Entity.fromJson(json['followed_entity'] as Map<String, dynamic>),
    followingEntityId: json['following_entity_id'] as int,
    followingEntity: json['following_entity'] == null
        ? null
        : Entity.fromJson(json['following_entity'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$$_EntityFollowingToJson(_$_EntityFollowing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'followed_entity_id': instance.followedEntityId,
      'followed_entity': instance.followedEntity,
      'following_entity_id': instance.followingEntityId,
      'following_entity': instance.followingEntity,
    };
