// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      title: json['title'] as String,
      id: json['id'] as int,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      description:
          json['description'] as String? ?? "This content has no description.",
      created_at: json['created_at'] as String,
      image: json['image'] as String,
      added_by_id: json['added_by_id'] as String,
      link: json['link'] as String,
      author_id: json['author_id'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'contentType': _$ContentTypeEnumMap[instance.contentType],
      'description': instance.description,
      'created_at': instance.created_at,
      'image': instance.image,
      'link': instance.link,
      'added_by_id': instance.added_by_id,
      'author_id': instance.author_id,
    };

const _$ContentTypeEnumMap = {
  ContentType.video: 0,
  ContentType.article: 1,
  ContentType.podcastEpisode: 2,
  ContentType.book: 3,
  ContentType.course: 4,
  ContentType.tweet: 5,
  ContentType.presentation: 6,
  ContentType.paper: 7,
  ContentType.audio: 8,
  ContentType.documentary: 9,
  ContentType.website: 10,
  ContentType.report: 11,
  ContentType.transcript: 12,
  ContentType.forumPost: 13,
  ContentType.movie: 14,
  ContentType.series: 15,
  ContentType.channel: 16,
  ContentType.blog: 17,
  ContentType.newsletter: 18,
  ContentType.podcast: 19,
  ContentType.tvEpisode: 20,
};
