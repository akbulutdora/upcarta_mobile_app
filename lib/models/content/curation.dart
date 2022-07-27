import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/content/contribution.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/upcarta_user.dart';
import 'package:upcarta_mobile_app/models/content/upcarta_content.dart';
import 'package:upcarta_mobile_app/models/content/platform.dart';
import 'package:upcarta_mobile_app/models/content/collection.dart';

part 'curation.freezed.dart';

part 'curation.g.dart';

//ayni enumlari farkli isimlendirmek lazim mi farkli bir yerde mi tutmaliydik
enum CurationCreatedAtAccuracy{
  @JsonValue('year')
  year,
  @JsonValue('month')
  month,
  @JsonValue('day')
  day,
  @JsonValue('hour')
  hour,
}
enum CurationType{
  @JsonValue('internal')
  internal,
  @JsonValue('external')
  external,
  @JsonValue('internal_collection')
  internalCollection,
  @JsonValue('external_collection')
  externalCollection,
  @JsonValue('internal_ask')
  internalAsk,
  @JsonValue('external_ask')
  externalAsk,
  @JsonValue('later')
  later,
  @JsonValue('finished')
  finished,
}

@freezed
class Curation with _$Curation {
  const factory Curation({
    int? id,
    @JsonKey(name: 'entity_id',required: true)required int entityId,
    Entity? entity,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'created_at_accuracy') CurationCreatedAtAccuracy? createdAtAccuracy,
    @JsonKey(name: 'created_at_str') String? createdAtStr,
    @JsonKey(name: 'content_id', required: true)required int contentId,
    Content? content,

    @JsonKey(name: 'added_by') Entity? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,

    /// internal, external, internal_collection, external_collection, internal_ask, external_ask, later, finished
    required CurationType type,

    /// Indicates whether the curation is verified
    @JsonKey(name: 'verified_at') DateTime? verifiedAt,

    /// Indicated whether the curation is featured.
    @JsonKey(name: 'featured_at') DateTime? featuredAt,

    @JsonKey(name: 'undecided_at') DateTime? undecidedAt,

    /// Source URL of the curation
    String? link,
    String? comment,

    /// order of appearance
    int? pos,

    @JsonKey(name: 'collection_id')int? collectionId,
    Collection? collection,
    @JsonKey(name: 'source_content_id') int? sourceContentId,
    @JsonKey(name: 'source_content') Content? sourceContent,

  }) = _Curation;

  factory Curation.fromJson(Map<String, Object?> json) => _$CurationFromJson(json);
}
