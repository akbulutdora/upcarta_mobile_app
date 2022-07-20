import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/content/topic.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/identity.dart';
import 'package:upcarta_mobile_app/models/models.dart';

part 'collection.freezed.dart';

part 'collection.g.dart';

enum CollectionType {
  @JsonValue('saved')
  saved,
  @JsonValue('finished')
  finished,
  // personal replaced with internal yaziyor
  @JsonValue('internal')
  internal,
  @JsonValue('external')
  contributor,
  @JsonValue('internal_ask')
  internalAsk,
  @JsonValue('external_ask')
  externalAsk
}
enum CollectionSort {
  @JsonValue('manual')
  manual,
  @JsonValue('recently_added')
  recentlyAdded,
  // personal replaced with internal yaziyor
  @JsonValue('creation_asc')
  creationAsc,
  @JsonValue('creation_desc')
  creationDesc,
  @JsonValue('popularity')
  popularity
}

enum CollectionVisibility{
  @JsonValue('private')
  private,
  @JsonValue('public')
  public
}

enum CollectionCreatedAtAccuracy{
  @JsonValue('year')
  year,
  @JsonValue('month')
  month,
  @JsonValue('day')
  day,
  @JsonValue('hour')
  hour,
}
@freezed
class Collection with _$Collection {
  const factory Collection({
    int? id,
    required String title,
    @JsonKey(name: 'entity_id',required: true) required int entityId,
    Entity? entity,
    @JsonKey(name: 'added_by') Entity? addedBy,
    @JsonKey(name: 'added_by_id') int? addedById,
    String? description,
    String? slug,
    required CollectionType type,
    CollectionSort? sort,
    @JsonKey(name: 'created_at_str') String? createdAtStr,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name:'created_at_accuracy')CollectionCreatedAtAccuracy? createdAtAccuracy,
    //todo: external ise required
    String? link,
    @JsonKey(name: 'source_content') Content? sourceContent,
    @JsonKey(name: 'source_content_id') int? sourceContentId,
    CollectionVisibility? visibility,
    @JsonKey(name: 'verified_at') DateTime? verifiedAt,
    @JsonKey(name: 'featured_at') DateTime? featuredAt,
    bool? recommended,
    @JsonKey(name: 'published_at') DateTime? publishedAt,
    @JsonKey(name: 'collection_topics') List<Topic>? collectionTopics,
    @JsonKey(name: 'inserted_at') DateTime? insertedAt,

  }) = _Collection;

  factory Collection.fromJson(Map<String, Object?> json) => _$CollectionFromJson(json);
}
