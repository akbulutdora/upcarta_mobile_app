import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';
import 'package:upcarta_mobile_app/models/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/topic.dart';

part 'content_topic.freezed.dart';

part 'content_topic.g.dart';

@freezed
class ContentTopic with _$ContentTopic {
  const factory ContentTopic({
    int? id,
    // TODO: content topic contentin icerisinde yer aliyor(? mu) bunun nasil yapildigina bak
    Content? content,
    // TODO: jsonkey kullanilarak required boyle mi yapiliyor
    @JsonKey(name: 'content_id',required: true) int contentId,
    Topic? topic,
    @JsonKey(name: 'topic_id',required : true) int topicId,
    int? pos,
    @JsonKey(name: 'added_by') User? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,
    @JsonKey(name: 'inserted_at') DateTime? insertedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,

  }) = _ContentTopic;

  factory ContentTopic.fromJson(Map<String, Object?> json) => _$ContentTopicFromJson(json);
}
