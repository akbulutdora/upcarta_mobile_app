import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/models.dart';

part 'content_following.freezed.dart';

part 'content_following.g.dart';

@freezed
class ContentFollowing with _$ContentFollowing {
  const factory ContentFollowing({
    int? id,
    @JsonKey(name: 'entity_id', required: true) required int entityId,
    Entity? entity,
    @JsonKey(name: 'content_id', required: true)required int contentId,
    Content? content,
  }) = _ContentFollowing;

  factory ContentFollowing.fromJson(Map<String, Object?> json) => _$ContentFollowingFromJson(json);
}
