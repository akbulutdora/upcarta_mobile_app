import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/content/topic.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/models.dart';

part 'topic_following.freezed.dart';

part 'topic_following.g.dart';

@freezed
class TopicFollowing with _$TopicFollowing {
  const factory TopicFollowing({
    int? id,
    @JsonKey(name: 'entity_id', required: true) required int entityId,
    Entity? entity,
    @JsonKey(name: 'topic_id',required: true) required int topicId,
    Topic? topic,
  }) = _TopicFollowing;

  factory TopicFollowing.fromJson(Map<String, Object?> json) => _$TopicFollowingFromJson(json);
}
