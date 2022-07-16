import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';

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
    @JsonKey(name: 'contents_count') int? contentsCount,
    @JsonKey(name: 'added_by') User? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,
    String? keywords,
    @JsonKey(name: 'inserted_at') DateTime? insertedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Topic;

  factory Topic.fromJson(Map<String, Object?> json) => _$TopicFromJson(json);
}
