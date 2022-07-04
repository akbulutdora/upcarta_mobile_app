// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      collectionId: json['collectionId'] as String,
      collectionType:
          $enumDecode(_$CollectionTypeEnumMap, json['collectionType']),
      ownerId: json['ownerId'] as String,
      description:
          json['description'] as String? ?? 'This content has no description.',
      creationDate: json['creationDate'] as String,
      recommendersIDs: (json['recommendersIDs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      postIDs:
          (json['postIDs'] as List<dynamic>).map((e) => e as String).toList(),
      isAsk: json['isAsk'] as bool,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      isPrivate: json['isPrivate'] as bool,
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'collectionId': instance.collectionId,
      'collectionType': _$CollectionTypeEnumMap[instance.collectionType],
      'ownerId': instance.ownerId,
      'description': instance.description,
      'creationDate': instance.creationDate,
      'recommendersIDs': instance.recommendersIDs,
      'postIDs': instance.postIDs,
      'isAsk': instance.isAsk,
      'contentType': _$ContentTypeEnumMap[instance.contentType],
      'isPrivate': instance.isPrivate,
    };

const _$CollectionTypeEnumMap = {
  CollectionType.saved: 0,
  CollectionType.recommendations: 1,
  CollectionType.collection: 2,
  CollectionType.ask: 3,
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
