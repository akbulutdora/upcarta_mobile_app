// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Details _$$_DetailsFromJson(Map<String, dynamic> json) => _$_Details(
      ratingsCount: json['ratings_count'] as int?,
      rating: (json['rating'] as num?)?.toDouble(),
      likesCount: json['likes_count'] as int?,
      dislikesCount: json['dislikes_count'] as int?,
      retweetsCount: json['retweets_count'] as int?,
      commentsCount: json['comments_count'] as int?,
      viewsCount: json['views_count'] as int?,
      numberOfPages: json['number_of_pages'] as int?,
      duration: (json['duration'] as num?)?.toDouble(),
      asin: json['asin'] as String?,
      isbn: json['isbn'] as String?,
      isbn13: json['isbn_13'] as String?,
      episodeUrl: json['episode_url'] as String?,
    );

Map<String, dynamic> _$$_DetailsToJson(_$_Details instance) =>
    <String, dynamic>{
      'ratings_count': instance.ratingsCount,
      'rating': instance.rating,
      'likes_count': instance.likesCount,
      'dislikes_count': instance.dislikesCount,
      'retweets_count': instance.retweetsCount,
      'comments_count': instance.commentsCount,
      'views_count': instance.viewsCount,
      'number_of_pages': instance.numberOfPages,
      'duration': instance.duration,
      'asin': instance.asin,
      'isbn': instance.isbn,
      'isbn_13': instance.isbn13,
      'episode_url': instance.episodeUrl,
    };
