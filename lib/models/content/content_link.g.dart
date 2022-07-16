// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentLink _$$_ContentLinkFromJson(Map<String, dynamic> json) =>
    _$_ContentLink(
      id: json['id'] as int?,
      link: json['link'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      slug: json['slug'] as String?,
      statusCode: json['status_code'] as int?,
      sourceId: json['source_id'] as String?,
      altSourceId: json['alt_source_id'] as String?,
      platformId: json['platform_id'] as int?,
      platform: json['platform'] == null
          ? null
          : Platform.fromJson(json['platform'] as Map<String, dynamic>),
      type: $enumDecodeNullable(_$LinkTypeEnumMap, json['type']),
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      contentId: json['content_id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      createdAtAccuracy: $enumDecodeNullable(
          _$CreatedAtAccuracyEnumMap, json['created_at_accuracy']),
      createdAtStr: json['created_at_str'] as String?,
      pos: json['pos'] as int?,
      syncedAt: json['synced_at'] == null
          ? null
          : DateTime.parse(json['synced_at'] as String),
    );

Map<String, dynamic> _$$_ContentLinkToJson(_$_ContentLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'title': instance.title,
      'description': instance.description,
      'slug': instance.slug,
      'status_code': instance.statusCode,
      'source_id': instance.sourceId,
      'alt_source_id': instance.altSourceId,
      'platform_id': instance.platformId,
      'platform': instance.platform,
      'type': _$LinkTypeEnumMap[instance.type],
      'content': instance.content,
      'content_id': instance.contentId,
      'created_at': instance.createdAt?.toIso8601String(),
      'created_at_accuracy':
          _$CreatedAtAccuracyEnumMap[instance.createdAtAccuracy],
      'created_at_str': instance.createdAtStr,
      'pos': instance.pos,
      'synced_at': instance.syncedAt?.toIso8601String(),
    };

const _$LinkTypeEnumMap = {
  LinkType.resource: 'resource',
  LinkType.content: 'content',
  LinkType.channel: 'channel',
  LinkType.playlist: 'playlist',
  LinkType.episode: 'episode',
  LinkType.video: 'video',
  LinkType.audio: 'audio',
};

const _$CreatedAtAccuracyEnumMap = {
  CreatedAtAccuracy.year: 'year',
  CreatedAtAccuracy.month: 'month',
  CreatedAtAccuracy.day: 'day',
  CreatedAtAccuracy.hour: 'hour',
};
