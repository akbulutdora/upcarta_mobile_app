import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'topic.freezed.dart';

part 'topic.g.dart';

@freezed
class Topic with _$Topic {
  const factory Topic({
    int? id,
    required String title,
    String? description,
    String? wikipedia,
    required String? slug,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'inserted_at') Timestamp? insertedAt,
    @JsonKey(name: 'updated_at') Timestamp? updatedAt,

  }) = _Topic;

  factory Topic.fromJson(Map<String, Object?> json) => _$TopicFromJson(json);
}
