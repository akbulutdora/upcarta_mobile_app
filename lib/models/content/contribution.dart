import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'upcarta_content.dart';

part 'contribution.freezed.dart';

part 'contribution.g.dart';

enum ContributionRole {
  @JsonValue('author')
  author,
  @JsonValue('creator')
  creator,
  @JsonValue('speaker')
  speaker,
  @JsonValue('host')
  host,
  @JsonValue('guest')
  guest,
  @JsonValue('instructor')
  instructor
}

@freezed
class Contribution with _$Contribution {
  const factory Contribution({
    int? id,

    /// (author, creator, speaker, host, guest, instructor)
    ContributionRole? role,
    Content? content,
    /// related content id
    @JsonKey(name: 'content_id', required: true) required int contentId,
    Entity? entity,
    @JsonKey(name: 'entity_id', required: true) required int entityId,

    /// position of appearance
    int? pos,
    // iki tane entity var ?
    /// Entity object (profile) who added the contribution
    @JsonKey(name: 'added_by') Entity? addedBy,

    /// Entity object (profile) id who added the contribution
    @JsonKey(name: 'added_by_id') int? addedById,

  }) = _Contribution;

  factory Contribution.fromJson(Map<String, Object?> json) =>
      _$ContributionFromJson(json);
}
