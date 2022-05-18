// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      title: json['title'] as String,
      id: json['id'] as String,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      description:
          json['description'] as String? ?? "This content has no description.",
      createDate: DateTime.parse(json['createDate'] as String),
      image: json['image'] as String,
      posterID: json['posterID'] as String,
      link: json['link'] as String,
      creatorID: json['creatorID'] as String,
      contentTopic: json['contentTopic'] as String,
      recommendationText: json['recommendationText'] as String,
      recommendersIDs: (json['recommendersIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'contentType': _$ContentTypeEnumMap[instance.contentType],
      'description': instance.description,
      'createDate': instance.createDate.toIso8601String(),
      'image': instance.image,
      'link': instance.link,
      'posterID': instance.posterID,
      'creatorID': instance.creatorID,
      'contentTopic': instance.contentTopic,
      'recommendersIDs': instance.recommendersIDs,
      'recommendationText': instance.recommendationText,
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
