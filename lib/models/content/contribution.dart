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
    ContributionRole? role,
    // TODO : contentin icinde Contribution bu ic ice giren classlara bak
    Content? content,
    @JsonKey(name: 'content_id', required: true) required int contentId,
    Entity? entity,
    @JsonKey(name: 'entity_id', required: true) required int entityId,
    int? pos,
    // iki tane entity var ?
    @JsonKey(name: 'added_by') Entity? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,
    @JsonKey(name: 'inserted_at') DateTime? insertedAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Contribution;

  factory Contribution.fromJson(Map<String, Object?> json) =>
      _$ContributionFromJson(json);
}
