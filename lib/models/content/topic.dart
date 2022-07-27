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

    /// max 50 characters
    required String title,

    String? description,
    String? wikipedia,

    /// auto-generated on the back-end (used for generating the SEO friendly URL of the topic)
    required String? slug,

    /// counter for the number of followers of that topic
    @JsonKey(name: 'followers_count') int? followersCount,

    /// counter for the number of contents curated under that topic
    @JsonKey(name: 'contents_count') int? contentsCount,

    @JsonKey(name: 'added_by') User? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,

    /// Used for better search
    /// Keywords, seperated by ",".
    String? keywords,

    @JsonKey(name: 'inserted_at') DateTime? insertedAt,

  }) = _Topic;

  factory Topic.fromJson(Map<String, Object?> json) => _$TopicFromJson(json);
}
