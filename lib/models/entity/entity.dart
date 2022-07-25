import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/following/entity_following.dart';

part 'entity.freezed.dart';

part 'entity.g.dart';

@freezed
class Entity with _$Entity {
  const factory Entity({
    int? id,
    required String name,
    required String username,
    String? description,
    @JsonKey(name: 'has_user') bool? hasUser,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'followed_entities_count') int? followedEntitiesCount,
    @JsonKey(name: 'followed_topics_count') int? followedTopicsCount,
    @JsonKey(name: 'followed_contents_count') int? followedContentsCount,
    @JsonKey(name: 'added_by') Entity? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,

    /// The Twitter name of the user
    String? twitter,
    String? website,
    String? linkedin,
    String? wikipedia,
    @JsonKey(name: 'following_entity') EntityFollowing? followingEntity,
    @JsonKey(name: 'channel_entities') List<Entity>? channelEntities,
  }) = _Entity;

  factory Entity.fromJson(Map<String, Object?> json) => _$EntityFromJson(json);
}