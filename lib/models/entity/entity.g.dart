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
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      hasUser: json['has_user'] as bool?,
      followersCount: json['followers_count'] as int?,
      followedEntitiesCount: json['followed_entities_count'] as int?,
      followedTopicsCount: json['followed_topics_count'] as int?,
      addedContentsCount: json['added_contents_count'] as int?,
      followedContentsCount: json['followed_contents_count'] as int?,
      twitter: json['twitter'] as String?,
      twitterID: json['twitter_id'] as int?,
      featuredAt: json['featured_at'] == null
          ? null
          : DateTime.parse(json['featured_at'] as String),
      insertedAt: json['inserted_at'] == null
          ? null
          : DateTime.parse(json['inserted_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_EntityToJson(_$_Entity instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'description': instance.description,
      'user': instance.user,
      'has_user': instance.hasUser,
      'followers_count': instance.followersCount,
      'followed_entities_count': instance.followedEntitiesCount,
      'followed_topics_count': instance.followedTopicsCount,
      'added_contents_count': instance.addedContentsCount,
      'followed_contents_count': instance.followedContentsCount,
      'twitter': instance.twitter,
      'twitter_id': instance.twitterID,
      'featured_at': instance.featuredAt?.toIso8601String(),
      'inserted_at': instance.insertedAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
