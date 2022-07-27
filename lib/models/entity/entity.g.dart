// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Entity _$$_EntityFromJson(Map<String, dynamic> json) => _$_Entity(
      id: json['id'] as int?,
      name: json['name'] as String,
      username: json['username'] as String,
      description: json['description'] as String?,
      hasUser: json['has_user'] as bool?,
      followersCount: json['followers_count'] as int?,
      followedEntitiesCount: json['followed_entities_count'] as int?,
      followedTopicsCount: json['followed_topics_count'] as int?,
      followedContentsCount: json['followed_contents_count'] as int?,
      addedBy: json['added_by'] == null
          ? null
          : Entity.fromJson(json['added_by'] as Map<String, dynamic>),
      addedById: json['added_by_id'] as int?,
      twitter: json['twitter'] as String?,
      website: json['website'] as String?,
      linkedin: json['linkedin'] as String?,
      wikipedia: json['wikipedia'] as String?,
      followingEntity: json['following_entity'] == null
          ? null
          : EntityFollowing.fromJson(
              json['following_entity'] as Map<String, dynamic>),
      channelEntities: (json['channel_entities'] as List<dynamic>?)
          ?.map((e) => ChannelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EntityToJson(_$_Entity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'description': instance.description,
      'has_user': instance.hasUser,
      'followers_count': instance.followersCount,
      'followed_entities_count': instance.followedEntitiesCount,
      'followed_topics_count': instance.followedTopicsCount,
      'followed_contents_count': instance.followedContentsCount,
      'added_by': instance.addedBy?.toJson(),
      'added_by_id': instance.addedById,
      'twitter': instance.twitter,
      'website': instance.website,
      'linkedin': instance.linkedin,
      'wikipedia': instance.wikipedia,
      'following_entity': instance.followingEntity?.toJson(),
      'channel_entities':
          instance.channelEntities?.map((e) => e.toJson()).toList(),
    };
