import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:upcarta_mobile_app/models/entity/entity.dart';
import 'package:upcarta_mobile_app/models/entity/identity.dart';

part 'details.freezed.dart';

part 'details.g.dart';

@freezed
class Details with _$Details {
  const factory Details({
    @JsonKey(name: 'ratings_count') int? ratingsCount,
    double? rating,
    @JsonKey(name: 'likes_count') int? likesCount,
    @JsonKey(name: 'dislikes_count') int? dislikesCount,
    @JsonKey(name: 'retweets_count') int? retweetsCount,
    @JsonKey(name: 'comments_count') int? commentsCount,
    @JsonKey(name: 'views_count') int? viewsCount,
    @JsonKey(name: 'number_of_pages') int? numberOfPages,
    double? duration,
    String? asin,
    String? isbn,
    @JsonKey(name: 'isbn_13') String? isbn13,
    @JsonKey(name: 'episode_url') String? episodeUrl
  }) = _Details;

  factory Details.fromJson(Map<String, Object?> json) => _$DetailsFromJson(json);
}
