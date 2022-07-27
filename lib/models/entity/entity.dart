import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/channel/channel_entity.dart';
import 'package:upcarta_mobile_app/models/following/entity_following.dart';

part 'entity.freezed.dart';

part 'entity.g.dart';

@freezed
class Entity with _$Entity {
  const factory Entity({
    int? id,
    /// max 50 characters
    required String name,

    /// alphanumeric username
    required String username,
    String? description,
    @JsonKey(name: 'has_user') bool? hasUser,

    /// counter for the number of followers
    @JsonKey(name: 'followers_count') int? followersCount,

    /// counter for the number of followed entities
    @JsonKey(name: 'followed_entities_count') int? followedEntitiesCount,

    /// counter for the number of followed topics
    @JsonKey(name: 'followed_topics_count') int? followedTopicsCount,

    /// counter for the number of followed contents
    @JsonKey(name: 'followed_contents_count') int? followedContentsCount,

    @JsonKey(name: 'added_by') Entity? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,

    /// The Twitter name of the user ( min 1, max 15 characters )
    String? twitter,

    /// Website URL
    String? website,

    /// Linkedin URL
    String? linkedin,

    /// Wikipedia URL
    String? wikipedia,

    /// Following Entity object. Indicates whether the entity is followed by the authenticated user.
    @JsonKey(name: 'following_entity') EntityFollowing? followingEntity,

    /// List of Channel Entity objects.
    @JsonKey(name: 'channel_entities') List<ChannelEntity>? channelEntities,
  }) = _Entity;

  factory Entity.fromJson(Map<String, Object?> json) => _$EntityFromJson(json);
}