// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      title: json['title'] as String,
      uId: json['uId'] as String,
      postId: json['postId'] as String,
      username: json['username'] as String,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      description:
          json['description'] as String? ?? 'This content has no description.',
      //createDate: DateTime.parse(json['createDate'] as String),
      createDate: json['createDate'].toDate() as DateTime,
      imageLocation: json['imageLocation'] as String,
      url: json['url'] as String,
      contentTopic: json['contentTopic'] as String,
      recommendationText: json['recommendationText'] as String,
      recommendersIDs: (json['recommendersIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'title': instance.title,
      'createDate': instance.createDate,
      'contentType': _$ContentTypeEnumMap[instance.contentType],
      'uId': instance.uId,
      'postId': instance.postId,
      'username': instance.username,
      'contentTopic': instance.contentTopic,
      'recommendersIDs': instance.recommendersIDs,
      'recommendationText': instance.recommendationText,
      'imageLocation': instance.imageLocation,
      'description': instance.description,
      'url': instance.url,
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
