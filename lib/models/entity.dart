import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/upcarta_user.dart';

part 'entity.freezed.dart';

part 'entity.g.dart';

@freezed
class Entity with _$Entity {
  const factory Entity(
      {required int id,
      required String name,
      required String username,
      String? description,
      User? user,
      @JsonKey(name: 'has_user') bool? hasUser,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'followed_entities_count') int? followedEntitiesCount,
      @JsonKey(name: 'followed_topics_count') int? followedTopicsCount,
      @JsonKey(name: 'added_contents_count') int? addedContentsCount,
      @JsonKey(name: 'followed_contents_count') int? followedContentsCount,

      /// The Twitter name of the user
      String? twitter,

      /// The internal ID of the user from Twitter
      @JsonKey(name: 'twitter_id') int? twitterID,

      /// When the user was displayed in curations, this value will be [null]
      /// if the user was featured.
      @JsonKey(name: 'featured_at') DateTime? featuredAt,
      @JsonKey(name: 'inserted_at') DateTime? insertedAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt}) = _Entity;

  factory Entity.fromJson(Map<String, Object?> json) => _$EntityFromJson(json);
}
