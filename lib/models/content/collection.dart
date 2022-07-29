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
  // documantasyonda personal olarak geciyor ama internal ile degistirilecek diyor
  @JsonValue('personal')
  personal,
  @JsonValue('external')
  contributor,
  @JsonValue('internal_ask')
  internalAsk,
  @JsonValue('external_ask')
  externalAsk,
  @JsonValue('later')
  later
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

    /// Title of the collection.
    /// Max 180 characters.
    required String title,

    /// Entity object id who originally created the collection.
    @JsonKey(name: 'entity_id',required: true) required int entityId,

    /// Entity object who originally created the collection.
    Entity? entity,

    /// Entity object who added the collection.
    @JsonKey(name: 'added_by') Entity? addedBy,

    /// Entity object id who added the collection.
    @JsonKey(name: 'added_by_id') int? addedById,

    /// Description of the collection
    String? description,

    /// Auto-generated on back-end. Can be used to generate the link.
    String? slug,

    /// later, finished, internal, external, internal_ask, external_ask
    required CollectionType type,

    /// manual, recently_added, creation_asc, creation_desc, popularity
    CollectionSort? sort,

    @JsonKey(name: 'created_at_str') String? createdAtStr,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name:'created_at_accuracy')CollectionCreatedAtAccuracy? createdAtAccuracy,

    /// If the collection is external (type is external or external_ask) then a link is required.
    String? link,

    /// Content object that indicates the source of the collection.
    @JsonKey(name: 'source_content') Content? sourceContent,

    /// Content object id that indicates the source of the collection.
    @JsonKey(name: 'source_content_id') int? sourceContentId,

    /// private, public
    CollectionVisibility? visibility,

    /// Indicates whether the collection/ask is verified.
    @JsonKey(name: 'verified_at') DateTime? verifiedAt,

    /// Indicates whether the collection/ask is featured.
    @JsonKey(name: 'featured_at') DateTime? featuredAt,

    /// If TRUE, all the curations under the collection also appear as recommendations.
    bool? recommended,

    /// Indicates whether the collection is published.
    @JsonKey(name: 'published_at') DateTime? publishedAt,

    /// List of topics associated with the collection
    @JsonKey(name: 'collection_topics') List<Topic>? collectionTopics,

    @JsonKey(name: 'inserted_at') DateTime? insertedAt,

  }) = _Collection;

  factory Collection.fromJson(Map<String, Object?> json) => _$CollectionFromJson(json);
}