import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';

part 'entity_following.freezed.dart';

part 'entity_following.g.dart';

@freezed
class EntityFollowing with _$EntityFollowing {
  const factory EntityFollowing({
    int? id,
    @JsonKey(name: 'followed_entity_id', required: true) required int followedEntityId,
    @JsonKey(name:'followed_entity')Entity? followedEntity,
    @JsonKey(name: 'following_entity_id', required: true) required int followingEntityId,
    @JsonKey(name:'following_entity')Entity? followingEntity,
  }) = _EntityFollowing;

  factory EntityFollowing.fromJson(Map<String, Object?> json) => _$EntityFollowingFromJson(json);
}
