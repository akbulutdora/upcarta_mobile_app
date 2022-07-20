// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContentLink _$$_ContentLinkFromJson(Map<String, dynamic> json) =>
    _$_ContentLink(
      id: json['id'] as int?,
      link: json['link'] as String,
      content: json['content'] == null
          ? null
          : Content.fromJson(json['content'] as Map<String, dynamic>),
      contentId: json['content_id'] as int?,
      pos: json['pos'] as int?,
      body: json['body'] as String?,
      hasEmbed: json['has_embed'] as bool?,
      hasRatings: json['has_ratings'] as bool?,
      episodeNumber: json['episode_number'] as int?,
      duration: json['duration'] as int?,
      details: json['details'] == null
          ? null
          : Details.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ContentLinkToJson(_$_ContentLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'content': instance.content?.toJson(),
      'content_id': instance.contentId,
      'pos': instance.pos,
      'body': instance.body,
      'has_embed': instance.hasEmbed,
      'has_ratings': instance.hasRatings,
      'episode_number': instance.episodeNumber,
      'duration': instance.duration,
      'details': instance.details?.toJson(),
    };
